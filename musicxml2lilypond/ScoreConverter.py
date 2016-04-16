# coding=utf-8
from __future__ import unicode_literals, division
from MusicXMLReader import MusicXMLReader
import os
import json
import sqlite3

__author__ = 'hsercanatli', 'burakuyar', 'andresferrero', 'sertansenturk'


class ScoreConverter(object):
    @staticmethod
    def lilypond_writer(measures, makam, usul, form, beats, beat_type,
                        keysig, render_metadata, work_title, composer, poet):
        mapping = []

        db_path = os.path.join(os.path.dirname(os.path.abspath(__file__)),
                               "data", "symbtr.db")

        # connecting database, trying to get information for beams in lilypond
        conn = sqlite3.connect(os.path.join(db_path))
        c = conn.cursor()

        # getting headers
        if render_metadata:
            poet_str = 'poet = \"Lyricist: {0:s}\"'.\
                format(poet) if poet else ''

            ly_stream = ["""
    \\include "makam.ly" """ + """
    \\header { """ + """
          tagline = \"\"
          title = \"{0}\"
          composer = \"{1}\"
          metre = \"Usul: {2}\"
          piece = \"Makam: {4}, Form: {3}\"""".format(
                work_title, composer, usul, form, makam) + poet_str + "\n}" +
                         """
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
            temp_keysig += (notes_western2lily[key.lower()] + " . ," +
                            notes_keyaccidentals[keysig[key]])
            temp_keysig += ") "

            ly_stream.append(temp_keysig)
            temp_keysig = ""

        ly_stream.append(")")

        for xx, measure in enumerate(measures):
            ly_stream.append("\n\t")
            line += 1
            ly_stream.append("\n\t{{ % measure {0:d} beginning".format(xx + 1))

            tuplet = 0
            pos = 0

            for note in measure:
                temp_note = "\n\t"
                line += 1
                if note[6] is None:  # gracenote
                    # for now we display it as a 8th \grace
                    # TODO: Introduce other gracenotes such as \acciaccatura
                    # with the proper symbolic "duration"
                    temp_note += "\\grace "
                    note[6] = 0.5  # reminder: 4th note is 1
                    temp_dur = 4.0 / note[6]  # normal duration
                else:
                    temp_dur = 4.0 / note[6]  # normal duration

                # dotted
                if note[3] == 1:  # dot flag
                    temp_note += note[0]  # step
                    # accidental
                    temp_note += accidentals[str(note[2]).replace('+', '')]
                    temp_note += octaves[note[1]]  # octave

                    temp_dur = temp_dur * 3.0 / 2
                    temp_note += str(int(temp_dur))
                    temp_note += "."
                elif note[4] == 1:  # tuplet flag
                    if tuplet == 0:
                        tuplet = 4
                        temp_note += "\\tuplet 3/2 {\n\t"
                    temp_note += note[0]  # step
                    # accidental
                    temp_note += accidentals[str(note[2]).replace('+', '')]
                    temp_note += octaves[note[1]]  # octave

                    temp_dur = temp_dur * 2.0 / 3
                    temp_note += str(int(temp_dur))

                    tuplet -= 1
                else:  # normal
                    temp_note += note[0]
                    temp_note += accidentals[str(note[2]).replace('+', '')]
                    temp_note += octaves[note[1]]
                    temp_note += str(int(temp_dur))
                if note[7]:
                    mapping.append((note[7], pos + 4, line))

                # lyrics
                if note[-1] is not "":
                    if len(note[-1]) > 1:
                        if note[-1][1].isupper() or note[-1][0].isdigit():
                            temp_note += (
                                '''^\\markup { \\left-align ''' +
                                '''{\\bold \\translate #'(1 . 0) \"''' +
                                ''.join(note[-1]).strip() + '''\"}}''')
                        else:
                            temp_note += (
                                '''_\\markup { \\center-align {\\smaller ''' +
                                '''\\translate #'(0 . -2.5) \"''' +
                                ''.join(note[-1]).strip() + '''\"}}''')
                    else:
                        temp_note += (
                            '''_\\markup { \\center-align {\\smaller ''' +
                            '''\\translate #'(0 . -2.5) \"''' +
                            ''.join(note[-1]).strip() + '''\"}}''')

                if tuplet == 1:
                    temp_note += "\n\t }"
                    tuplet = 0

                temp_note += ' % SymbTr-txt #' + str(note[7])
                pos += len(temp_note) + 1
                ly_stream.append(temp_note)

            ly_stream.append("\n\t} % measure " + str(xx + 1) + " end point")
        ly_stream.append('''\n\t\\bar \"|.\"''' + "\n}")
        return ly_stream, mapping

    @classmethod
    def convert(cls, xml_in, ly_out=None, mapping_out=None,
                render_metadata=False):
        (measures, makam, usul, form, beats, beat_type, keysig, work_title,
         composer, poet) = MusicXMLReader.read(xml_in)

        ly_stream, mapping = cls.lilypond_writer(
            measures, makam, usul, form, beats, beat_type, keysig,
            render_metadata, work_title, composer, poet)

        ly_stream = u''.join(ly_stream)
        # save to file
        if ly_out is not None:
            xml_in = xml_in.split(".")[0]
            with open(ly_out, 'w') as outfile:
                outfile.write(ly_stream.encode('utf-8'))

        # save to json
        if mapping_out is not None:
            json.dump(mapping, open(xml_in + ".json", 'w'))

        return ly_stream, mapping
