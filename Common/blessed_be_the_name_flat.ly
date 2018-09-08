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
				\repeat volta 2
				{
					\cadenzaOn s1 s1 \bar "" s1 s2 \cadenzaOff s1
				}
				\cadenzaOn s1 s1 \bar "" s1 s1 \cadenzaOff s1 \bar "|."	%26
			}
			\context Voice = "sopranos"
			{
				\voiceOne
				\relative g'
				{
					\repeat volta 2
					{
						a4 a a a a a a a a a a a a2. a4 a2
					}
					f4 f f g a a a a a a a bes a2 g f1
				}
			}
			\context Voice = "altos"
			{
				\voiceTwo
				\relative f'
				{
					\repeat volta 2
					{
						f4 f f f f f f f f f f f f2. f4 f2
					}
					f4 f f f f f f f f f f f f2 e c1
				}
			}
		>>
		\new Lyrics \lyricsto "sopranos"
		{
			\repeat volta 2
			{
				Bles -- sed be the name of the Lord, hence -- forth and for -- ev -- er more.
			}
			Bles -- sed be the name of the Lord, hence -- forth and for -- ev -- er more.
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
					\repeat volta 2
					{
						c4 c c c c c c c c c c c c2. c4 c2
					}
					a4 a a bes c c c c c c c d c2 c a1
				}
			}
			\context Voice = "bass"
			{
				\voiceTwo
				\relative f
				{
					\repeat volta 2
					{
						f4 f f f f f f f f f f f f2. f4 f2
					}
					f4 f f f f f f f f f f bes, f'2 c f1
				}
			}
		>>
	>>
}
