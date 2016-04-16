
    \include "makam.ly" 
    \header { 
          tagline = ""
          title = "Pesendîde Sazsemâîsi"
          composer = "III. Selim (İlhâmî)"
          metre = "Usul: Aksaksemâî"
          piece = "Makam: Pesendîde, Form: Sazsemâîsi"
}
    {
      %\override Score.SpacingSpanner.strict-note-spacing = ##t
      %\set Score.proportionalNotationDuration = #(ly:make-moment 1/8)
                 
	\set Staff.beatStructure = #'(2 1 2 2 2 1)

	\time10/8
	\clef treble 
	\set Staff.keySignature = #`((6 . ,(- KOMA)) (3 . ,BAKIYE) )
	
	{ % measure 1 beginning
	g''4^\markup { \left-align {\bold \translate #'(1 . 0) "1. HANE"}} % SymbTr-txt #2
	fb''8 % SymbTr-txt #3
	e''4 % SymbTr-txt #4
	d''8 % SymbTr-txt #5
	\grace e''8 % SymbTr-txt #6
	d''16 % SymbTr-txt #7
	cb''16 % SymbTr-txt #8
	b'8 % SymbTr-txt #9
	a'8 % SymbTr-txt #10
	g'8 % SymbTr-txt #11
	} % measure 1 end point
	
	{ % measure 2 beginning
	g''4 % SymbTr-txt #12
	a''8 % SymbTr-txt #13
	g''8 % SymbTr-txt #14
	fb''8 % SymbTr-txt #15
	e''8 % SymbTr-txt #16
	d''8 % SymbTr-txt #17
	d''4 % SymbTr-txt #18
	r8 % SymbTr-txt #19
	} % measure 2 end point
	
	{ % measure 3 beginning
	b'8 % SymbTr-txt #20
	b'16 % SymbTr-txt #21
	cb''16 % SymbTr-txt #22
	d''8 % SymbTr-txt #23
	e''8 % SymbTr-txt #24
	fb''8 % SymbTr-txt #25
	g''8 % SymbTr-txt #26
	fb''16 % SymbTr-txt #27
	e''16 % SymbTr-txt #28
	d''16 % SymbTr-txt #29
	cb''16 % SymbTr-txt #30
	b'8 % SymbTr-txt #31
	r8 % SymbTr-txt #32
	} % measure 3 end point
	
	{ % measure 4 beginning
	b'8 % SymbTr-txt #33
	a'8 % SymbTr-txt #34
	g'8 % SymbTr-txt #35
	a'8. % SymbTr-txt #36
	bfk'16 % SymbTr-txt #37
	a'16 % SymbTr-txt #38
	g'16 % SymbTr-txt #39
	fb'16 % SymbTr-txt #40
	g'16 % SymbTr-txt #41
	a'4. % SymbTr-txt #42
	} % measure 4 end point
	
	{ % measure 5 beginning
	r8^\markup { \left-align {\bold \translate #'(1 . 0) "TESLİM"}} % SymbTr-txt #43
	fb'16 % SymbTr-txt #44
	g'16 % SymbTr-txt #45
	a'8 % SymbTr-txt #46
	bfc'8. % SymbTr-txt #47
	c''16 % SymbTr-txt #48
	bfc'8 % SymbTr-txt #49
	a'8 % SymbTr-txt #50
	bfc'8. % SymbTr-txt #51
	a'16 % SymbTr-txt #52
	g'8 % SymbTr-txt #53
	} % measure 5 end point
	
	{ % measure 6 beginning
	a'8. % SymbTr-txt #54
	bfc'16 % SymbTr-txt #55
	a'16 % SymbTr-txt #56
	g'16 % SymbTr-txt #57
	fb'16 % SymbTr-txt #58
	e'16 % SymbTr-txt #59
	d'8 % SymbTr-txt #60
	bfc'8 % SymbTr-txt #61
	a'16 % SymbTr-txt #62
	g'16 % SymbTr-txt #63
	g'4 % SymbTr-txt #64
	r8 % SymbTr-txt #65
	} % measure 6 end point
	
	{ % measure 7 beginning
	g'4^\markup { \left-align {\bold \translate #'(1 . 0) "2. HANE"}} % SymbTr-txt #66
	fb'8 % SymbTr-txt #67
	g'4 % SymbTr-txt #68
	bfc'8 % SymbTr-txt #69
	c''8 % SymbTr-txt #70
	d''4 % SymbTr-txt #71
	r8 % SymbTr-txt #72
	} % measure 7 end point
	
	{ % measure 8 beginning
	g''4 % SymbTr-txt #73
	fb''8 % SymbTr-txt #74
	g''4 % SymbTr-txt #75
	a''8 % SymbTr-txt #76
	bfk''8 % SymbTr-txt #77
	a''8 % SymbTr-txt #78
	g''8 % SymbTr-txt #79
	fb''8 % SymbTr-txt #80
	} % measure 8 end point
	
	{ % measure 9 beginning
	g''4 % SymbTr-txt #81
	bfk''8 % SymbTr-txt #82
	a''8 % SymbTr-txt #83
	g''8 % SymbTr-txt #84
	fb''8 % SymbTr-txt #85
	efb''8 % SymbTr-txt #86
	d''4 % SymbTr-txt #87
	r8 % SymbTr-txt #88
	} % measure 9 end point
	
	{ % measure 10 beginning
	r8 % SymbTr-txt #89
	c''16 % SymbTr-txt #90
	d''16 % SymbTr-txt #91
	efk''8 % SymbTr-txt #92
	d''8 % SymbTr-txt #93
	c''8 % SymbTr-txt #94
	bfk'8 % SymbTr-txt #95
	a'8 % SymbTr-txt #96
	g'4 % SymbTr-txt #97
	r8 % SymbTr-txt #98
	} % measure 10 end point
	
	{ % measure 11 beginning
	r8^\markup { \left-align {\bold \translate #'(1 . 0) "TESLİM"}} % SymbTr-txt #99
	fb'16 % SymbTr-txt #100
	g'16 % SymbTr-txt #101
	a'8 % SymbTr-txt #102
	bfc'8. % SymbTr-txt #103
	c''16 % SymbTr-txt #104
	bfc'8 % SymbTr-txt #105
	a'8 % SymbTr-txt #106
	bfc'8. % SymbTr-txt #107
	a'16 % SymbTr-txt #108
	g'8 % SymbTr-txt #109
	} % measure 11 end point
	
	{ % measure 12 beginning
	a'8. % SymbTr-txt #110
	bfc'16 % SymbTr-txt #111
	a'16 % SymbTr-txt #112
	g'16 % SymbTr-txt #113
	fb'16 % SymbTr-txt #114
	e'16 % SymbTr-txt #115
	d'8 % SymbTr-txt #116
	bfc'8 % SymbTr-txt #117
	a'16 % SymbTr-txt #118
	g'16 % SymbTr-txt #119
	g'4 % SymbTr-txt #120
	r8 % SymbTr-txt #121
	} % measure 12 end point
	
	{ % measure 13 beginning
	g''4^\markup { \left-align {\bold \translate #'(1 . 0) "3. HANE"}} % SymbTr-txt #122
	a''8 % SymbTr-txt #123
	g''8 % SymbTr-txt #124
	fb''8 % SymbTr-txt #125
	e''8 % SymbTr-txt #126
	d''8 % SymbTr-txt #127
	c''4 % SymbTr-txt #128
	bfc'8 % SymbTr-txt #129
	} % measure 13 end point
	
	{ % measure 14 beginning
	a'4 % SymbTr-txt #130
	e''8 % SymbTr-txt #131
	d''8 % SymbTr-txt #132
	c''8 % SymbTr-txt #133
	bfc'8 % SymbTr-txt #134
	a'8 % SymbTr-txt #135
	g'4 % SymbTr-txt #136
	r8 % SymbTr-txt #137
	} % measure 14 end point
	
	{ % measure 15 beginning
	g'8 % SymbTr-txt #138
	a'8 % SymbTr-txt #139
	bfc'8 % SymbTr-txt #140
	c''8 % SymbTr-txt #141
	d''8 % SymbTr-txt #142
	e''8 % SymbTr-txt #143
	fb''8 % SymbTr-txt #144
	g''4 % SymbTr-txt #145
	fb''8 % SymbTr-txt #146
	} % measure 15 end point
	
	{ % measure 16 beginning
	g''4 % SymbTr-txt #147
	bfc''8 % SymbTr-txt #148
	a''8 % SymbTr-txt #149
	g''8 % SymbTr-txt #150
	fb''8 % SymbTr-txt #151
	a''8 % SymbTr-txt #152
	g''4 % SymbTr-txt #153
	r8 % SymbTr-txt #154
	} % measure 16 end point
	
	{ % measure 17 beginning
	r8^\markup { \left-align {\bold \translate #'(1 . 0) "TESLİM"}} % SymbTr-txt #155
	fb'16 % SymbTr-txt #156
	g'16 % SymbTr-txt #157
	a'8 % SymbTr-txt #158
	bfc'8. % SymbTr-txt #159
	c''16 % SymbTr-txt #160
	bfc'8 % SymbTr-txt #161
	a'8 % SymbTr-txt #162
	bfc'8. % SymbTr-txt #163
	a'16 % SymbTr-txt #164
	g'8 % SymbTr-txt #165
	} % measure 17 end point
	
	{ % measure 18 beginning
	a'8. % SymbTr-txt #166
	bfc'16 % SymbTr-txt #167
	a'16 % SymbTr-txt #168
	g'16 % SymbTr-txt #169
	fb'16 % SymbTr-txt #170
	e'16 % SymbTr-txt #171
	d'8 % SymbTr-txt #172
	bfc'8 % SymbTr-txt #173
	a'16 % SymbTr-txt #174
	g'16 % SymbTr-txt #175
	g'4 % SymbTr-txt #176
	r8 % SymbTr-txt #177
	} % measure 18 end point
	
	{ % measure 19 beginning
	g''8^\markup { \left-align {\bold \translate #'(1 . 0) "4. HANE"}} % SymbTr-txt #179
	g''8 % SymbTr-txt #180
	bfc''8 % SymbTr-txt #181
	a''8 % SymbTr-txt #182
	a''8 % SymbTr-txt #183
	g''16 % SymbTr-txt #184
	a''16 % SymbTr-txt #185
	} % measure 19 end point
	
	{ % measure 20 beginning
	bfc'8 % SymbTr-txt #186
	bfc'8 % SymbTr-txt #187
	c''16 % SymbTr-txt #188
	d''16 % SymbTr-txt #189
	e''8 % SymbTr-txt #190
	e''8 % SymbTr-txt #191
	fb''16 % SymbTr-txt #192
	g''16 % SymbTr-txt #193
	} % measure 20 end point
	
	{ % measure 21 beginning
	bfc''8 % SymbTr-txt #194
	bfc''8 % SymbTr-txt #195
	c'''8 % SymbTr-txt #196
	bfc''16 % SymbTr-txt #197
	c'''16 % SymbTr-txt #198
	bfc''8 % SymbTr-txt #199
	a''8 % SymbTr-txt #200
	} % measure 21 end point
	
	{ % measure 22 beginning
	fb''8 % SymbTr-txt #201
	fb''8 % SymbTr-txt #202
	e''16 % SymbTr-txt #203
	d''16 % SymbTr-txt #204
	bfc''8 % SymbTr-txt #205
	bfc''8 % SymbTr-txt #206
	a''16 % SymbTr-txt #207
	g''16 % SymbTr-txt #208
	} % measure 22 end point
	
	{ % measure 23 beginning
	d''8 % SymbTr-txt #209
	d''8 % SymbTr-txt #210
	g''8 % SymbTr-txt #211
	fb''8 % SymbTr-txt #212
	a''4 % SymbTr-txt #213
	} % measure 23 end point
	
	{ % measure 24 beginning
	g''8 % SymbTr-txt #214
	g''8 % SymbTr-txt #215
	fb''16 % SymbTr-txt #216
	e''16 % SymbTr-txt #217
	d''8 % SymbTr-txt #218
	d''8 % SymbTr-txt #219
	c''16 % SymbTr-txt #220
	bfc'16 % SymbTr-txt #221
	} % measure 24 end point
	
	{ % measure 25 beginning
	bfc'8 % SymbTr-txt #222
	bfc'8 % SymbTr-txt #223
	a'8 % SymbTr-txt #224
	g'8 % SymbTr-txt #225
	g'8 % SymbTr-txt #226
	e''8 % SymbTr-txt #227
	} % measure 25 end point
	
	{ % measure 26 beginning
	d''8 % SymbTr-txt #228
	c''8 % SymbTr-txt #229
	bfc'8 % SymbTr-txt #230
	a'8 % SymbTr-txt #231
	g'4 % SymbTr-txt #232
	} % measure 26 end point
	
	{ % measure 27 beginning
	r8^\markup { \left-align {\bold \translate #'(1 . 0) "TESLİM"}} % SymbTr-txt #234
	fb'16 % SymbTr-txt #235
	g'16 % SymbTr-txt #236
	a'8 % SymbTr-txt #237
	bfc'8. % SymbTr-txt #238
	c''16 % SymbTr-txt #239
	bfc'8 % SymbTr-txt #240
	a'8 % SymbTr-txt #241
	bfc'8. % SymbTr-txt #242
	a'16 % SymbTr-txt #243
	g'8 % SymbTr-txt #244
	} % measure 27 end point
	
	{ % measure 28 beginning
	a'8. % SymbTr-txt #245
	bfc'16 % SymbTr-txt #246
	a'16 % SymbTr-txt #247
	g'16 % SymbTr-txt #248
	fb'16 % SymbTr-txt #249
	e'16 % SymbTr-txt #250
	d'8 % SymbTr-txt #251
	bfc'8 % SymbTr-txt #252
	a'16 % SymbTr-txt #253
	g'16 % SymbTr-txt #254
	g'4 % SymbTr-txt #255
	r8 % SymbTr-txt #256
	} % measure 28 end point
	
	{ % measure 29 beginning
	} % measure 29 end point
	\bar "|."
}