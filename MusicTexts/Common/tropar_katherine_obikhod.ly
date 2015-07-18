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
				\cadenzaOn s1 \bar "" s1. \bar "" s1 \bar "" s1 s1 s4 \cadenzaOff s1	%27
				\cadenzaOn s1. \bar "" s1 \bar "" s1 s2. \bar "" s1 s1 \cadenzaOff s1	%29
				\cadenzaOn s1 s4 \bar "" s1 s4 \bar "" s2. \cadenzaOff s1	%18
				\cadenzaOn s1 \bar "" s1. \cadenzaOff s1	%14
				\cadenzaOn s2. \bar "" s2. \bar "" s1 s1 s4 \bar "" s1. \cadenzaOff s1	%25
				\cadenzaOn s1 \bar "" s2 \bar "" s1. \cadenzaOff s1	%16
				\cadenzaOn s1 s4 \bar "" s1 \bar "" s2. \bar "" s1. s1 \cadenzaOff s1 \bar "|."	%26
			}
			\context Voice = "sopranos"
			{
				\voiceOne
				\relative g'
				{
					a4 a a a a a a a a a a a a a a a a a a a a2 bes a2.
					bes4 bes bes bes bes bes bes bes bes bes bes bes bes bes bes bes bes bes bes bes2. bes4 bes bes a1
					a4 a a a a a a a a a a a2( bes) a2
					bes4 bes bes bes bes bes bes2. bes4 a1
					a4 a a a a a a a a a a a a a a a a a a a2 bes a2
					bes4 bes bes bes bes bes bes bes bes2. bes4 a1
					a4 a a a a a a a a a a a a a a a a a a2 bes a1
				}
			}
			\context Voice = "altos"
			{
				\voiceTwo
				\relative f'
				{
					f4 f f f f f f f f f f f f f f f f f f f f2 g fis2.
					g4 g g g g g g g g g g g g g g g g g g g2. g4 g g f1
					f4 f f f f f f f f f f f2( g) fis2
					g4 g g g g g g2. g4 f1
					f4 f f f f f f f f f f f f f f f f f f f2 g fis2
					g4 g g g g g g g g2. g4 f1
					f4 f f f f f f f f f f f f f f f f f f2 g f1
				}
			}
		>>
		\new Lyrics \lyricsto "sopranos"
		{
			By your vir -- tues as by rays of the sun you en -- light -- ened the un -- be -- lie -- ving phi -- lo -- so -- phers,
			and like the most bright moon you drove a -- way the dark -- ness of dis -- be -- lief from those walk -- ing in the night;
			you con -- vinced the queen, and al -- so chas -- tised the ty -- rant,
			God -- sum -- moned bride, bles -- sed Ka -- ther -- ine.
			You has -- tened with de -- sire to the hea -- ven -- ly bri -- dal cham -- ber of the fair -- est Bride -- groom Christ,
			and you were crowned by Him with a roy -- al crown;
			stand -- ing be -- fore Him with the an -- gels, pray for us who keep your most sa -- cred me -- mo -- ry.
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
					c4 c c c c c c c c c c c c c c c c c c c c2 d d2.
					d4 d d d d d d d d d d d d d d d d d d c2. c4 c c c1
					c4 c c c c c c c c c c c2( d) d2
					d4 d d d d d c2. c4 c1
					c4 c c c c c c c c c c c c c c c c c c c2 d d2
					d4 d d d d d d d c2. c4 c1
					c4 c c c c c c c c c c c c c c c c c c2 c c1
				}
			}
			\context Voice = "bass"
			{
				\voiceTwo
				\relative f
				{
					f4 f f f f f f f f f f f f f f f f f f f a2 g d2.
					g4 g g g g g g g g g g g g g g g g g g c,2. c4 c c f1
					f4 f f f f f f f f f f a2( g) d2
					g4 g g g g g c,2. c4 f1
					f4 f f f f f f f f f f f f f f f f f f a2 g d2
					g4 g g g g g g g c,2. c4 f1
					f4 f f f f f f f f f f f f f f f f f c2 c f1
				}
			}
		>>
	>>
}
