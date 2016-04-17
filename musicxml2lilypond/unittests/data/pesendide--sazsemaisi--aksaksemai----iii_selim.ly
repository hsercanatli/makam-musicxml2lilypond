
\include "makam.ly" 
\header {
  tagline = ""
  title = "Pesendîde Sazsemâîsi"
  composer = "III. Selim (İlhâmî)"
  piece = "Makam: Sazsemâîsi, Form: Pesendîde, Usul: Aksaksemâî"
}
{
  %\override Score.SpacingSpanner.strict-note-spacing = ##t
  %\set Score.proportionalNotationDuration = #(ly:make-moment 1/8)
  \set Staff.beatStructure = #'(2 1 2 2 2 1)
  \time10/8
  \clef treble
  \set Staff.keySignature = #`((6 . ,(- KOMA)) (3 . ,BAKIYE) )
  { % measure 1 beginning
    g''4^\markup { \left-align {\bold \translate #'(1 . 0) "1. HANE"}} % SymbTr-txt row index #2
    fb''8 % SymbTr-txt row index #3
    e''4 % SymbTr-txt row index #4
    d''8 % SymbTr-txt row index #5
    \grace e''8 % SymbTr-txt row index #6
    d''16 % SymbTr-txt row index #7
    cb''16 % SymbTr-txt row index #8
    b'8 % SymbTr-txt row index #9
    a'8 % SymbTr-txt row index #10
    g'8 % SymbTr-txt row index #11
  } % measure 1 ending
  { % measure 2 beginning
    g''4 % SymbTr-txt row index #12
    a''8 % SymbTr-txt row index #13
    g''8 % SymbTr-txt row index #14
    fb''8 % SymbTr-txt row index #15
    e''8 % SymbTr-txt row index #16
    d''8 % SymbTr-txt row index #17
    d''4 % SymbTr-txt row index #18
    r8 % SymbTr-txt row index #19
  } % measure 2 ending
  { % measure 3 beginning
    b'8 % SymbTr-txt row index #20
    b'16 % SymbTr-txt row index #21
    cb''16 % SymbTr-txt row index #22
    d''8 % SymbTr-txt row index #23
    e''8 % SymbTr-txt row index #24
    fb''8 % SymbTr-txt row index #25
    g''8 % SymbTr-txt row index #26
    fb''16 % SymbTr-txt row index #27
    e''16 % SymbTr-txt row index #28
    d''16 % SymbTr-txt row index #29
    cb''16 % SymbTr-txt row index #30
    b'8 % SymbTr-txt row index #31
    r8 % SymbTr-txt row index #32
  } % measure 3 ending
  { % measure 4 beginning
    b'8 % SymbTr-txt row index #33
    a'8 % SymbTr-txt row index #34
    g'8 % SymbTr-txt row index #35
    a'8. % SymbTr-txt row index #36
    bfk'16 % SymbTr-txt row index #37
    a'16 % SymbTr-txt row index #38
    g'16 % SymbTr-txt row index #39
    fb'16 % SymbTr-txt row index #40
    g'16 % SymbTr-txt row index #41
    a'4. % SymbTr-txt row index #42
  } % measure 4 ending
  { % measure 5 beginning
    r8^\markup { \left-align {\bold \translate #'(1 . 0) "TESLİM"}} % SymbTr-txt row index #43
    fb'16 % SymbTr-txt row index #44
    g'16 % SymbTr-txt row index #45
    a'8 % SymbTr-txt row index #46
    bfc'8. % SymbTr-txt row index #47
    c''16 % SymbTr-txt row index #48
    bfc'8 % SymbTr-txt row index #49
    a'8 % SymbTr-txt row index #50
    bfc'8. % SymbTr-txt row index #51
    a'16 % SymbTr-txt row index #52
    g'8 % SymbTr-txt row index #53
  } % measure 5 ending
  { % measure 6 beginning
    a'8. % SymbTr-txt row index #54
    bfc'16 % SymbTr-txt row index #55
    a'16 % SymbTr-txt row index #56
    g'16 % SymbTr-txt row index #57
    fb'16 % SymbTr-txt row index #58
    e'16 % SymbTr-txt row index #59
    d'8 % SymbTr-txt row index #60
    bfc'8 % SymbTr-txt row index #61
    a'16 % SymbTr-txt row index #62
    g'16 % SymbTr-txt row index #63
    g'4 % SymbTr-txt row index #64
    r8 % SymbTr-txt row index #65
  } % measure 6 ending
  { % measure 7 beginning
    g'4^\markup { \left-align {\bold \translate #'(1 . 0) "2. HANE"}} % SymbTr-txt row index #66
    fb'8 % SymbTr-txt row index #67
    g'4 % SymbTr-txt row index #68
    bfc'8 % SymbTr-txt row index #69
    c''8 % SymbTr-txt row index #70
    d''4 % SymbTr-txt row index #71
    r8 % SymbTr-txt row index #72
  } % measure 7 ending
  { % measure 8 beginning
    g''4 % SymbTr-txt row index #73
    fb''8 % SymbTr-txt row index #74
    g''4 % SymbTr-txt row index #75
    a''8 % SymbTr-txt row index #76
    bfk''8 % SymbTr-txt row index #77
    a''8 % SymbTr-txt row index #78
    g''8 % SymbTr-txt row index #79
    fb''8 % SymbTr-txt row index #80
  } % measure 8 ending
  { % measure 9 beginning
    g''4 % SymbTr-txt row index #81
    bfk''8 % SymbTr-txt row index #82
    a''8 % SymbTr-txt row index #83
    g''8 % SymbTr-txt row index #84
    fb''8 % SymbTr-txt row index #85
    efb''8 % SymbTr-txt row index #86
    d''4 % SymbTr-txt row index #87
    r8 % SymbTr-txt row index #88
  } % measure 9 ending
  { % measure 10 beginning
    r8 % SymbTr-txt row index #89
    c''16 % SymbTr-txt row index #90
    d''16 % SymbTr-txt row index #91
    efk''8 % SymbTr-txt row index #92
    d''8 % SymbTr-txt row index #93
    c''8 % SymbTr-txt row index #94
    bfk'8 % SymbTr-txt row index #95
    a'8 % SymbTr-txt row index #96
    g'4 % SymbTr-txt row index #97
    r8 % SymbTr-txt row index #98
  } % measure 10 ending
  { % measure 11 beginning
    r8^\markup { \left-align {\bold \translate #'(1 . 0) "TESLİM"}} % SymbTr-txt row index #99
    fb'16 % SymbTr-txt row index #100
    g'16 % SymbTr-txt row index #101
    a'8 % SymbTr-txt row index #102
    bfc'8. % SymbTr-txt row index #103
    c''16 % SymbTr-txt row index #104
    bfc'8 % SymbTr-txt row index #105
    a'8 % SymbTr-txt row index #106
    bfc'8. % SymbTr-txt row index #107
    a'16 % SymbTr-txt row index #108
    g'8 % SymbTr-txt row index #109
  } % measure 11 ending
  { % measure 12 beginning
    a'8. % SymbTr-txt row index #110
    bfc'16 % SymbTr-txt row index #111
    a'16 % SymbTr-txt row index #112
    g'16 % SymbTr-txt row index #113
    fb'16 % SymbTr-txt row index #114
    e'16 % SymbTr-txt row index #115
    d'8 % SymbTr-txt row index #116
    bfc'8 % SymbTr-txt row index #117
    a'16 % SymbTr-txt row index #118
    g'16 % SymbTr-txt row index #119
    g'4 % SymbTr-txt row index #120
    r8 % SymbTr-txt row index #121
  } % measure 12 ending
  { % measure 13 beginning
    g''4^\markup { \left-align {\bold \translate #'(1 . 0) "3. HANE"}} % SymbTr-txt row index #122
    a''8 % SymbTr-txt row index #123
    g''8 % SymbTr-txt row index #124
    fb''8 % SymbTr-txt row index #125
    e''8 % SymbTr-txt row index #126
    d''8 % SymbTr-txt row index #127
    c''4 % SymbTr-txt row index #128
    bfc'8 % SymbTr-txt row index #129
  } % measure 13 ending
  { % measure 14 beginning
    a'4 % SymbTr-txt row index #130
    e''8 % SymbTr-txt row index #131
    d''8 % SymbTr-txt row index #132
    c''8 % SymbTr-txt row index #133
    bfc'8 % SymbTr-txt row index #134
    a'8 % SymbTr-txt row index #135
    g'4 % SymbTr-txt row index #136
    r8 % SymbTr-txt row index #137
  } % measure 14 ending
  { % measure 15 beginning
    g'8 % SymbTr-txt row index #138
    a'8 % SymbTr-txt row index #139
    bfc'8 % SymbTr-txt row index #140
    c''8 % SymbTr-txt row index #141
    d''8 % SymbTr-txt row index #142
    e''8 % SymbTr-txt row index #143
    fb''8 % SymbTr-txt row index #144
    g''4 % SymbTr-txt row index #145
    fb''8 % SymbTr-txt row index #146
  } % measure 15 ending
  { % measure 16 beginning
    g''4 % SymbTr-txt row index #147
    bfc''8 % SymbTr-txt row index #148
    a''8 % SymbTr-txt row index #149
    g''8 % SymbTr-txt row index #150
    fb''8 % SymbTr-txt row index #151
    a''8 % SymbTr-txt row index #152
    g''4 % SymbTr-txt row index #153
    r8 % SymbTr-txt row index #154
  } % measure 16 ending
  { % measure 17 beginning
    r8^\markup { \left-align {\bold \translate #'(1 . 0) "TESLİM"}} % SymbTr-txt row index #155
    fb'16 % SymbTr-txt row index #156
    g'16 % SymbTr-txt row index #157
    a'8 % SymbTr-txt row index #158
    bfc'8. % SymbTr-txt row index #159
    c''16 % SymbTr-txt row index #160
    bfc'8 % SymbTr-txt row index #161
    a'8 % SymbTr-txt row index #162
    bfc'8. % SymbTr-txt row index #163
    a'16 % SymbTr-txt row index #164
    g'8 % SymbTr-txt row index #165
  } % measure 17 ending
  { % measure 18 beginning
    a'8. % SymbTr-txt row index #166
    bfc'16 % SymbTr-txt row index #167
    a'16 % SymbTr-txt row index #168
    g'16 % SymbTr-txt row index #169
    fb'16 % SymbTr-txt row index #170
    e'16 % SymbTr-txt row index #171
    d'8 % SymbTr-txt row index #172
    bfc'8 % SymbTr-txt row index #173
    a'16 % SymbTr-txt row index #174
    g'16 % SymbTr-txt row index #175
    g'4 % SymbTr-txt row index #176
    r8 % SymbTr-txt row index #177
  } % measure 18 ending
  { % measure 19 beginning
    g''8^\markup { \left-align {\bold \translate #'(1 . 0) "4. HANE"}} % SymbTr-txt row index #179
    g''8 % SymbTr-txt row index #180
    bfc''8 % SymbTr-txt row index #181
    a''8 % SymbTr-txt row index #182
    a''8 % SymbTr-txt row index #183
    g''16 % SymbTr-txt row index #184
    a''16 % SymbTr-txt row index #185
  } % measure 19 ending
  { % measure 20 beginning
    bfc'8 % SymbTr-txt row index #186
    bfc'8 % SymbTr-txt row index #187
    c''16 % SymbTr-txt row index #188
    d''16 % SymbTr-txt row index #189
    e''8 % SymbTr-txt row index #190
    e''8 % SymbTr-txt row index #191
    fb''16 % SymbTr-txt row index #192
    g''16 % SymbTr-txt row index #193
  } % measure 20 ending
  { % measure 21 beginning
    bfc''8 % SymbTr-txt row index #194
    bfc''8 % SymbTr-txt row index #195
    c'''8 % SymbTr-txt row index #196
    bfc''16 % SymbTr-txt row index #197
    c'''16 % SymbTr-txt row index #198
    bfc''8 % SymbTr-txt row index #199
    a''8 % SymbTr-txt row index #200
  } % measure 21 ending
  { % measure 22 beginning
    fb''8 % SymbTr-txt row index #201
    fb''8 % SymbTr-txt row index #202
    e''16 % SymbTr-txt row index #203
    d''16 % SymbTr-txt row index #204
    bfc''8 % SymbTr-txt row index #205
    bfc''8 % SymbTr-txt row index #206
    a''16 % SymbTr-txt row index #207
    g''16 % SymbTr-txt row index #208
  } % measure 22 ending
  { % measure 23 beginning
    d''8 % SymbTr-txt row index #209
    d''8 % SymbTr-txt row index #210
    g''8 % SymbTr-txt row index #211
    fb''8 % SymbTr-txt row index #212
    a''4 % SymbTr-txt row index #213
  } % measure 23 ending
  { % measure 24 beginning
    g''8 % SymbTr-txt row index #214
    g''8 % SymbTr-txt row index #215
    fb''16 % SymbTr-txt row index #216
    e''16 % SymbTr-txt row index #217
    d''8 % SymbTr-txt row index #218
    d''8 % SymbTr-txt row index #219
    c''16 % SymbTr-txt row index #220
    bfc'16 % SymbTr-txt row index #221
  } % measure 24 ending
  { % measure 25 beginning
    bfc'8 % SymbTr-txt row index #222
    bfc'8 % SymbTr-txt row index #223
    a'8 % SymbTr-txt row index #224
    g'8 % SymbTr-txt row index #225
    g'8 % SymbTr-txt row index #226
    e''8 % SymbTr-txt row index #227
  } % measure 25 ending
  { % measure 26 beginning
    d''8 % SymbTr-txt row index #228
    c''8 % SymbTr-txt row index #229
    bfc'8 % SymbTr-txt row index #230
    a'8 % SymbTr-txt row index #231
    g'4 % SymbTr-txt row index #232
  } % measure 26 ending
  { % measure 27 beginning
    r8^\markup { \left-align {\bold \translate #'(1 . 0) "TESLİM"}} % SymbTr-txt row index #234
    fb'16 % SymbTr-txt row index #235
    g'16 % SymbTr-txt row index #236
    a'8 % SymbTr-txt row index #237
    bfc'8. % SymbTr-txt row index #238
    c''16 % SymbTr-txt row index #239
    bfc'8 % SymbTr-txt row index #240
    a'8 % SymbTr-txt row index #241
    bfc'8. % SymbTr-txt row index #242
    a'16 % SymbTr-txt row index #243
    g'8 % SymbTr-txt row index #244
  } % measure 27 ending
  { % measure 28 beginning
    a'8. % SymbTr-txt row index #245
    bfc'16 % SymbTr-txt row index #246
    a'16 % SymbTr-txt row index #247
    g'16 % SymbTr-txt row index #248
    fb'16 % SymbTr-txt row index #249
    e'16 % SymbTr-txt row index #250
    d'8 % SymbTr-txt row index #251
    bfc'8 % SymbTr-txt row index #252
    a'16 % SymbTr-txt row index #253
    g'16 % SymbTr-txt row index #254
    g'4 % SymbTr-txt row index #255
    r8 % SymbTr-txt row index #256
    \bar "|."
  } % measure 28 ending
}