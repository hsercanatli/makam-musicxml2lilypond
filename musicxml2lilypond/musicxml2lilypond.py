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

    def handle_comment(self, data):
        self._target.start("symbtrid", {})
        if data and 'symbtr_txt_note_index' in data:
            data = data.replace('symbtr_txt_note_index ', '')
        self._target.data(data)
        self._target.end("symbtrid")


class ScoreConverter(object):
    def __init__(self):
        pass

    @staticmethod
    def read_musicxml(filename):
        """

        :param filename:
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
        tree = eT.parse(filename, parser)
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
        for xx, key in enumerate(
                root.findall('part/measure/attributes/key/key-step')):
            keysig[key.text] = root.findall(
                'part/measure/attributes/key/key-accidental')[xx].text

        # makam and usul information
        if root.find('part/measure/direction/direction-type/words').text:
            # entered if makam and usul exist
            cultural_info = root.find(
                'part/measure/direction/direction-type/words').text
            makam = u''.join(cultural_info.split(",")[0].split(": ")[1]).\
                encode('utf-8').strip()
            form = u''.join(cultural_info.split(",")[1].split(": ")[1]).\
                encode('utf-8').strip()
            usul = u''.join(cultural_info.split(",")[2].split(": ")[1]).\
                encode('utf-8').strip()
        else:
            print "Makam and Usul information do not exist."
            makam = u''.encode('utf-8').strip()
            usul = u''.encode('utf-8').strip()
            form = u''.encode('utf-8').strip()

        # work title
        if root.find('work/work-title').text:
            work_title = u''.join(root.find('work/work-title').text).\
                encode('utf-8').strip()
        else:
            work_title = u''.encode('utf-8').strip()

        # composer and lyricist
        identification = [item.text for item in root.findall(
            'identification/creator')]
        if len(identification) == 2:
            composer = u''.join(identification[0]).encode('utf-8').strip()
            poem = u''.join(identification[1]).encode('utf-8').strip()
        else:
            composer = u''.join(identification[0]).encode('utf-8').strip()
            poem = u''.encode('utf-8').strip()

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
                    normal_dur = (int(qnotelen * float(dur) / divisions) /
                                  qnotelen)

                temp_note = [step, octave, acc, dot, tuplet, rest, normal_dur,
                             extra, lyric]
                temp_measure.append(temp_note)

            # adding temp measure to the measure
            measures.append(temp_measure)
        return (measures, makam, usul, form, beats, beat_type, keysig,
                work_title, composer, poem)

    @staticmethod
    def lilypond_writer(symbtr, measures, makam, usul, form, beats,
                        beat_type, keysig, render_metadata,
                        work_title, composer, poem):
        mapping = []

        curr_path = os.path.dirname(os.path.abspath(__file__)) + "/data"
        # connecting database, trying to get information for beams in lilypond
        conn = sqlite3.connect(os.path.join(curr_path, "symbtr.db"))

        c = conn.cursor()

        # getting headers
        if render_metadata:
            ly_stream = ["""
    \\include "makam.ly" """ + """
    \\header { """ + """
          tagline = \"\"
          title = \"{0}\"
          composer = \"{1}\"
          meter = \"Usul: {2}\"
          piece = \"Form: {3}\"
          poet = \"Makam: {4}\"
          arranger = \"Lyricist: {5}\"""".format(
                work_title, composer, usul, form, makam, poem) + "\n}" + """
    {
      %\\override Score.SpacingSpanner.strict-note-spacing = ##t
      %\\set Score.proportionalNotationDuration = #(ly:make-moment 1/8)
                 """]
        else:
            ly_stream = ["""
    \\include "makam.ly" """ + """
    \\header { """ + """
          tagline = \"\"
          """"\n\t\t}" + """
    {
      %\\override Score.SpacingSpanner.strict-note-spacing = ##t
      %\\set Score.proportionalNotationDuration = #(ly:make-moment 1/8)
                 """]

        octaves = {"2": ",", "3": "", "4": "\'", "5": "\'\'", "6": "\'\'\'",
                   "7": "\'\'\'\'", "r": ""}

        accidentals = {"-1": "fc", "-4": "fb", "-5": "fk", "-8": "fbm",
                       "1": "c", "4": "b", "5": "k", "8": "bm", "0": ""}

        # notes and accidentals dictionary lilypond
        notes_western2lily = {"g": "4", "a": "5", "b": "6", "c": "0",
                              "d": "1", "e": "2", "f": "3"}

        notes_keyaccidentals = {'double-slash-flat': "(- BUYUKMUCENNEP)",
                                'flat': "(- KUCUK)",
                                'slash-flat': "(- BAKIYE)",
                                'quarter-flat': "(- KOMA)",
                                'slash-sharp': "BUYUKMUCENNEP",
                                'slash-quarter-sharp': "KUCUK",
                                'sharp': "BAKIYE",
                                'quarter-sharp': "KOMA"}

        makam_accidents = {'quarter-flat': '-1',
                           'slash-flat': '-4',
                           'flat': '-5',
                           'double-slash-flat': '-8',
                           'quarter-sharp': '+1',
                           'sharp': '+4',
                           'slash-quarter-sharp': '+5',
                           'slash-sharp': '+8'}

        # sorting rules of key signatures
        sort_rule_sharps = {'F': 0, 'C': 1, 'G': 2, 'D': 3, 'A': 4, 'E': 5,
                            'B': 6}
        sort_rule_notes_sharps = {0: 'F', 1: 'C', 2: 'G', 3: 'D', 4: 'A',
                                  5: 'E', 6: 'B'}

        sort_rule_flats = {'F': 6, 'C': 5, 'G': 4, 'D': 3, 'A': 2, 'E': 1,
                           'B': 0}
        sort_rule_notes_flats = {6: 'F', 5: 'C', 4: 'G', 3: 'D', 2: 'A',
                                 1: 'E', 0: 'B'}

        # Starting from 4 because of the lilypond header, defined in main func
        line = 6
        # getting the components for the given usul
        c.execute('SELECT * FROM usul WHERE NAME="{0}"'.format(usul))
        data = c.fetchone()

        # if beam information is exist
        if data is not None:
            if data[-1] is not None:
                strokes = data[-1].replace("+", " ")
                tmp_str = '''\n\t\\set Staff.beatStructure = #\'({0})\n'''\
                    .format(strokes)
                ly_stream.append(tmp_str)
                line += 2
        if data is None:
            c.execute('SELECT * FROM usul WHERE NAMEENG="{0}"'.format(
                usul.lower()))
            new_data = c.fetchone()
            if new_data is not None:
                if data[-1] is not None:
                    strokes = new_data[-1].replace("+", " ")
                    tmp_str = '''\n\t\\set Staff.beatStructure = #\'({0})\n'''\
                        .format(strokes)
                    ly_stream.append(tmp_str)
                    line += 2

        ly_stream.append("\n\t\\time")
        line += 1

        # time signature
        ly_stream.append(beats + "/" + beat_type)

        ly_stream.append("\n\t\\clef treble \n\t\\set Staff.keySignature = #`("
                         )
        line += 2

        accidentals_check = []
        rule = []
        for queue in keysig.keys():
            if makam_accidents[keysig[queue]][0] is "+":
                rule.append([sort_rule_sharps[queue], 's'])
            else:
                rule.append([sort_rule_flats[queue], 'f'])

        # sorting of key signatures
        temp_keysig = ""
        for queue in sorted(rule):
            if queue[1] is "s":
                key = sort_rule_notes_sharps[queue[0]]
            else:
                key = sort_rule_notes_flats[queue[0]]
            accidentals_check.append(key + makam_accidents[keysig[key].
                                     replace("+", "")])
            temp_keysig += "("
            temp_keysig += (str(notes_western2lily[key.lower()]) + " . ," +
                            str(notes_keyaccidentals[keysig[key]]))
            temp_keysig += ") "

            ly_stream.append(temp_keysig)
            temp_keysig = ""

        ly_stream.append(")")

        for xx, measure in enumerate(measures):
            ly_stream.append("\n\t")
            line += 1
            ly_stream.append("\n\t{ %measure " + str(xx + 1) + " beginning")

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
                    # accidental
                    temp_note += accidentals[str(note[2]).replace('+', '')]
                    temp_note += octaves[str(note[1])]  # octave

                    temp_dur = temp_dur * 3 / 2
                    temp_note += str(int(temp_dur))
                    temp_note += "."

                # tuplet
                elif note[4] == 1:  # tuplet flag
                    if tuplet == 0:
                        tuplet = 4
                        temp_note += "\\tuplet 3/2 {\n\t"
                    temp_note += str(note[0])  # step
                    # accidental
                    temp_note += accidentals[str(note[2]).replace('+', '')]
                    temp_note += octaves[str(note[1])]  # octave

                    temp_dur = temp_dur * 2 / 3
                    temp_note += str(int(temp_dur))

                    tuplet -= 1

                # nor
                else:
                    temp_note += str(note[0])
                    temp_note += accidentals[str(note[2]).replace('+', '')]
                    temp_note += octaves[str(note[1])]
                    temp_note += str(int(temp_dur))

                if note[7]:
                    mapping.append((note[7], pos + 4, line))

                # lyrics
                if note[-1] is not "":
                    if len(note[-1]) > 1:
                        if note[-1][1].isupper() or note[-1][0].isdigit():
                            temp_note += '''^\\markup { \\left-align {\\bold \\translate #'(1 . 0) \"''' + \
                                         u''.join(note[-1]).encode('utf-8').strip() + '''\"}}'''
                        else:
                            temp_note += '''_\\markup { \\center-align {\\smaller \\translate #'(0 . -2.5) \"''' + \
                                         u''.join(note[-1]).encode('utf-8').strip() + '''\"}}'''
                    else:
                        temp_note += '''_\\markup { \\center-align {\\smaller \\translate #'(0 . -2.5) \"''' + \
                                     u''.join(note[-1]).encode('utf-8').strip() + '''\"}}'''

                if tuplet == 1:
                    temp_note += "\n\t }"
                    tuplet = 0

                temp_note += ' %Symbtr #' + str(note[7])
                pos += len(temp_note) + 1
                ly_stream.append(temp_note)
            ly_stream.append("\n\t} %measure " + str(xx + 1) + " end point")
        ly_stream.append('''\n\t\\bar \"|.\"''' + "\n}")
        return ly_stream, mapping

    def run(self, xml_in, ly_out=None, map_out=None, render_metadata=False):
        (measures, makam, usul, form, beats, beat_type, keysig, work_title,
         composer, poem) = self.read_musicxml(xml_in)

        ly_stream, mapping = self.lilypond_writer(
            xml_in.split("/")[-1][:-4], measures, makam, usul, form,
            beats, beat_type, keysig, render_metadata, work_title, composer,
            poem)

        # save to file
        if ly_out is not None:
            xml_in = xml_in.split(".")[0]
            outfile = codecs.open(ly_out, 'w')
            outfile.write(''.join(ly_stream))
            outfile.close()

        # save to json
        if map_out is not None:
            outfile = codecs.open(xml_in + ".json", 'w')
            json.dump(mapping, outfile)
            outfile.close()

        return ly_stream, mapping
