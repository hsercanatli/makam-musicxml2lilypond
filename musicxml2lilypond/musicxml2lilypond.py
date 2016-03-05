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
    def __init__(self):
        # io information

        # octaves and accidentals dictionary
        self.octaves = {"2": ",", "3": "", "4": "\'", "5": "\'\'", "6": "\'\'\'", "7": "\'\'\'\'", "r": ""}
        self.accidentals = {"-1": "fc", "-4": "fb", "-5": "fk", "-8": "fbm",
                            "1": "c", "4": "b", "5": "k", "8": "bm", "0": ""}

        # notes and accidentals dictionary lilypond
        self.notes_western2lily = {"g": "4", "a": "5", "b": "6", "c": "7", "d": "8", "e": "9", "f": "10"}

        self.notes_keyaccidentals = {'double-slash-flat': "(- BUYUKMUCENNEP)",
                                     'flat': "(- KUCUK)",
                                     'slash-flat': "(- BAKIYE)",
                                     'quarter-flat': "(- KOMA)",
                                     'slash-sharp': "BUYUKMUCENNEP",
                                     'slash-quarter-sharp': "KUCUK",
                                     'sharp': "BAKIYE",
                                     'quarter-sharp': "KOMA"}

        self.mapping = []
        # makam and usul
        self.information = None


        # list of info of an individual note fetched from xml file

    @staticmethod
    def read_musicxml(fname):
        # koma definitions
        """

        :param fname:
        :rtype: object
        """
        makam_accidents = {'quarter-flat': '-1',
                           'slash-flat': '-4',
                           'flat': '-5',
                           'double-slash-flat': '-8',
                           'quarter-sharp': '+1',
                           'sharp': '+4',
                           'slash-quarter-sharp': '+5',
                           'slash-sharp': '+8'}

        # setting the xml tree
        parser = CommentHandler()
        tree = eT.parse(fname, parser)
        root = tree.getroot()

        # tempo
        bpm = float(root.find('part/measure/direction/sound').attrib['tempo'])
        divisions = float(root.find('part/measure/attributes/divisions').text)
        qnotelen = 60000 / bpm


        # getting beats and beat type
        beat_type = root.find('part/measure/attributes/time/beat-type').text
        beats = root.find('part/measure/attributes/time/beats').text


        # getting key signatures
        keysig = {}  # keys: notes, values: type of note accident
        for xx, key in enumerate(root.findall('part/measure/attributes/key/key-step')):
            keysig[key.text] = root.findall('part/measure/attributes/key/key-accidental')[xx].text

        # makam and usul information
        if root.find('part/measure/direction/direction-type/words').text:  # if makam and usul exist
            cultural_info = root.find('part/measure/direction/direction-type/words').text
            makam = u''.join(cultural_info.split(",")[0].split(": ")[1]).encode('utf-8').strip()
            form = u''.join(cultural_info.split(",")[1].split(": ")[1]).encode('utf-8').strip()
            usul = u''.join(cultural_info.split(",")[2].split(": ")[1]).encode('utf-8').strip()
        else:
            print "Makam and Usul information do not exist."

        measures = []
        # reading the xml measure by measure
        for measure_index, measure in enumerate(root.findall('part/measure')):

            temp_measure = []
            # all notes in the current measure
            for note_index, note in enumerate(measure.findall('note')):

                # pitch and octave information of the current note

                if note.find("symbtrid").text:  # symbtrid
                    extra = int(note.find("symbtrid").text)

                # pitch and octave information of the current note
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
                    acc = makam_accidents[note.find('accidental').text]
                else:
                    acc = 0

                # dotted or not
                if note.find('dot') is not None:
                    dot = 1
                else:
                    dot = 0

                # tuplet or not
                if note.find('time-modification') is not None:
                    tuplet = 1
                else:
                    tuplet = 0

                # lyrics
                if note.find('lyric/text').text is not None:
                    lyric = note.find('lyric/text').text
                else:
                    lyric = ''

                if dur is not None:
                    # appending attributes to the temp note
                    normal_dur = int(qnotelen * float(dur) / divisions) / qnotelen

                temp_note = [step, octave, acc, dot, tuplet, rest, normal_dur, extra, lyric]
                temp_measure.append(temp_note)

            # adding temp measure to the measure
            measures.append(temp_measure)
        return measures, makam, usul, form, bpm, beats, beat_type, keysig

    def ly_writer(self, measures, makam, usul, form, bpm, beats, beat_type, keysig):
        makam_accidents = {'quarter-flat': '-1',
                           'slash-flat': '-4',
                           'flat': '-5',
                           'double-slash-flat': '-8',
                           'quarter-sharp': '+1',
                           'sharp': '+4',
                           'slash-quarter-sharp': '+5',
                           'slash-sharp': '+8'}
        ly_stream = []

        curr_path = os.path.dirname(os.path.abspath(__file__)) + "/data"
        # connecting database, trying to get information for beams in lilypond
        conn = sqlite3.connect(os.path.join(curr_path, "makam_db"))
        c = conn.cursor()

        # Starting from 4 because of the lilypond header, defined in main function
        line = 6
        # getting the components for the given usul
        c.execute('SELECT * FROM usul WHERE NAME="{0}"'.format(usul))
        data = c.fetchone()
        # if beam information is exist
        if data is not None:
            if data[-1] is not None:
                strokes = data[-1].replace("+", " ")
                ly_stream.append('''\n\t\\set Staff.beatStructure = #\'({0})\n'''.format(strokes))
                line += 2
        if data is None:
            c.execute('SELECT * FROM usul WHERE NAMEENG="{0}"'.format(usul.lower()))
            new_data = c.fetchone()
            if new_data is not None:
                if data[-1] is not None:
                    strokes = new_data[-1].replace("+", " ")
                    ly_stream.append('''\n\t\\set Staff.beatStructure = #\'({0})\n'''.format(strokes))
                    line += 2

        ly_stream.append("\n\t\\time")
        line += 1

        # time signature
        try:
            ly_stream.append(beats + "/" + beat_type)
        except:
            print("No time signature!!!")

        ly_stream.append("\n\t\\clef treble \n\t\\set Staff.keySignature = #`(")
        line += 2

        accidentals_check = []
        temp_keysig = ""
        print keysig
        '''
        for i in range(0, len(self.keysig_keys)):
            accidentals_check.append(self.keysig_keys[i] + self.accidentals[self.keysig_accs[i].replace("+", "")])
            temp_keysig += "("
            temp_keysig += "( 0 . " + str(self.notes_western2lily[self.keysig_keys[i]]) + "). , " + str(
                self.notes_keyaccidentals[self.keysig_accs[i]])
            temp_keysig += ")"

            self.ly_stream.append(temp_keysig)
            temp_keysig = ""
        '''

        for key in keysig:
            accidentals_check.append(key + makam_accidents[keysig[key].replace("+", "")])
            temp_keysig += "("
            temp_keysig += "( 0 . " + str(self.notes_western2lily[key.lower()]) + "). , " + \
                           str(self.notes_keyaccidentals[keysig[key]])
            temp_keysig += ")"

            ly_stream.append(temp_keysig)
            temp_keysig = ""

        ly_stream.append(")")

        for xx, measure in enumerate(measures):
            ly_stream.append("\n\t")
            line += 1
            ly_stream.append("{")

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
                    temp_note += self.accidentals[str(note[2]).replace('+', '')]  # accidental
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
                    temp_note += self.accidentals[str(note[2]).replace('+', '')]  # accidental
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
                    temp_note += self.accidentals[str(note[2]).replace('+', '')]
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
                ly_stream.append(temp_note)
            ly_stream.append("} %measure " + str(xx + 1))
        ly_stream.append('''\n\t\\bar \"|.\"''')
        return ly_stream

    def run(self, fname):
        ly_initial = """
\\include "makam.ly"
{
  %\\override Score.SpacingSpanner.strict-note-spacing = ##t
  %\\set Score.proportionalNotationDuration = #(ly:make-moment 1/8)
             """

        measures, makam, usul, form, bpm, beats, beat_type, keysig = self.read_musicxml(fname)
        ly_stream = self.ly_writer(measures, makam, usul, form, bpm, beats, beat_type, keysig)
        ly_string = " ".join(ly_stream)

        fname = fname.split(".")[0]
        outfile = codecs.open(fname + ".ly", 'w')
        outfile.write(ly_initial + ly_string + "\n}")
        outfile.close()

'''
        outfile = codecs.open(fname + ".json", 'w')
        json.dump(self.mapping, outfile)
        outfile.close()
'''