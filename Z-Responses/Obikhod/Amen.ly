\version "2.18.2"

\score
{
	\context ChoirStaff
	<<
		\context Staff = women
		<<
			\key f \major
			\time 4/4
			\clef treble
			\context Voice = "sopranos"
			{
				\voiceOne
				\relative g'
				{
					a1 a  \bar "|."
				}
			}
			\context Voice = "altos"
			{
				\voiceTwo
				\relative f'
				{
					f1 f
				}
			}
		>>
		\new Lyrics \lyricsto "sopranos"
		{
			A -- men.
		}
		\context Staff = men
		<<
			\key f \major
			\time 4/4
			\clef bass
			\context Voice = "tenors"
			{
				\voiceOne
				\relative c'
				{
					c1 c
				}
			}
			\context Voice = "bass"
			{
				\voiceTwo
				\relative f
				{
					f1 f
				}
			}
		>>
	>>
}

