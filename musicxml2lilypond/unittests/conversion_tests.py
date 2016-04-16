from musicxml2lilypond.ScoreConverter import ScoreConverter
import os


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
        xml_file, ly_out=None, mapping_out=None, render_metadata=True)


    assert True


def _get_files_from_symbtrname(symbtr_name):
    # folder
    curr_folder = os.path.dirname(os.path.abspath(__file__))
    file_template = os.path.join(curr_folder, 'data', symbtr_name)

    # files
    xml_file = file_template + '.xml'
    ly_file = file_template + '.ly'
    map_file = file_template + '.json'

    return xml_file, ly_file, map_file
