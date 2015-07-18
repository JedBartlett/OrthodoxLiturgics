\version "2.18.2"

\score
{
	\context ChoirStaff
	<<
		\context Staff = women
		<<
			\key g \major
			\time 4/4
			\clef treble
			\context Voice = "sopranos"
			{
				\voiceOne
				\relative g'
				{
					g2 g4 a b b a( b) c2 b4 a g1  \bar "|."
				}
			}
			\context Voice = "altos"
			{
				\voiceTwo
				\relative f'
				{
					d2 d4 g g g g2 g g4 fis d1
				}
			}
		>>
		\new Lyrics \lyricsto "sopranos"
		{
			Glo -- ry to Thee, O Lord, glo -- ry to Thee.
		}
		\context Staff = men
		<<
			\key g \major
			\time 4/4
			\clef bass
			\context Voice = "tenors"
			{
				\voiceOne
				\relative c'
				{
					b2 b4 c d d c( d) e2 d4 d b1
				}
			}
			\context Voice = "bass"
			{
				\voiceTwo
				\relative f
				{
					g2 g4 g g g e( d) c2 d4 d g1
				}
			}
		>>
	>>
}

