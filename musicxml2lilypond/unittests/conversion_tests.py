from __future__ import unicode_literals
from musicxml2lilypond.ScoreConverter import ScoreConverter
import os
import json


def test_instrumental():
    name = "pesendide--sazsemaisi--aksaksemai----iii_selim"
    _converter(name)


def test_vocal():
    name = "ussak--sarki--duyek--aksam_oldu_huzunlendim--semahat_ozdenses"
    _converter(name)


def _converter(symbtr_name):
    xml_file, ly_file, map_file = _get_files_from_symbtrname(symbtr_name)

    converter = ScoreConverter()
    ly_stream, mapping = converter.convert(
        xml_file, ly_out=None, render_metadata=True)

    with open(ly_file, 'r') as f:
        saved_ly = f.read().decode('utf-8')

    assert ly_stream == saved_ly, u'{0:s}.ly file does not match'.format(
        symbtr_name)

    saved_map = json.load(open(map_file, 'r'))
    saved_map = [tuple(m) for m in saved_map]
    assert mapping == saved_map, u'A different mapping for {0:s} is produced.'\
        .format(symbtr_name)


def _get_files_from_symbtrname(symbtr_name):
    # folder
    curr_folder = os.path.dirname(os.path.abspath(__file__))
    file_template = os.path.join(curr_folder, 'data', symbtr_name)

    # files
    xml_file = file_template + '.xml'
    ly_file = file_template + '.ly'
    map_file = file_template + '.json'

    return xml_file, ly_file, map_file
