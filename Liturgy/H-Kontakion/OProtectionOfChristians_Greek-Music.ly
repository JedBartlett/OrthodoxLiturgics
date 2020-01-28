\version "2.18.2"

\score
{
	\context ChoirStaff
	<<
		\context Staff = women
		<<
			\key c \major
			\clef treble
			\time 4/4
			\override Staff.TimeSignature #'transparent = ##t
			\context Voice = "cadenzaghost"
			{
				\cadenzaOn s1 s2 s1 \bar "" s2 \cadenzaOff s1	%16
				\cadenzaOn s1 s2 s4 \bar "" s4 s1 \cadenzaOff s1	%16
				\cadenzaOn s1 s1 \bar "" s1 \cadenzaOff s1	%16
				\cadenzaOn s1 s1. \cadenzaOff s1	%14
				\cadenzaOn s1. \cadenzaOff s1	%10
				\cadenzaOn s1 s1 s2 \bar "" s1. \cadenzaOff s1	%20
				\cadenzaOn s1 s4 \cadenzaOff s1	%9
				\cadenzaOn s1 s1 s1. \cadenzaOff s1	%18
			}
			\context Voice = "sopranos"
			{
				\voiceOne
				\relative g'
				{
					e4 f g g g a g g a g a b( c) a g2
					g4 a b a g8[( f]) e4 f g a a g g8[( a] g4 f) e2
					e4 f g g a b a g a g g f e f g2
					g4 g a b g a b b c b a8( g) fis4 g2
					g4 g b( a) g( a) g a e2
					g2 f8[( e]) d4 e f f( g) g g b a g f e f f( g) g2
					fis4 g a b( a) g a b2
					g4 g a b a g g g( f) e f2( g4 aes2 g2.)
				}
			}
		>>
		\new Lyrics \lyricsto "sopranos"
		{
			O pro -- tec -- tion of Chris -- tians that can -- not be put to shame,
			Me -- di -- a -- tion un -- to the Cre -- a -- tor most con -- stant,
			O de -- spise not the sup -- pli -- ant voi -- ces of those who have sinned;
			But be thou quick, O good one, to come un -- to our aid,
			Who in faith cry un -- to thee:
			Ha -- sten to in -- ter -- ces -- sion, and speed thou to make sup -- pli -- ca -- tion,
			Thou who dost e -- ver pro -- tect, O The -- o -- to -- kos, them that ho -- nor thee.__
		}
	>>
}
