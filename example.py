__author__ = 'hsercanatli'
from musicxml2lilypond import ScoreConverter

x = ScoreConverter("musicxml/muhayyer--zeybek-turku--aksak--serenler--burdur.xml")
x.run()
