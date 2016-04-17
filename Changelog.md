#### musicxml2lilypond v0.9.5
 - Removed mapping json saving
 - Made the lilypond output more compact
 - \t are replaced by double spaces in the ly file
 - Row and column indices in the mapping are fixed

#### musicxml2lilypond v0.9.4
 - Added simple gracenote parsing
 - Better string maintainability by enforcing ```__future__.unicode_literals```
 - Added ```unittests```
 - Created and modularized ```MusicXMLReader```
 - Cleaned setup requirements
 - Improved ```demo.ipynb```

#### musicxml2lilypond v0.9.3
 - Corrected database path
 - Database path is constructed OS-independently during conversion

#### musicxml2lilypond v0.9.2
 - The xml input can be given directly as a string to the ```ScoreConverter.run``` method
 - Tidier output saving in the ```ScoreConverter.run``` method

#### musicxml2lilypond v0.9.1
 - Refactored the code to improve readability and maintenance

#### musicxml2lilypond v0.9.0
 - First public release
