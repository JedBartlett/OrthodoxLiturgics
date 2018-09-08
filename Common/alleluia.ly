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
			\context Voice = "sopranos"
			{
				\voiceOne
				\relative g'
				{
					\repeat volta 2
					{
						\partial 4
						f8 g a4.( g8) f4
						bes8 bes a4.( g8) f4
						f8 a g4.( f8 e4 d8 e) f2.\fermata
					}
					\partial 4
					a8 bes c4.( bes8) a4
					d8 d c4.( bes8) a4
					a8 c bes4.( a8 g4 f8 g) a2.\fermata\bar"|."
				}
			}
			\context Voice = "altos"
			{
				\voiceTwo
				\relative f'
				{
					\repeat volta 2
					{
						c8 c f4.( c8) c4
						f8 f f4.( c8) c4
						f8 f e4.( c8~ c2) c2.
					}
					f8 g a4.( g8) f4
					bes8 bes a4.( g8) f4
					f8 a g4.( f8 e4 d8 e) f2.
				}
			}
		>>
		\new Lyrics \lyricsto "sopranos"
		{
			\repeat volta 2
			{
				Al -- le -- lu -- ia.
				Al -- le -- lu -- ia.
				Al -- le -- lu -- ia.
			}
			Al -- le -- lu -- ia.
			Al -- le -- lu -- ia.
			Al -- le -- lu -- ia.
		}
		\context Staff = men
		<<
			\key f \major
			\clef bass
			\context Voice = "tenors"
			{
				\voiceOne
				\relative c'
				{
					\repeat volta 3
					{
						a8 bes c4.( bes8) a4
						d8 d c4.( bes8) a4
						a8 c bes4.( a8 g4 f8 g) a2.
					}
					c8 c c2 c4
					f8 f c2 c4
					c8 c c1 c2.
				}
			}
			\context Voice = "bass"
			{
				\voiceTwo
				\relative f
				{
					\repeat volta 3
					{
						f8 f f2 f4
						bes,8 d f2 f4
						f8 f c1 <f f,>2.
					}
					f8 f f2 f4
					bes,8 d f2 f4
					f8 f c1 <f f,>2.
				}
			}
		>>
	>>
}
