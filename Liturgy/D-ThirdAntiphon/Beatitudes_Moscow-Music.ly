\version "2.18.2"

\score
{
	\context ChoirStaff
	<<
		\context Staff = women
		<<
			\key f \major
			\clef treble
			\time 4/4
			\override Staff.TimeSignature #'transparent = ##t
			\context Voice = "cadenzaghost"
			{
				\cadenzaOn s1 s1 \cadenzaOff s1	%12
				\cadenzaOn s1 s2. \cadenzaOff s1	%11
				\cadenzaOn s1 s2. \cadenzaOff s1	%11
				\cadenzaOn s1 s2. \cadenzaOff s1	%11
				\cadenzaOn s1 \cadenzaOff s1	%8
				\cadenzaOn s1 s4 \cadenzaOff s1	%9
				\cadenzaOn s2. \cadenzaOff s1	%7
				\cadenzaOn s1 s2 \cadenzaOff s1	%10
				\cadenzaOn s1 \bar "" s1 s4 \bar "" s2. \cadenzaOff s1	%16
				\cadenzaOn s2. \cadenzaOff s1	%7
				\cadenzaOn s1 s4 \cadenzaOff s1	%9
				\cadenzaOn s1 s4 \cadenzaOff s1	%9
				\cadenzaOn s1 s4 \cadenzaOff s1	%9
				\cadenzaOn s2. \cadenzaOff s1	%7
				\cadenzaOn s1 s4 \cadenzaOff s1	%9
				\cadenzaOn s1 s2. \cadenzaOff s1	%11
				\cadenzaOn s1 \bar "" s1 s2 \bar "" s2 s4 \cadenzaOff s1	%17
				\cadenzaOn s1 s2. \cadenzaOff s1	%11
				\cadenzaOn s1 \bar "" s1 s2 \bar "" s2 s4 \cadenzaOff s1	%17
				\cadenzaOn s2. \bar "" s4 s1 s4 \bar "" s1 s2 \bar "" s2 \cadenzaOff s1	%19
				\cadenzaOn s1 s2. \cadenzaOff s1	%11
				\cadenzaOn s1 s1 s4 \cadenzaOff s1 \bar "|."	%13
			}
			\context Voice = "sopranos"
			{
				\voiceOne
				\relative g'
				{
					a4 a a a a a a g2 a4 bes2
					bes4 bes bes bes bes a bes c2 a
					a4 a a a a a g2( a4) bes2
					bes4 bes bes bes bes a bes c2 a
					a4 a a g2 a4 bes2
					bes4 bes a bes c2 a4 a2
					a2 a4 g a bes2
					bes4 bes a bes c2 c4 bes a2
					a4 a a a a a a a a a a g2 a4 bes2
					bes4 bes c2 bes4 a2
					a4 a a a g2 a4 bes2
					bes4 bes bes bes bes c2 a
					a4 a a a g2 a4 bes2
					bes4 a bes c2 a
					a4 a a a g2 a4 bes2
					bes4 bes bes bes a bes c2 bes4 a2
					a4 a a a a a a a a a a g2 g4 a bes2
					bes4 bes bes bes bes a bes c2 a2
					a4 a a a a a a a a a a g2 g4 a bes2
					bes4 bes bes bes bes bes bes bes bes bes a bes c2 c4 c bes a1
					a4 a a a a g2 g4 a bes2
					bes4 bes bes bes bes a bes c2 a1
				}
			}
			\context Voice = "altos"
			{
				\voiceTwo
				\relative f'
				{
					f4 f f f f f f e2 f4 g2
					g4 g g g g f g a2 f
					f4 f f f f f e2( f4) g2
					g4 g g g g f g a2 f
					f4 f f e2 f4 g2
					g4 g f g a2 f4 f2
					f2 f4 e f g2
					g4 g f g a2 a4 g f2
					f4 f f f f f f f f f f e2 f4 g2
					g4 g a2 g4 f2
					f4 f f f e2 f4 g2
					g4 g g g g a2 f
					f4 f f f e2 f4 g2
					g4 f g a2 f
					f4 f f f e2 f4 g2
					g4 g g g f g a2 g4 f2
					f4 f f f f f f f f f f e2 e4 f g2
					g4 g g g g f g a2 f
					f4 f f f f f f f f f f e2 e4 f g2
					g4 g g g g g g g g g f g a2 a4 a g f1
					f4 f f f f e2 e4 f g2
					g4 g g g g f g a2 f1
				}
			}
		>>
		\new Lyrics \lyricsto "sopranos"
		{
			In Thy King -- dom re -- mem -- ber us, O Lord,
			When Thou com -- est in -- to Thy King -- dom.
			Bles -- sed are the poor in spi -- rit,
			For theirs is the king -- dom of Hea -- ven.
			Bles -- sed are those who mourn,
			For they shall be com -- fort -- ed.
			Bles -- sed are the meek,
			For they shall in -- her -- it the earth.
			Bles -- sed are those who hun -- ger and thirst af -- ter right -- eous -- ness,
			For they shall be filled.
			Bles -- sed are the mer -- ci -- ful,
			For they shall ob -- tain mer -- cy.
			Bles -- sed are the pure in heart,
			For they shall see God.
			Bles -- sed are the peace -- mak -- ers,
			For they shall be called the sons of God.
			Bles -- sed are those who are per -- se -- cut -- ed for right -- eous -- ness sake,
			For theirs is the king -- dom of Hea -- ven.
			Bles -- sed are you when men shall re -- vile you and per -- se -- cute you,
			And shall say all man -- ner of e -- vil a -- gainst you false -- ly for My sake.
			Re -- joice and be ex -- ceed -- ing -- ly glad,
			For great is your re -- ward in Hea -- ven.
		}
		\context Staff = men
		<<
			\key f \major
			\clef bass
			\override Staff.TimeSignature #'transparent = ##t
			\context Voice = "tenors"
			{
				\voiceOne
				\relative c'
				{
					c4 c c c c c c c2 c4 d2
					c4 c c c c c c c2 c
					c4 c c c c c c2( c4) d2
					c4 c c c c c c c2 c
					c4 c c c2 c4 d2
					c4 c c c c2 c4 c2
					c2 c4 c c d2
					c4 c c c c2 c4 c c2
					c4 c c c c c c c c c c c2 c4 d2
					c4 c c2 c4 c2
					c4 c c c c2 c4 d2
					c4 c c c c c2 c
					c4 c c c c2 c4 d2
					c4 c c c2 c
					c4 c c c c2 c4 d2
					c4 c c c c c c2 c4 c2
					c4 c c c c c c c c c c c2 c4 c d2
					c4 c c c c c c c2 c
					c4 c c c c c c c c c c c2 c4 c d2
					c4 c c c c c c c c c c c c2 c4 c c c1
					c4 c c c c c2 c4 c d2
					c4 c c c c c c c2 c1
				}
			}
			\context Voice = "bass"
			{
				\voiceTwo
				\relative f
				{
					f4 f f f f f f c'2 a4 g2
					c,4 c c c c c c f2 f
					f4 f f f f f c'2( a4) g2
					c,4 c c c c c c f2 f
					f4 f f c'2 a4 g2
					c,4 c c c f2 f4 f2
					f2 f4 c'4 a g2
					c,4 c c c f2 f4 f f2
					f4 f f f f f f f f f f c'2 a4 g2
					c,4 c f2 f4 f2
					f4 f f f c'2 a4 g2
					c,4 c c c c f2 f
					f4 f f f c'2 a4 g2
					c,4 c c f2 f
					f4 f f f c'2 a4 g2
					c,4 c c c c c f2 f4 f2
					f4 f f f f f f f f f f c'2 c4 a g2
					c,4 c c c c c c f2 f
					f4 f f f f f f f f f f c'2 c4 a g2
					c,4 c c c c c c c c c c c f2 f4 f f f1
					f4 f f f f c'2 c4 a g2
					c,4 c c c c c c f2 f1
				}
			}
		>>
	>>
}
