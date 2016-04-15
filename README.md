musicxml2lilypond
===========
Python package that converts the a makam-musicxml score to lilypond

Introduction
------------


Usage
=======

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
============

If you want to install musicxml2lilypond, it is recommended to install the package and its dependencies into a virtualenv. In the terminal, do the following:

    virtualenv env
    source env/bin/activate
    python setup.py install

If you want to be able to edit files and have the changes be reflected, then
install the repository like this instead:

    pip install -e .

Now you can install the rest of the dependencies:

    pip install -r requirements

Authors
-------
Hasan Sercan Atlı	hsercanatli AT gmail DOT com  
Burak Uyar	burakuyar AT gmail DOT com  
Andrés Ferraro	andres DOT ferraro AT upf DOT edu  
Sertan Şentürk	contact AT sertansenturk DOT com  

Reference
-------
Sercan's Thesis
