
    \include "makam.ly" 
    \header { 
          tagline = ""
          title = "Akşam Oldu Hüzünlendim..."
          composer = "Semahat Özdenses"
          metre = "Usul: Düyek"
          piece = "Makam: Uşşak, Form: Şarkı"poet = "Lyricist: Ahmet Cengizoğlu"
}
    {
      %\override Score.SpacingSpanner.strict-note-spacing = ##t
      %\set Score.proportionalNotationDuration = #(ly:make-moment 1/8)
                 
	\set Staff.beatStructure = #'(1 2 1 2 2)

	\time8/8
	\clef treble 
	\set Staff.keySignature = #`((6 . ,(- KOMA)) )
	
	{ % measure 1 beginning
	c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "Ak"}} % SymbTr-txt #2
	d''4._\markup { \center-align {\smaller \translate #'(0 . -2.5) "şam"}} % SymbTr-txt #3
	d''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ol"}} % SymbTr-txt #4
	e''8 % SymbTr-txt #5
	d''16 % SymbTr-txt #6
	c''16 % SymbTr-txt #7
	c''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "du"}} % SymbTr-txt #8
	bfc'16 % SymbTr-txt #9
	c''8 % SymbTr-txt #10
	} %measure 1 end point
	
	{ % measure 2 beginning
	c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "hü"}} % SymbTr-txt #11
	c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "zün"}} % SymbTr-txt #12
	bfc'8 % SymbTr-txt #13
	a'8 % SymbTr-txt #14
	a'8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "len"}} % SymbTr-txt #15
	c''8 % SymbTr-txt #16
	bfc'16 % SymbTr-txt #17
	a'16 % SymbTr-txt #18
	a'8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "dim"}} % SymbTr-txt #19
	g'8 % SymbTr-txt #20
	} %measure 2 end point
	
	{ % measure 3 beginning
	c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ben"}} % SymbTr-txt #21
	bfc'16 % SymbTr-txt #22
	a'16 % SymbTr-txt #23
	bfc'8 % SymbTr-txt #24
	c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "yi"}} % SymbTr-txt #25
	d''2_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ne"}} % SymbTr-txt #26
	} %measure 3 end point
	
	{ % measure 4 beginning
	c''8^\markup { \left-align {\bold \translate #'(1 . 0) "SAZ"}} % SymbTr-txt #27
	bfc'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #28
	a'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #29
	bfc'8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #30
	c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #31
	d''8._\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #32
	e''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #33
	c''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #34
	bfc'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #35
	a'8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #36
	} %measure 4 end point
	
	{ % measure 5 beginning
	c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "Ak"}} % SymbTr-txt #37
	d''4._\markup { \center-align {\smaller \translate #'(0 . -2.5) "şam"}} % SymbTr-txt #38
	d''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ol"}} % SymbTr-txt #39
	e''8 % SymbTr-txt #40
	d''16 % SymbTr-txt #41
	c''16 % SymbTr-txt #42
	c''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "du"}} % SymbTr-txt #43
	bfc'16 % SymbTr-txt #44
	c''8 % SymbTr-txt #45
	} %measure 5 end point
	
	{ % measure 6 beginning
	c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "hü"}} % SymbTr-txt #46
	c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "zün"}} % SymbTr-txt #47
	bfc'8 % SymbTr-txt #48
	a'8 % SymbTr-txt #49
	a'8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "len"}} % SymbTr-txt #50
	c''8 % SymbTr-txt #51
	bfc'16 % SymbTr-txt #52
	a'16 % SymbTr-txt #53
	a'8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "dim"}} % SymbTr-txt #54
	g'8 % SymbTr-txt #55
	} %measure 6 end point
	
	{ % measure 7 beginning
	c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ben"}} % SymbTr-txt #56
	bfc'16 % SymbTr-txt #57
	a'16 % SymbTr-txt #58
	bfc'8 % SymbTr-txt #59
	c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "yi"}} % SymbTr-txt #60
	d''2_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ne"}} % SymbTr-txt #61
	} %measure 7 end point
	
	{ % measure 8 beginning
	c''8^\markup { \left-align {\bold \translate #'(1 . 0) "SAZ"}} % SymbTr-txt #62
	bfc'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #63
	a'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #64
	bfc'8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #65
	c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #66
	d''4._\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #67
	r8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #68
	} %measure 8 end point
	
	{ % measure 9 beginning
	d''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "Has"}} % SymbTr-txt #69
	e''4._\markup { \center-align {\smaller \translate #'(0 . -2.5) "ret"}} % SymbTr-txt #70
	e''8._\markup { \center-align {\smaller \translate #'(0 . -2.5) "kal"}} % SymbTr-txt #71
	d''16 % SymbTr-txt #72
	e''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "dım"}} % SymbTr-txt #73
	d''32 % SymbTr-txt #74
	c''32 % SymbTr-txt #75
	d''8 % SymbTr-txt #76
	} %measure 9 end point
	
	{ % measure 10 beginning
	r8 % SymbTr-txt #77
	e''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "göz"}} % SymbTr-txt #78
	d''8 % SymbTr-txt #79
	f''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "le"}} % SymbTr-txt #80
	e''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ri"}} % SymbTr-txt #81
	d''8 % SymbTr-txt #82
	c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "nin"}} % SymbTr-txt #83
	bfc'8 % SymbTr-txt #84
	} %measure 10 end point
	
	{ % measure 11 beginning
	a'8 % SymbTr-txt #85
	d''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ren"}} % SymbTr-txt #86
	c''16 % SymbTr-txt #87
	bfc'8 % SymbTr-txt #88
	bfc'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "gi"}} % SymbTr-txt #89
	a'16 % SymbTr-txt #90
	a'4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ne"}} % SymbTr-txt #91
	d''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ah"}} % SymbTr-txt #92
	e''32 % SymbTr-txt #93
	d''32 % SymbTr-txt #94
	d''32 % SymbTr-txt #95
	c''32 % SymbTr-txt #96
	d''16 % SymbTr-txt #97
	} %measure 11 end point
	
	{ % measure 12 beginning
	d''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "Has"}} % SymbTr-txt #98
	e''4._\markup { \center-align {\smaller \translate #'(0 . -2.5) "ret"}} % SymbTr-txt #99
	e''8._\markup { \center-align {\smaller \translate #'(0 . -2.5) "kal"}} % SymbTr-txt #100
	d''16 % SymbTr-txt #101
	e''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "dım"}} % SymbTr-txt #102
	d''32 % SymbTr-txt #103
	c''32 % SymbTr-txt #104
	d''8 % SymbTr-txt #105
	} %measure 12 end point
	
	{ % measure 13 beginning
	r8 % SymbTr-txt #106
	e''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "göz"}} % SymbTr-txt #107
	d''8 % SymbTr-txt #108
	f''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "le"}} % SymbTr-txt #109
	e''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ri"}} % SymbTr-txt #110
	d''8 % SymbTr-txt #111
	c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "nin"}} % SymbTr-txt #112
	bfc'8 % SymbTr-txt #113
	} %measure 13 end point
	
	{ % measure 14 beginning
	a'8 % SymbTr-txt #114
	d''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ren"}} % SymbTr-txt #115
	c''16 % SymbTr-txt #116
	bfc'8 % SymbTr-txt #117
	bfc'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "gi"}} % SymbTr-txt #118
	a'16 % SymbTr-txt #119
	a'2_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ne"}} % SymbTr-txt #120
	} %measure 14 end point
	
	{ % measure 15 beginning
	r8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #121
	a''4^\markup { \left-align {\bold \translate #'(1 . 0) "SAZ"}} % SymbTr-txt #122
	g''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #123
	fb''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #124
	e''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #125
	fb''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #126
	g''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #127
	a''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #128
	} %measure 15 end point
	
	{ % measure 16 beginning
	g''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "Gel"}} % SymbTr-txt #129
	c'''4._\markup { \center-align {\smaller \translate #'(0 . -2.5) "meh"}} % SymbTr-txt #130
	bfc''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ta"}} % SymbTr-txt #131
	a''16 % SymbTr-txt #132
	bfc''16 % SymbTr-txt #133
	c'''16 % SymbTr-txt #134
	a''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "bım"}} % SymbTr-txt #135
	} %measure 16 end point
	
	{ % measure 17 beginning
	r8 % SymbTr-txt #136
	a''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "gel"}} % SymbTr-txt #137
	bfc''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "sev"}} % SymbTr-txt #138
	g''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "gi"}} % SymbTr-txt #139
	fb''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "lim"}} % SymbTr-txt #140
	} %measure 17 end point
	
	{ % measure 18 beginning
	r8 % SymbTr-txt #141
	g''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "gel"}} % SymbTr-txt #142
	bfc''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "yi"}} % SymbTr-txt #143
	a''2_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ne"}} % SymbTr-txt #144
	} %measure 18 end point
	
	{ % measure 19 beginning
	r8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #145
	c'''8^\markup { \left-align {\bold \translate #'(1 . 0) "SAZ"}} % SymbTr-txt #146
	bfc''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #147
	a''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #148
	g''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #149
	fb''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #150
	g''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #151
	a''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #152
	} %measure 19 end point
	
	{ % measure 20 beginning
	g''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "Gel"}} % SymbTr-txt #153
	c'''4._\markup { \center-align {\smaller \translate #'(0 . -2.5) "meh"}} % SymbTr-txt #154
	bfc''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ta"}} % SymbTr-txt #155
	a''16 % SymbTr-txt #156
	bfc''16 % SymbTr-txt #157
	c'''16 % SymbTr-txt #158
	a''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "bım"}} % SymbTr-txt #159
	} %measure 20 end point
	
	{ % measure 21 beginning
	r8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #160
	a''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "gel"}} % SymbTr-txt #161
	g''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "sev"}} % SymbTr-txt #162
	f''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "gi"}} % SymbTr-txt #163
	e''4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "lim"}} % SymbTr-txt #164
	} %measure 21 end point
	
	{ % measure 22 beginning
	r8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #165
	g''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "gel"}} % SymbTr-txt #166
	e''8 % SymbTr-txt #167
	e''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "yi"}} % SymbTr-txt #168
	d''16 % SymbTr-txt #169
	d''2_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ne"}} % SymbTr-txt #170
	} %measure 22 end point
	
	{ % measure 23 beginning
	c''8^\markup { \left-align {\bold \translate #'(1 . 0) "SAZ"}} % SymbTr-txt #171
	bfc'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #172
	a'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #173
	bfc'8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #174
	c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #175
	d''2_\markup { \center-align {\smaller \translate #'(0 . -2.5) "."}} % SymbTr-txt #176
	} %measure 23 end point
	
	{ % measure 24 beginning
	d''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "Has"}} % SymbTr-txt #177
	e''4._\markup { \center-align {\smaller \translate #'(0 . -2.5) "ret"}} % SymbTr-txt #178
	e''8._\markup { \center-align {\smaller \translate #'(0 . -2.5) "kal"}} % SymbTr-txt #179
	d''16 % SymbTr-txt #180
	e''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "dım"}} % SymbTr-txt #181
	d''32 % SymbTr-txt #182
	c''32 % SymbTr-txt #183
	d''8 % SymbTr-txt #184
	} %measure 24 end point
	
	{ % measure 25 beginning
	r8 % SymbTr-txt #185
	e''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "göz"}} % SymbTr-txt #186
	d''8 % SymbTr-txt #187
	f''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "le"}} % SymbTr-txt #188
	e''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ri"}} % SymbTr-txt #189
	d''8 % SymbTr-txt #190
	c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "nin"}} % SymbTr-txt #191
	bfc'8 % SymbTr-txt #192
	} %measure 25 end point
	
	{ % measure 26 beginning
	a'8 % SymbTr-txt #193
	d''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ren"}} % SymbTr-txt #194
	c''16 % SymbTr-txt #195
	bfc'8 % SymbTr-txt #196
	bfc'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "gi"}} % SymbTr-txt #197
	a'16 % SymbTr-txt #198
	a'4_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ne"}} % SymbTr-txt #199
	d''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ah"}} % SymbTr-txt #200
	e''32 % SymbTr-txt #201
	d''32 % SymbTr-txt #202
	d''32 % SymbTr-txt #203
	c''32 % SymbTr-txt #204
	d''16 % SymbTr-txt #205
	} %measure 26 end point
	
	{ % measure 27 beginning
	d''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "Has"}} % SymbTr-txt #206
	e''4._\markup { \center-align {\smaller \translate #'(0 . -2.5) "ret"}} % SymbTr-txt #207
	e''8._\markup { \center-align {\smaller \translate #'(0 . -2.5) "kal"}} % SymbTr-txt #208
	d''16 % SymbTr-txt #209
	e''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "dım"}} % SymbTr-txt #210
	d''32 % SymbTr-txt #211
	c''32 % SymbTr-txt #212
	d''8 % SymbTr-txt #213
	} %measure 27 end point
	
	{ % measure 28 beginning
	r8 % SymbTr-txt #214
	e''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "göz"}} % SymbTr-txt #215
	d''8 % SymbTr-txt #216
	f''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "le"}} % SymbTr-txt #217
	e''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ri"}} % SymbTr-txt #218
	d''8 % SymbTr-txt #219
	c''8_\markup { \center-align {\smaller \translate #'(0 . -2.5) "nin"}} % SymbTr-txt #220
	bfc'8 % SymbTr-txt #221
	} %measure 28 end point
	
	{ % measure 29 beginning
	a'8 % SymbTr-txt #222
	d''16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ren"}} % SymbTr-txt #223
	c''16 % SymbTr-txt #224
	bfc'8 % SymbTr-txt #225
	bfc'16_\markup { \center-align {\smaller \translate #'(0 . -2.5) "gi"}} % SymbTr-txt #226
	a'16 % SymbTr-txt #227
	a'2_\markup { \center-align {\smaller \translate #'(0 . -2.5) "ne"}} % SymbTr-txt #228
	} %measure 29 end point
	
	{ % measure 30 beginning
	} %measure 30 end point
	\bar "|."
}