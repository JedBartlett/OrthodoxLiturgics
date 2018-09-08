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
			% Leaving \cadenzaOn and forcing manual beaming would have drawn the bars,
			% but would not have numbered the measures.
				\cadenzaOn s1 s2 \bar "" s4 \cadenzaOff s1	%11
				\cadenzaOn s2. s2. \cadenzaOff s1	%10
				\cadenzaOn s1 s2 \bar "" s4 \cadenzaOff s1	%11
				\cadenzaOn s1 s4 \cadenzaOff s1	%9
				\cadenzaOn s1 s4 \cadenzaOff s1	%9

				\cadenzaOn s1 s2 \bar "" s4 \cadenzaOff s1	%11
				\cadenzaOn s1 \bar "" s1 s4 \cadenzaOff s1	%13
				\cadenzaOn s1 s2 \bar "" s1 \cadenzaOff s1	%14
				\cadenzaOn s2 \bar "" s2 s2. \cadenzaOff s1	%11
				\cadenzaOn s1 s2 \bar "" s2 \cadenzaOff s1	%12

				\cadenzaOn s2. \bar "" s1 \bar "" s2. \cadenzaOff s1	%14
				\cadenzaOn s1 s4 \bar "" s1 s4 \bar "" s2. \cadenzaOff s1	%17
				\cadenzaOn s1 \bar "" s2. \bar "" s1 \cadenzaOff s1	%15
				\cadenzaOn s1 s4 \bar "" s2. \bar "" s2 \cadenzaOff s1	%14
				\cadenzaOn s1 \bar "" s1 \bar "" s1 s4 \cadenzaOff s1	%17

				\cadenzaOn s1 s2 \bar "" s4 \cadenzaOff s1	%11
				\cadenzaOn s1 s4 \cadenzaOff s1	%9
				\cadenzaOn s1 \cadenzaOff s1	%8
				\cadenzaOn s1 s2. \cadenzaOff s1 \bar "|."	%11
			}
			\context Voice = "sopranos"
			{
				\voiceOne
				\relative g'
				{
					f4 f g2( a) f4( g) a bes2
					a4 a a g2 g4 f1
					f4 f g2( a) f4( g) a bes2
					a4 a a a a g( a) bes2
					a4 a g2 g4 f1
					f4 f g2( a) f4( g) a bes2
					a4 a a a a a g2 g4 f1
					f4 f g2( a) f4 g a bes2 bes4 bes2
					a4 a a a a g2 f1
					f4 f g2( a) f4 f g a bes2
					a4 a a a a a a a g2 f1
					f4 g2( a) f4 f f f g a bes2 bes4 bes4 bes2
					a4 a a a a a a a a g2 f1
					f4 g2( a) f4 f f g a bes2 bes2
					a4 a a a a a a a a g2 g f1
					f4 f g2( a) f4( g) a bes2
					a4 a a a a g( a) bes2
					a4 a g a bes1
					a4 \mark "rit." a a g2 g f1
				}
			}
			\context Voice = "altos"
			{
				\voiceTwo
				\relative f'
				{
					c4 c e2( f) f f4 f2
					f4 f f e2 d4 c1
					c4 c e2( f) f f4 f2
					f4 f f f f f2 f
					f4 f e2 e4 c1
					c4 c e2( f) f f4 f2
					f4 f f f f f e2 e4 c1
					c4 c e2( f) f4 f f f2 f4 f2
					f4 f f f f e2 c1
					c4 c e2( f) f4 f f f f2
					f4 f f f f f f f e2 c1
					c4 e2( f) f4 f f f f f f2 f4 f f2
					f4 f f f f f f f f e2 c1
					c4 e2( f) f4 f f f f f2 f
					f4 f f f f f f f f e2 e c1
					c4 c e2( f) f f4 f2
					f4 f f f f f2 f
					f4 f f f f1
					f4 f f e2 e c1
				}
			}
		>>
		\new Lyrics \lyricsto "sopranos"
		{
			Bless the Lord, O my soul,
			bles -- sed art Thou, O Lord.
			Bless the Lord, O my soul,
			and all that is with -- in me
			bless His Ho -- ly Name.
			Bless the Lord, O my soul,
			and for -- get not all His be -- ne -- fits.
			Who for -- gives all your i -- ni -- qui -- ty,
			Who heals all your di -- sea -- ses.
			Who re -- deems your life from the Pit,
			Who crowns you with stead -- fast love and mer -- cy.
			Who sa -- tis -- fies you with good as long as you live,
			so that your youth is re -- newed like the ea -- gle's.
			The Lord is mer -- ci -- ful and gra -- cious,
			slow to an -- ger and a -- boun  -- ding in stead -- fast love.
			Bless the Lord, O my soul,
			and all that is with -- in me
			bless His Ho -- ly Name.
			Bles -- sed art Thou, O Lord.
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
					a4 a c1 a4( bes) c d2
					c4 c c bes2 bes4 a1
					a4 a c1 a4( bes) c d2
					c4 c c c c bes( c) d2
					c4 c bes2 bes4 a1
					a4 a c1 a4( bes) c d2
					c4 c c c c c bes2 bes4 a1
					a4 a c1 a4 bes c d2 d4 d2
					c4 c c c c bes2 a1
					a4 a c1 a4 a bes c d2
					c4 c c c c c c c bes2 a1
					a4 c1 a4 a a a bes c d2 d4 d d2
					c4 c c c c c c c c bes2 a1
					a4 c1 a4 a a bes c d2 d
					c4 c c c c c c c c bes2 bes a1
					a4 a c1 a4( bes) c d2
					c4 c c c c bes( c) d2
					c4 c bes c d1
					c4 c c bes2 bes a1
				}
			}
			\context Voice = "bass"
			{
				\voiceTwo
				\relative f
				{
					f4 f c2( f) f f4 <bes, bes'>2
					f'4 f f c2 c4 f1
					f4 f c2( f) f f4 <bes, bes'>2
					f'4 f f f f f2 <bes, bes'>2
					f'4 f c2 c4 f1
					f4 f c2( f) f f4 <bes, bes'>2
					f'4 f f f f f c2 c4 f1
					f4 f c2( f) f4 f f <bes, bes'>2 <bes bes'>4 <bes bes'>2
					f'4 f f f f c2 f1
					f4 f c2( f) f4 f f f <bes, bes'>2
					f'4 f f f f f f f c2 f1
					f4 c2( f) f4 f f f f f <bes, bes'>2 <bes bes'>4 <bes bes'>4 <bes bes'>2
					f'4 f f f f f f f f c2 f1
					f4 c2( f) f4 f f f f <bes, bes'>2 <bes bes'>2
					f'4 f f f f f f f f c2 c f1
					f4 f c2( f) f f4 <bes, bes'>2
					f'4 f f f f f2 <bes, bes'>2
					f'4 f f f <bes, bes'>1
					f'4 f f c2 c f1
				}
			}
		>>
	>>
}
