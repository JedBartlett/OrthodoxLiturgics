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
				\cadenzaOn s1 s1 \bar "" s1 s2. \cadenzaOff s1	%19
				\cadenzaOn s1 s2. \bar "" s4 s1 s2 \cadenzaOff s1	%18
				\cadenzaOn s1 s2 s1 \cadenzaOff s1	%14
				\cadenzaOn s1 s1 s4 \bar "" s1 s2 \cadenzaOff s1	%19
				\cadenzaOn s1 s4 \bar "" s1 s1 s4 \cadenzaOff s1	%18
				\cadenzaOn s1 s2 s1 \cadenzaOff s1	%14
			}
			\context Voice = "sopranos"
			{
				\voiceOne
				\relative g'
				{
					a4 a a a a a a a a a bes c1 bes
					g4 g g g g a bes bes a bes2 a4 a a g1
					a4 a a a a bes c2 c bes1
					g4 a bes bes bes bes bes bes bes bes a bes2 a g1
					a4 a a a a a a a a bes c2 c bes1
					g4 g g g g a bes2 a4 a g1
				}
			}
			\context Voice = "altos"
			{
				\voiceTwo
				\relative f'
				{
					f4 f f f f f f f f f g a2~( <a fis>) g1
					e4 e e e e f g g f g2 f4 f f e1
					f4 f f f f g a2 <a fis> g1
					e4 f g g g g g g g g f g2 f e1
					f4 f f f f f f f f g a2 <a fis> g1
					e4 e e e e f g2 f4 f e1
				}
			}
		>>
		\new Lyrics \lyricsto "sopranos"
		{
			It is tru -- ly meet to bless Thee, O The -- o -- to -- kos,
			ev -- er bles -- sed and most pure, and the Moth -- er of our God.
			More hon -- 'ra -- ble than the Cher -- u -- bim,
			and more glo -- ri -- ous be -- yond com -- pare than the Ser -- a -- phim,
			with -- out de -- file -- ment thou gav -- est birth to God the Word:
			true The -- o -- to -- kos we mag -- ni -- fy thee.
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
					c4 c c c c c c c c c c c2( d) d1
					c4 c c c c c c c c c2 c4 c c c1
					c4 c c c c c c2 d d1
					c4 c c c c c c c c c c c2 c c1
					c4 c c c c c c c c c c2 d d1
					c4 c c c c c c2 c4 c c1
				}
			}
			\context Voice = "bass"
			{
				\voiceTwo
				\relative f
				{
					f4 f f f f f f f f f f f2( d) g1
					c,4 c c c c f e e f e2 f4 f f c1
					f4 f f f f f f2 d g1
					c,4 f e e e e e e e e f e2 f c1
					f4 f f f f f f f f f f2 d g1
					c,4 c c c c f e2 f4 f c1
				}
			}
		>>
	>>
}
