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
				\cadenzaOn s1 s1 s2 \cadenzaOff s1	%14
				\cadenzaOn s1 s1 s4 \cadenzaOff s1	%13
				\cadenzaOn s1 s2. \cadenzaOff s1	%11
				\cadenzaOn s1 s1 \cadenzaOff s1	%12
				\cadenzaOn s1 s2 s1 s2. \cadenzaOff s1	%17
			}
			\context Voice = "sopranos"
			{
				\voiceOne
				\relative g'
				{
					g4 a2 a4 a bes c2( bes) a2
					a4 a a a a a a a a a g2 f
					a2 a4 a a a bes c2 bes a
					a4 a a a a a a g2 f
					g4 a2 a4 a bes c2( bes) a
					a4 a g a bes2 bes4 a bes a2( g) f1
				}
			}
			\context Voice = "altos"
			{
				\voiceTwo
				\relative f'
				{
					e4 f2 f4 f f f1 f2
					f4 f f f f f f f f f e2 c
					f2 f4 f f f f f2 f f
					f4 f f f f f f e2 c
					e4 f2 f4 f f f1 f2
					f4 f d f f2 f4 f f f2( e) c1
				}
			}
		>>
		\new Lyrics \lyricsto "sopranos"
		{
			O ye who love the mar -- tyrs,
			raise up an hon -- ored cho -- rus is god -- ly man -- ner;
			hon -- or -- ing the most wise Kath -- er -- ine;
			for in the a -- re -- na she preached Christ
			and trod up -- on the ser -- pent,
			put -- ting down the know -- ledge of the rhet -- ors.
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
					c4 c2 c4 c d ees2( d) c
					c4 c c c c c c c c c bes2 a
					c2 c4 c c c d ees2 d c
					c4 c c c c c c bes2 a
					c4 c2 c4 c d ees2( d) c
					c4 c bes c d2 d4 c d c2( bes) a1
				}
			}
			\context Voice = "bass"
			{
				\voiceTwo
				\relative f
				{
					c4 f2 f4 f <bes, bes'>4 <a a'>2( <<{bes4 d)} {bes'2}>> f2
					f4 f f f f f f f f f c2 f
					f2 f4 f f f <bes, bes'>4 <a a'>2 <<{bes4( d)} {bes'2}>> f2
					f4 f f f f f f c2 f
					c4 f2 f4 f <bes, bes'>4 <a a'>2( <<{bes4 d)} {bes'2}>> f2
					f4 f g f bes,2 bes4 f' bes, c1 f
				}
			}
		>>
	>>
}
