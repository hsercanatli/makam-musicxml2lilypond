
\include "makam.ly" 
\header {
  tagline = ""
  title = "Akşam Oldu Hüzünlendim..."
  composer = "Semahat Özdenses"
  piece = "Makam: Şarkı, Form: Uşşak, Usul: Düyek"
  poet = "Ahmet Cengizoğlu"
}
{
  %\override Score.SpacingSpanner.strict-note-spacing = ##t
  %\set Score.proportionalNotationDuration = #(ly:make-moment 1/8)
  \set Staff.beatStructure = #'(1 2 1 2 2)
  \time8/8
  \clef treble
  \set Staff.keySignature = #`((6 . ,(- KOMA)) )
  { % measure 1 beginning
    c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "Ak"}} % SymbTr-txt row index #2
    d''4._\markup { \center-align {\smaller \translate #'(0 . -2.5) "şam"}} % SymbTr-txt row index #3
    d''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ol"}} % SymbTr-txt row index #4
    \grace e''8 % SymbTr-txt row index #5
    d''16 % SymbTr-txt row index #6
    c''16 % SymbTr-txt row index #7
    c''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "du"}} % SymbTr-txt row index #8
    bfc'16 % SymbTr-txt row index #9
    c''8 % SymbTr-txt row index #10
  } % measure 1 ending
  { % measure 2 beginning
    c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "hü"}} % SymbTr-txt row index #11
    c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "zün"}} % SymbTr-txt row index #12
    bfc'8 % SymbTr-txt row index #13
    a'8 % SymbTr-txt row index #14
    a'8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "len"}} % SymbTr-txt row index #15
    \grace c''8 % SymbTr-txt row index #16
    bfc'16 % SymbTr-txt row index #17
    a'16 % SymbTr-txt row index #18
    a'8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "dim"}} % SymbTr-txt row index #19
    g'8 % SymbTr-txt row index #20
  } % measure 2 ending
  { % measure 3 beginning
    c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ben"}} % SymbTr-txt row index #21
    bfc'16 % SymbTr-txt row index #22
    a'16 % SymbTr-txt row index #23
    bfc'8 % SymbTr-txt row index #24
    c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "yi"}} % SymbTr-txt row index #25
    d''2_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ne"}} % SymbTr-txt row index #26
  } % measure 3 ending
  { % measure 4 beginning
    c''8^\markup { \left-align {\bold \translate #'(1 . 0) "SAZ"}} % SymbTr-txt row index #27
    bfc'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #28
    a'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #29
    bfc'8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #30
    c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #31
    d''8._\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #32
    e''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #33
    c''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #34
    bfc'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #35
    a'8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #36
  } % measure 4 ending
  { % measure 5 beginning
    c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "Ak"}} % SymbTr-txt row index #37
    d''4._\markup { \center-align {\smaller \translate #'(0 . -2.5) "şam"}} % SymbTr-txt row index #38
    d''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ol"}} % SymbTr-txt row index #39
    \grace e''8 % SymbTr-txt row index #40
    d''16 % SymbTr-txt row index #41
    c''16 % SymbTr-txt row index #42
    c''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "du"}} % SymbTr-txt row index #43
    bfc'16 % SymbTr-txt row index #44
    c''8 % SymbTr-txt row index #45
  } % measure 5 ending
  { % measure 6 beginning
    c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "hü"}} % SymbTr-txt row index #46
    c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "zün"}} % SymbTr-txt row index #47
    bfc'8 % SymbTr-txt row index #48
    a'8 % SymbTr-txt row index #49
    a'8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "len"}} % SymbTr-txt row index #50
    \grace c''8 % SymbTr-txt row index #51
    bfc'16 % SymbTr-txt row index #52
    a'16 % SymbTr-txt row index #53
    a'8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "dim"}} % SymbTr-txt row index #54
    g'8 % SymbTr-txt row index #55
  } % measure 6 ending
  { % measure 7 beginning
    c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ben"}} % SymbTr-txt row index #56
    bfc'16 % SymbTr-txt row index #57
    a'16 % SymbTr-txt row index #58
    bfc'8 % SymbTr-txt row index #59
    c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "yi"}} % SymbTr-txt row index #60
    d''2_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ne"}} % SymbTr-txt row index #61
  } % measure 7 ending
  { % measure 8 beginning
    c''8^\markup { \left-align {\bold \translate #'(1 . 0) "SAZ"}} % SymbTr-txt row index #62
    bfc'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #63
    a'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #64
    bfc'8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #65
    c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #66
    d''4._\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #67
    r8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #68
  } % measure 8 ending
  { % measure 9 beginning
    d''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "Has"}} % SymbTr-txt row index #69
    e''4._\markup { \center-align {\smaller \translate #'(0 . -2.5) "ret"}} % SymbTr-txt row index #70
    e''8._\markup { \center-align {\smaller \translate #'(0 . -2.5) "kal"}} % SymbTr-txt row index #71
    d''16 % SymbTr-txt row index #72
    e''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "dım"}} % SymbTr-txt row index #73
    d''32 % SymbTr-txt row index #74
    c''32 % SymbTr-txt row index #75
    d''8 % SymbTr-txt row index #76
  } % measure 9 ending
  { % measure 10 beginning
    r8 % SymbTr-txt row index #77
    e''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "göz"}} % SymbTr-txt row index #78
    d''8 % SymbTr-txt row index #79
    f''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "le"}} % SymbTr-txt row index #80
    e''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ri"}} % SymbTr-txt row index #81
    d''8 % SymbTr-txt row index #82
    c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "nin"}} % SymbTr-txt row index #83
    bfc'8 % SymbTr-txt row index #84
  } % measure 10 ending
  { % measure 11 beginning
    a'8 % SymbTr-txt row index #85
    d''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ren"}} % SymbTr-txt row index #86
    c''16 % SymbTr-txt row index #87
    bfc'8 % SymbTr-txt row index #88
    bfc'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "gi"}} % SymbTr-txt row index #89
    a'16 % SymbTr-txt row index #90
    a'4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ne"}} % SymbTr-txt row index #91
    d''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ah"}} % SymbTr-txt row index #92
    e''32 % SymbTr-txt row index #93
    d''32 % SymbTr-txt row index #94
    d''32 % SymbTr-txt row index #95
    c''32 % SymbTr-txt row index #96
    d''16 % SymbTr-txt row index #97
  } % measure 11 ending
  { % measure 12 beginning
    d''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "Has"}} % SymbTr-txt row index #98
    e''4._\markup { \center-align {\smaller \translate #'(0 . -2.5) "ret"}} % SymbTr-txt row index #99
    e''8._\markup { \center-align {\smaller \translate #'(0 . -2.5) "kal"}} % SymbTr-txt row index #100
    d''16 % SymbTr-txt row index #101
    e''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "dım"}} % SymbTr-txt row index #102
    d''32 % SymbTr-txt row index #103
    c''32 % SymbTr-txt row index #104
    d''8 % SymbTr-txt row index #105
  } % measure 12 ending
  { % measure 13 beginning
    r8 % SymbTr-txt row index #106
    e''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "göz"}} % SymbTr-txt row index #107
    d''8 % SymbTr-txt row index #108
    f''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "le"}} % SymbTr-txt row index #109
    e''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ri"}} % SymbTr-txt row index #110
    d''8 % SymbTr-txt row index #111
    c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "nin"}} % SymbTr-txt row index #112
    bfc'8 % SymbTr-txt row index #113
  } % measure 13 ending
  { % measure 14 beginning
    a'8 % SymbTr-txt row index #114
    d''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ren"}} % SymbTr-txt row index #115
    c''16 % SymbTr-txt row index #116
    bfc'8 % SymbTr-txt row index #117
    bfc'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "gi"}} % SymbTr-txt row index #118
    a'16 % SymbTr-txt row index #119
    a'2_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ne"}} % SymbTr-txt row index #120
  } % measure 14 ending
  { % measure 15 beginning
    r8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #121
    a''4^\markup { \left-align {\bold \translate #'(1 . 0) "SAZ"}} % SymbTr-txt row index #122
    g''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #123
    fb''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #124
    e''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #125
    fb''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #126
    g''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #127
    a''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #128
  } % measure 15 ending
  { % measure 16 beginning
    g''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "Gel"}} % SymbTr-txt row index #129
    c'''4._\markup { \center-align {\smaller \translate #'(0 . -2.5) "meh"}} % SymbTr-txt row index #130
    bfc''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ta"}} % SymbTr-txt row index #131
    a''16 % SymbTr-txt row index #132
    bfc''16 % SymbTr-txt row index #133
    c'''16 % SymbTr-txt row index #134
    a''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "bım"}} % SymbTr-txt row index #135
  } % measure 16 ending
  { % measure 17 beginning
    r8 % SymbTr-txt row index #136
    a''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "gel"}} % SymbTr-txt row index #137
    bfc''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "sev"}} % SymbTr-txt row index #138
    g''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "gi"}} % SymbTr-txt row index #139
    fb''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "lim"}} % SymbTr-txt row index #140
  } % measure 17 ending
  { % measure 18 beginning
    r8 % SymbTr-txt row index #141
    g''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "gel"}} % SymbTr-txt row index #142
    bfc''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "yi"}} % SymbTr-txt row index #143
    a''2_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ne"}} % SymbTr-txt row index #144
  } % measure 18 ending
  { % measure 19 beginning
    r8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #145
    c'''8^\markup { \left-align {\bold \translate #'(1 . 0) "SAZ"}} % SymbTr-txt row index #146
    bfc''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #147
    a''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #148
    g''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #149
    fb''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #150
    g''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #151
    a''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #152
  } % measure 19 ending
  { % measure 20 beginning
    g''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "Gel"}} % SymbTr-txt row index #153
    c'''4._\markup { \center-align {\smaller \translate #'(0 . -2.5) "meh"}} % SymbTr-txt row index #154
    bfc''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ta"}} % SymbTr-txt row index #155
    a''16 % SymbTr-txt row index #156
    bfc''16 % SymbTr-txt row index #157
    c'''16 % SymbTr-txt row index #158
    a''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "bım"}} % SymbTr-txt row index #159
  } % measure 20 ending
  { % measure 21 beginning
    r8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #160
    a''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "gel"}} % SymbTr-txt row index #161
    g''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "sev"}} % SymbTr-txt row index #162
    f''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "gi"}} % SymbTr-txt row index #163
    e''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "lim"}} % SymbTr-txt row index #164
  } % measure 21 ending
  { % measure 22 beginning
    r8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #165
    g''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "gel"}} % SymbTr-txt row index #166
    e''8 % SymbTr-txt row index #167
    e''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "yi"}} % SymbTr-txt row index #168
    d''16 % SymbTr-txt row index #169
    d''2_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ne"}} % SymbTr-txt row index #170
  } % measure 22 ending
  { % measure 23 beginning
    c''8^\markup { \left-align {\bold \translate #'(1 . 0) "SAZ"}} % SymbTr-txt row index #171
    bfc'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #172
    a'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #173
    bfc'8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #174
    c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #175
    d''2_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt row index #176
  } % measure 23 ending
  { % measure 24 beginning
    d''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "Has"}} % SymbTr-txt row index #177
    e''4._\markup { \center-align {\smaller \translate #'(0 . -2.5) "ret"}} % SymbTr-txt row index #178
    e''8._\markup { \center-align {\smaller \translate #'(0 . -2.5) "kal"}} % SymbTr-txt row index #179
    d''16 % SymbTr-txt row index #180
    e''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "dım"}} % SymbTr-txt row index #181
    d''32 % SymbTr-txt row index #182
    c''32 % SymbTr-txt row index #183
    d''8 % SymbTr-txt row index #184
  } % measure 24 ending
  { % measure 25 beginning
    r8 % SymbTr-txt row index #185
    e''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "göz"}} % SymbTr-txt row index #186
    d''8 % SymbTr-txt row index #187
    f''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "le"}} % SymbTr-txt row index #188
    e''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ri"}} % SymbTr-txt row index #189
    d''8 % SymbTr-txt row index #190
    c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "nin"}} % SymbTr-txt row index #191
    bfc'8 % SymbTr-txt row index #192
  } % measure 25 ending
  { % measure 26 beginning
    a'8 % SymbTr-txt row index #193
    d''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ren"}} % SymbTr-txt row index #194
    c''16 % SymbTr-txt row index #195
    bfc'8 % SymbTr-txt row index #196
    bfc'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "gi"}} % SymbTr-txt row index #197
    a'16 % SymbTr-txt row index #198
    a'4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ne"}} % SymbTr-txt row index #199
    d''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ah"}} % SymbTr-txt row index #200
    e''32 % SymbTr-txt row index #201
    d''32 % SymbTr-txt row index #202
    d''32 % SymbTr-txt row index #203
    c''32 % SymbTr-txt row index #204
    d''16 % SymbTr-txt row index #205
  } % measure 26 ending
  { % measure 27 beginning
    d''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "Has"}} % SymbTr-txt row index #206
    e''4._\markup { \center-align {\smaller \translate #'(0 . -2.5) "ret"}} % SymbTr-txt row index #207
    e''8._\markup { \center-align {\smaller \translate #'(0 . -2.5) "kal"}} % SymbTr-txt row index #208
    d''16 % SymbTr-txt row index #209
    e''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "dım"}} % SymbTr-txt row index #210
    d''32 % SymbTr-txt row index #211
    c''32 % SymbTr-txt row index #212
    d''8 % SymbTr-txt row index #213
  } % measure 27 ending
  { % measure 28 beginning
    r8 % SymbTr-txt row index #214
    e''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "göz"}} % SymbTr-txt row index #215
    d''8 % SymbTr-txt row index #216
    f''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "le"}} % SymbTr-txt row index #217
    e''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ri"}} % SymbTr-txt row index #218
    d''8 % SymbTr-txt row index #219
    c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "nin"}} % SymbTr-txt row index #220
    bfc'8 % SymbTr-txt row index #221
  } % measure 28 ending
  { % measure 29 beginning
    a'8 % SymbTr-txt row index #222
    d''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ren"}} % SymbTr-txt row index #223
    c''16 % SymbTr-txt row index #224
    bfc'8 % SymbTr-txt row index #225
    bfc'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "gi"}} % SymbTr-txt row index #226
    a'16 % SymbTr-txt row index #227
    a'2_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ne"}} % SymbTr-txt row index #228
  \bar "|."
  } % measure 29 ending