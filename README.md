musicxml2lilypond
===========
Python package that converts a makam score in MusicXml format to [LilyPond](http://lilypond.org/)

Introduction
------------
This repository provides a simple and reliable conversion of a makam music score from MusicXML format to LilyPond format.

You can obtain 2200 makam music scores in MusicXML format from [SymbTr](http://dunya.compmusic.upf.edu/makam/) collection. Alternatively, you can use the SymbTr-txt files in the collection and generate the MusicXML files with limited modifications using the [MusicXMLConverter](https://github.com/burakuyar/MusicXMLConverter) package.

The LilyPond format and the LilyPond software itself are a powerful combination for music engraving, with vast use cases. Moreover, the software has a rather powerful LilyPond format to svg conversion capability. During conversion it encodes a precise mapping of the musical elements in the LilyPond file onto the generated vectors in the svg file. The scores in svg format created this way (SymbTr conversion "chain" from txt -> MusicXML -> LilyPond -> svg) are currently stored and displayed in the  ["Dunya-makam"](http://dunya.compmusic.upf.edu/makam/) website. The notes and the sections of the resultant svg score files are displayed in the recording page, synchronous to the audio playback.

Usage
------

```python
from musicxml2lilypond.musicxml2lilypond import ScoreConverter

# input MusicXML file
xml_file = "samplescores/pesendide--sazsemaisi--aksaksemai----iii_selim.xml"

# output lilypond file
ly_file = "samplescores/pesendide--sazsemaisi--aksaksemai----iii_selim.ly"

# output json file storing the mappings beteen ly and musicxml files.
map_file = "samplescores/pesendide--sazsemaisi--aksaksemai----iii_selim.json"

# instantiate
converter = ScoreConverter()
ly_stream, mapping = converter.run(xml_file, ly_out=ly_file, map_out=map_file,
                                   render_metadata=False)
```

Installation
-------------

**Note:** This package is in active development. The capabilities and calls might change significantly until the first stable release. For this reason we suggest the users to stick to the released versions, for the most reliable performance.

If you want to install musicxml2lilypond, it is recommended to install the package and its dependencies into a virtualenv. In the terminal, do the following:

    virtualenv env
    source env/bin/activate
    python setup.py install

If you want to be able to edit files and have the changes be reflected, then
install the repository like this instead:

    pip install -e .

Authors
-------
Hasan Sercan Atlı	hsercanatli AT gmail DOT com  
Burak Uyar	burakuyar AT gmail DOT com  
Andrés Ferraro	andres DOT ferraro AT upf DOT edu  
Sertan Şentürk	contact AT sertansenturk DOT com  

Reference
-------
Sercan's Thesis
