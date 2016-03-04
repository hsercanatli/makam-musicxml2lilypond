# coding=utf-8
import os
import json
import xml.etree.ElementTree as eT
import sqlite3
import codecs

__author__ = 'hsercanatli', 'burakuyar', 'andresferrero', 'sertansenturk'


class CommentHandler(eT.XMLTreeBuilder):
    def __init__(self):
        eT.XMLTreeBuilder.__init__(self)
        # assumes ElementTree 1.2.X
        self._parser.CommentHandler = self.handle_comment
        self.mapping = {}

    def handle_comment(self, data):
        self._target.start("symbtrid", {})
        if data and 'symbtr_txt_note_index' in data:
            data = data.replace('symbtr_txt_note_index ', '')
        self._target.data(data)
        self._target.end("symbtrid")


class ScoreConverter(object):
    def __init__(self, name):
        self.parser = CommentHandler()
        # io information
        self.file = name
        self.ly_stream = []

        # setting the xml tree
        self.tree = eT.parse(self.file, self.parser)
        self.root = self.tree.getroot()

        # koma definitions
        self.makam_accidentals = {'quarter-flat': '-1',
                                  'slash-flat': '-4',
                                  'flat': '-5',
                                  'double-slash-flat': '-8',
                                  'quarter-sharp': '+1',
                                  'sharp': '+4',
                                  'slash-quarter-sharp': '+5',
                                  'slash-sharp': '+8'}

        # octaves and accidentals dictionary
        self.octaves = {"2": ",", "3": "", "4": "\'", "5": "\'\'", "6": "\'\'\'", "7": "\'\'\'\'", "r": ""}
        self.accidentals = {"-1": "fc", "-4": "fb", "-5": "fk", "-8": "fbm",
                            "1": "c", "4": "b", "5": "k", "8": "bm", "0": ""}

        # notes and accidentals dictionary lilypond
        self.notes_western2lily = {"g": "4", "a": "5", "b": "6", "c": "7", "d": "8", "e": "9", "f": "10"}

        self.notes_keyaccidentals = {"-8": "(- BUYUKMUCENNEP)", "-5": "(- KUCUK)", "-4": "(- BAKIYE)", "-1": "(- KOMA)",
                                     "+8": "BUYUKMUCENNEP", "+5": "KUCUK", "+4": "BAKIYE", "+1": "KOMA"}

        self.mapping = []

        # tempo
        self.bpm = float(self.root.find('part/measure/direction/sound').attrib['tempo'])
        self.divisions = float(self.root.find('part/measure/attributes/divisions').text)
        self.qnotelen = 60000 / self.bpm

        # makam and usul
        self.information = None

        # accidentals
        self.keysig_accs = []
        self.keysig_keys = []

        # list of info of an individual note fetched from xml file
        self.measure = []

        # getting beats and beat type
        self.beat_type = self.bpm = self.root.find('part/measure/attributes/time/beat-type').text
        self.beats = self.bpm = self.root.find('part/measure/attributes/time/beats').text

    def read_musicxml(self):
        # getting key signatures
        keysig = {}  # keys: notes, values: type of note accident
        for xx, key in enumerate(self.root.findall('part/measure/attributes/key/key-step')):
            keysig[key.text] = self.root.findall('part/measure/attributes/key/key-accidental')[xx].text

        '''
        for e in self.root.findall('part/measure/attributes/key/key-step'):
            #print e.text
            self.keysig_keys.append(e.text.lower())
        for e in self.root.findall('part/measure/attributes/key/key-accidental'):
            #print e.text
            self.keysig_accs.append(self.list_accidentals[e.text])
        '''

        # makam and usul information
        if self.root.find('part/measure/direction/direction-type/words').text:  # if makam and usul exist
            cultural_info = self.root.find('part/measure/direction/direction-type/words').text
            makam = u''.join(cultural_info.split(",")[0].split(": ")[1].lower()).encode('utf-8').strip()[0]
            usul = u''.join(cultural_info.split(",")[1].split(": ")[1].lower()).encode('utf-8').strip()[0]
        else:
            print "Makam and Usul information do not exist."

        # reading the xml measure by measure
        for measure_index, measure in enumerate(self.root.findall('part/measure')):
            temp_measure = []

            # all notes in the current measure
            for note_index, note in enumerate(measure.findall('note')):

                # pitch and octave information of the current note

                if note.find("symbtrid").text:  # symbtrid
                    extra = int(note.find("symbtrid").text)

                if note.find('pitch') is not None:  # if pitch
                    if note.find('pitch/step').text:  # pitch step
                        step = note.find('pitch/step').text.lower()
                    if note.find('pitch/octave').text:  # pitch octave
                        octave = note.find('pitch/octave').text
                    rest = 0

                elif note.find('rest') is not None:  # if rest
                    rest = 1
                    step = 'r'
                    octave = 'r'

                dur = None  # duration
                if note.find('duration') is not None:
                    dur = note.find('duration').text

                # accident inf
                if note.find('accidental') is not None:
                    acc = self.makam_accidentals[note.find('accidental').text]
                else:
                    acc = 0

                # dotted or not
                if note.find('dot') is not None:
                    dot = 1
                else:
                    dot = 0

                # tuplet or not
                try:
                    tuplet = note.find('time-modification')
                    if isinstance(acc, None):
                        tuplet = 0
                    else:
                        tuplet = 1
                except:
                    tuplet = 0

                # lyrics
                try:
                    lyric = note.find('lyric/text').text
                    if isinstance(acc, None):
                        lyric = ""
                    else:
                        lyric = lyric
                except:
                    lyric = ""

                if dur is not None:
                    # appending attributes to the temp note
                    normal_dur = int(self.qnotelen * float(dur) / self.divisions) / self.qnotelen
                    temp_note = [step, oct, acc, dot, tuplet, rest, normal_dur, extra, lyric]
                    temp_measure.append(temp_note)

            # adding temp measure to the measure
            self.measure.append(temp_measure)
        return makam, usul

    def ly_writer(self, makam, usul):
        curr_path = os.path.dirname(os.path.abspath(__file__)) + "/data"
        # connecting database, trying to get information for beams in lilypond
        conn = sqlite3.connect(os.path.join(curr_path, "makam_db"))
        c = conn.cursor()

        # Starting from 4 because of the lilypond header, defined in main function
        line = 6
        # getting the components for the given makam
        c.execute('SELECT * FROM usul WHERE NAME="{0}"'.format(usul.title()))
        data = c.fetchone()
        # if beam information is exist
        if data is not None:
            if data[-1] is not None:
                strokes = data[-1].replace("+", " ")
                self.ly_stream.append('''\n\t\\set Staff.beatStructure = #\'({0})\n'''.format(strokes))
                line += 2
        if data is None:
            c.execute('SELECT * FROM usul WHERE NAMEENG="{0}"'.format(usul.lower()))
            data = c.fetchone()
            if data is not None:
                if data[-1] is not None:
                    strokes = data[-1].replace("+", " ")
                    self.ly_stream.append('''\n\t\\set Staff.beatStructure = #\'({0})\n'''.format(strokes))
                    line += 2

        self.ly_stream.append("\n\t\\time")
        line += 1

        # time signature
        try:
            self.ly_stream.append(self.beats + "/" + self.beat_type)
        except:
            print("No time signature!!!")

        self.ly_stream.append("\n\t\\clef treble \n\t\\set Staff.keySignature = #`(")
        line += 2

        accidentals_check = []
        temp_keysig = ""
        for i in range(0, len(self.keysig_keys)):
            accidentals_check.append(self.keysig_keys[i] + self.accidentals[self.keysig_accs[i].replace("+", "")])
            temp_keysig += "("
            temp_keysig += "( 0 . " + str(self.notes_western2lily[self.keysig_keys[i]]) + "). , " + str(
                self.notes_keyaccidentals[self.keysig_accs[i]])
            temp_keysig += ")"

            self.ly_stream.append(temp_keysig)
            temp_keysig = ""

        self.ly_stream.append(")")
        print accidentals_check

        for xx, measure in enumerate(self.measure):
            self.ly_stream.append("\n\t")
            line += 1
            self.ly_stream.append("{")

            tuplet = 0

            pos = 0
            for note in measure:
                temp_note = "\n\t"
                line += 1
                temp_dur = 0
                # TODO: We don't show the grace notes, for now
                if note[6] is not None:
                    temp_dur = 4 / note[6]  # normal duration

                # dotted
                if note[3] == 1:  # dot flag
                    temp_note += str(note[0])  # step
                    temp_note += self.accidentals[str(note[2])]  # accidental
                    temp_note += self.octaves[str(note[1])]  # octave

                    temp_dur = temp_dur * 3 / 2
                    temp_note += str(int(temp_dur))
                    temp_note += "."

                # tuplet
                elif note[4] == 1:  # tuplet flag
                    if tuplet == 0:
                        tuplet = 4
                        temp_note += "\\tuplet 3/2 {"
                    temp_note += str(note[0])  # step
                    temp_note += self.accidentals[str(note[2])]  # accidental
                    temp_note += self.octaves[str(note[1])]  # octave

                    temp_dur = temp_dur * 2 / 3
                    temp_note += str(int(temp_dur))

                    tuplet -= 1
                    if tuplet == 1:
                        temp_note += " }"
                        tuplet = 0

                # nor
                else:
                    temp_note += str(note[0])
                    temp_note += self.accidentals[str(note[2])]
                    temp_note += self.octaves[str(note[1])]
                    temp_note += str(int(temp_dur))

                if note[7]:
                    self.mapping.append((note[7], pos + 4, line))

                # lyrics
                if note[-1] is not "":
                    if len(note[-1]) > 1:
                        if note[-1][1].isupper():
                            temp_note += '''^\\markup { \\left-align {\\bold \\translate #'(1 . 0) \"''' + \
                                         u''.join(note[-1]).encode('utf-8').strip() + '''\"}}'''
                        else:
                            temp_note += '''_\\markup { \\center-align {\\smaller \\translate #'(0 . -2.5) \"''' + \
                                         u''.join(note[-1]).encode('utf-8').strip() + '''\"}}'''
                    else:
                        temp_note += '''_\\markup { \\center-align {\\smaller \\translate #'(0 . -2.5) \"''' + \
                                     u''.join(note[-1]).encode('utf-8').strip() + '''\"}}'''

                pos += len(temp_note) + 1
                self.ly_stream.append(temp_note)
            self.ly_stream.append("} %measure " + str(xx + 1))
        self.ly_stream.append('''\n\t\\bar \"|.\"''')

    def run(self):
        ly_initial = """
\\include "makam.ly"
{
  %\\override Score.SpacingSpanner.strict-note-spacing = ##t
  %\\set Score.proportionalNotationDuration = #(ly:make-moment 1/8)
             """
        makam, usul = self.read_musicxml()
        self.ly_writer(makam, usul)
        ly_string = " ".join(self.ly_stream)

        fname = self.file.split(".")[0]
        outfile = codecs.open(fname + ".ly", 'w')
        outfile.write(ly_initial + ly_string + "\n}")
        outfile.close()

        outfile = codecs.open(fname + ".json", 'w')
        json.dump(self.mapping, outfile)
        outfile.close()
