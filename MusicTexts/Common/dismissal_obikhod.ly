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
				\cadenzaOn s1 s2 \bar "" s1 \bar "" s1 s4 \cadenzaOff s1
				\cadenzaOn s1 \bar "" s1 s1 \cadenzaOff s1
				\cadenzaOn s1 \bar "" s1 \bar "" s2 \cadenzaOff s1
				\cadenzaOn s1 \cadenzaOff s1
			}
			\context Voice = "sopranos"
			{
				\voiceOne
				\relative g'
				{
					a4 a a a a a a a a a a a a a a a2 a
					a4 a a a a a a a a a a2 a4 a a2
					a4 a a a a a a a a a a2 a
					bes2 bes a1
				}
			}
			\context Voice = "altos"
			{
				\voiceTwo
				\relative f'
				{
					f4 f f f f f f f f f f f f f f f2 f
					f4 f f f f f f f f f f2 f4 f f2
					f4 f f f f f f f f f f2 f
					f2 e f1
				}
			}
		>>
		\new Lyrics \lyricsto "sopranos"
		{
			Glo -- ry to the Fa -- ther, and to the Son, and to the Ho -- ly Spi -- rit,
			now and ev -- er and un -- to a -- ges of a -- ges.  A -- men.
			Lord, have mer -- cy.  Lord, have mer -- cy.  Lord, have mer -- cy.
			O Lord, Bless.
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
					c4 c c c c c c c c c c c c c c c2 c
					c4 c c c c c c c c c c2 c4 c c2
					c4 c c c c c c c c c c2 c
					d2 c c1
				}
			}
			\context Voice = "bass"
			{
				\voiceTwo
				\relative f
				{
					f4 f f f f f f f f f f f f f f f2 f
					f4 f f f f f f f f f f2 f4 f f2
					f4 f f f f f f f f f f2 f
					<bes bes,>2 <a c,> f1
				}
			}
		>>
	>>
}
