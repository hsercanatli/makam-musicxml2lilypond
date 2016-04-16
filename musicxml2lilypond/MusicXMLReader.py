# coding=utf-8
from __future__ import unicode_literals, division
import warnings
import xml.etree.ElementTree as eT

__author__ = 'hsercanatli', 'burakuyar', 'andresferrero', 'sertansenturk'


class MusicXMLReader(object):
    makam_accidentals = {'quarter-flat': '-1',
                         'slash-flat': '-4',
                         'flat': '-5',
                         'double-slash-flat': '-8',
                         'quarter-sharp': '+1',
                         'sharp': '+4',
                         'slash-quarter-sharp': '+5',
                         'slash-sharp': '+8'}

    @staticmethod
    def read(xml_in):
        """
        :param xml_in:
        :rtype: object
        """

        # setting the xml tree
        parser = _XMLCommentHandler()
        try:  # document
            tree = eT.parse(xml_in, parser)
            root = tree.getroot()
        except IOError:  # string input
            root = eT.fromstring(xml_in, parser)

        # getting beats and beat type
        beat_type = root.find('part/measure/attributes/time/beat-type').text
        beats = root.find('part/measure/attributes/time/beats').text

        # getting key signatures
        keysig = MusicXMLReader._get_key_signature(root)

        # makam, form and usul information
        makam, form, usul = MusicXMLReader._get_makam_form_usul(root)

        # work title
        work_title = MusicXMLReader._get_title(root)

        # composer and lyricist
        composer, lyricist = MusicXMLReader._get_composer_lyricist(root)

        # reading the xml measure by measure
        measures = MusicXMLReader._get_measures(root)

        return (measures, makam, usul, form, beats, beat_type, keysig,
                work_title, composer, lyricist)

    @staticmethod
    def _get_key_signature(root):
        keysig = {}  # keys: notes, values: type of note accident
        for xx, key in enumerate(
                root.findall('part/measure/attributes/key/key-step')):
            keysig[key.text] = root.findall(
                'part/measure/attributes/key/key-accidental')[xx].text

        return keysig

    @staticmethod
    def _get_makam_form_usul(root):
        if root.find('part/measure/direction/direction-type/words').text:
            # the information is stored in the form below:
            # "Makam: Pesendîde, Form: Sazsemâîsi, Usul: Aksaksemâî "
            cultural_info_splitted = root.find(
                'part/measure/direction/direction-type/words').text.split(",")

            attributes = []
            for info in cultural_info_splitted:
                attributes.append(''.join(info.split(": ")[1]).strip())

            makam, form, usul = attributes
        else:
            warnings.warn("Makam, Form and Usul information do not exist.")
            makam = form = usul = ''

        return makam, form, usul

    @staticmethod
    def _get_title(root):
        if root.find('work/work-title').text:
            work_title = ''.join(root.find('work/work-title').text).strip()
        else:
            work_title = ''.strip()

        return work_title

    @staticmethod
    def _get_composer_lyricist(root):
        identification = [item.text for item in root.findall(
            'identification/creator')]
        if len(identification) == 2:
            composer = ''.join(identification[0]).strip()
            lyricist = ''.join(identification[1]).strip()
        else:
            composer = ''.join(identification[0]).strip()
            lyricist = ''.strip()
        return composer, lyricist

    @classmethod
    def _get_measures(cls, root):
        # tempo
        bpm = float(root.find('part/measure/direction/sound').attrib['tempo'])
        divisions = float(root.find('part/measure/attributes/divisions').text)
        quarter_note_len = 60000.0 / bpm

        # read measures
        measures = []
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
                    acc = cls.makam_accidentals[note.find('accidental').text]
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

                if dur is None:
                    normal_dur = None
                else:
                    normal_dur = (int(quarter_note_len * float(dur) /
                                      divisions) / quarter_note_len)

                # appending attributes to the temp note
                temp_note = [step, octave, acc, dot, tuplet, rest, normal_dur,
                             extra, lyric]

                temp_measure.append(temp_note)

            # add temp measure to the measure
            measures.append(temp_measure)
        return measures


class _XMLCommentHandler(eT.XMLTreeBuilder):
    def __init__(self):
        super(_XMLCommentHandler, self).__init__()

        # assumes ElementTree 1.2.X
        self._parser.CommentHandler = self.handle_comment

    def handle_comment(self, data):
        self._target.start("symbtrid", {})
        if data and 'symbtr_txt_note_index' in data:
            data = data.replace('symbtr_txt_note_index ', '')
        self._target.data(data)
        self._target.end("symbtrid")
