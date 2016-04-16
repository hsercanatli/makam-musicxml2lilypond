# coding=utf-8
from __future__ import unicode_literals, division
import warnings
import xml.etree.ElementTree as eT

__author__ = 'hsercanatli', 'burakuyar', 'andresferrero', 'sertansenturk'


class MusicXMLReader(object):
    @staticmethod
    def read(xml_in):
        """
        :param xml_in:
        :rtype: object
        """
        makam_accidentals = {'quarter-flat': '-1',
                             'slash-flat': '-4',
                             'flat': '-5',
                             'double-slash-flat': '-8',
                             'quarter-sharp': '+1',
                             'sharp': '+4',
                             'slash-quarter-sharp': '+5',
                             'slash-sharp': '+8'}

        # setting the xml tree
        parser = CommentHandler()
        try:  # document
            tree = eT.parse(xml_in, parser)
            root = tree.getroot()
        except IOError:  # stirng input
            root = eT.fromstring(xml_in, parser)

        # tempo
        bpm = float(root.find('part/measure/direction/sound').attrib['tempo'])
        divisions = float(root.find('part/measure/attributes/divisions').text)
        qnotelen = 60000.0 / bpm

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
            makam = ''.join(cultural_info.split(",")[0].split(": ")[1]). \
                strip()
            form = ''.join(cultural_info.split(",")[1].split(": ")[1]). \
                strip()
            usul = ''.join(cultural_info.split(",")[2].split(": ")[1]). \
                strip()
        else:
            warnings.warn("Makam and Usul information do not exist.")
            makam = ''.strip()
            usul = ''.strip()
            form = ''.strip()

        # work title
        if root.find('work/work-title').text:
            work_title = ''.join(root.find('work/work-title').text).strip()
        else:
            work_title = ''.strip()

        # composer and lyricist
        identification = [item.text for item in root.findall(
            'identification/creator')]
        if len(identification) == 2:
            composer = ''.join(identification[0]).strip()
            poet = ''.join(identification[1]).strip()
        else:
            composer = ''.join(identification[0]).strip()
            poet = ''.strip()

        measures = []
        # reading the xml measure by measure
        for measure_index, measure in enumerate(root.findall('part/measure')):
            temp_measure = []
            # all notes in the current measure
            for note_index, note in enumerate(measure.findall('note')):
                # pitch and octave information of the current note
                extra = None
                if note.find("symbtrid").text:  # symbtrid
                    extra = int(note.find("symbtrid").text)

                # pitch and octave information of the current note
                octave = None
                step = None
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
                else:
                    raise ValueError("The element should have been a note or "
                                     "rest")

                # duration
                if note.find('duration') is not None:
                    dur = note.find('duration').text
                else:
                    dur = None  # grace note

                    # accident inf
                if note.find('accidental') is not None:
                    acc = makam_accidentals[note.find('accidental').text]
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
                else:
                    normal_dur = None

                temp_note = [step, octave, acc, dot, tuplet, rest, normal_dur,
                             extra, lyric]
                temp_measure.append(temp_note)

            # adding temp measure to the measure
            measures.append(temp_measure)
        return (measures, makam, usul, form, beats, beat_type, keysig,
                work_title, composer, poet)


class CommentHandler(eT.XMLTreeBuilder):
    def __init__(self):
        super(CommentHandler, self).__init__()

        # assumes ElementTree 1.2.X
        self._parser.CommentHandler = self.handle_comment

    def handle_comment(self, data):
        self._target.start("symbtrid", {})
        if data and 'symbtr_txt_note_index' in data:
            data = data.replace('symbtr_txt_note_index ', '')
        self._target.data(data)
        self._target.end("symbtrid")
