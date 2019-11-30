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
				\cadenzaOn s1 s1 s4 \cadenzaOff s1	%13
				\cadenzaOn s2. \cadenzaOff s1	%7
				\cadenzaOn s1 s2. \cadenzaOff s1 \bar "||"	%11
				\cadenzaOn s1 s1 s4 \cadenzaOff s1	%13
				\cadenzaOn s1 s1 s2 \cadenzaOff s1	%14
				\cadenzaOn s1 s1 s1 s4 \cadenzaOff s1	%17
				\cadenzaOn s1 s1 s1 s4 \cadenzaOff s1	%17
				\cadenzaOn s1 s1 \cadenzaOff s1	%12
				\cadenzaOn s1 s2. \cadenzaOff s1	%11
				\cadenzaOn s1 s4 \cadenzaOff s1	%9
				\cadenzaOn s1 s1 s4 \cadenzaOff s1	%13
				\cadenzaOn s1 s1 s2 \cadenzaOff s1	%14
				\cadenzaOn s1 s1 s1 s4 \cadenzaOff s1 \bar "||"	%17
				\cadenzaOn s1 s1 s1 \cadenzaOff s1 \bar "||"	%16
				\cadenzaOn s1 s1 s1 s4 \cadenzaOff s1	%17
				\cadenzaOn s1 s1 s1 s4 \cadenzaOff s1	%17
				\cadenzaOn s1 s1 s1 s1 \cadenzaOff s1	%20
				\cadenzaOn s1 s1 s1 \cadenzaOff s1	%16
				\cadenzaOn s1 s1 s2 \cadenzaOff s1	%14
				\cadenzaOn s1 s1 \cadenzaOff s1	%12
				\cadenzaOn s1 s1 \cadenzaOff s1	%12
				\cadenzaOn s1 s1 s2 \cadenzaOff s1	%14
				\cadenzaOn s1 s1 s1 \cadenzaOff s1 \bar "|."	%16
			}
			\context Voice = "sopranos"
			{
				\voiceOne
				\relative g'
				{
					g2( a) a4 a a bes2 bes1
					a4 a a bes1
					a4 a a a a g2 f1
					f4 f g2( a) f4( g) a bes1
					a4 bes c bes a a a2 g4 a bes1
					a4 a a a a a a a a a a g2 f1
					f4 f f g2( a) f4 f f f g a bes1
					a4 a a a a a g2 f1
					f4 f g2( a) a4 bes1
					a4 a a g a bes1
					a4 bes c bes a a a g2 f1
					a4 bes2( c) a4 bes c d2 d1
					c4 c c c c c c c c bes1 a
					a4 a a a a a a a a g a2 g4 f g2
					f4 f f g2 g4 g g g f g a( g) f( g) a2
					g4 g g a bes2 a4 a a a g a2( g) f
					f4 g a2 a4 a a a a a a a a g a( g f2) g
					f4 f f g2 g4 g g f g a( g) f( g) a2
					g4 a bes2 a4 a a g a2 g f
					a2\< a4 a\! a g a( g f2) g
					f4 f g2( f4) g a( g f g) a2
					g4 g a bes2 a4 a g a2 g f
					g2( a bes2. a4 g2 f) g1\fermata
				}
			}
			\context Voice = "altos"
			{
				\voiceTwo
				\relative f'
				{
					e2( f) f4 f f f2 f1
					f4 f f f1
					f4 f f f f e2 c1
					c4 c e2( f) f2 f4 f1
					f4 f f f f f f2 f4 f f1
					f4 f f f f f f f f f f e2 c1
					c4 c c e2( f) f4 f f f f f f1
					f4 f f f f f e2 c1
					c4 c e2( f) f4 f1
					f4 f f f f f1
					f4 f f f f f f e2 c1
					f4 f1 f4 f f f2 f1
					f4 f f f f f f f f f2( e) f1
					f4 f f f f f f f f e f2 e4 d e2
					d4 d d e2 e4 e e e d e f( e) d( e) f2
					d4 d d f f2 f4 f f f e f2( e) d
					d4 e f2 f4 f f f f f f f f e f( e d2) e
					d4 d d e2 e4 e e d e f( e) d( e) f2
					d4 f f2 f4 f f e f2 e d
					f2 f4 f f e f( e d2) e
					d4 d e2( d4) e f( e d e) f2
					d4 d f f2 f4 f e f2 e d
					d2( f f1 e2 d) d1
				}
			}
		>>
		\new Lyrics \lyricsto "sopranos"
		{
			Glo -- ry to the Fa -- ther,
			and to the Son,
			and to the Ho -- ly Spi -- rit.
			Praise the Lord, O my soul,
			I will praise the Lord as long as I live,
			I will sing prais -- es to my God while I have be -- ing.
			Put not your trust in princ -- es, in sons of men,
			in whom there is no sal -- va -- tion.
			When his breath de -- parts,
			he re -- turns to his earth;
			on that ve -- ry day his plans per -- ish.
			The Lord will reign for -- ev -- er,
			Thy God, O Zi -- on to all gen -- er -- a -- tions.
			now and ev -- er and un -- to a -- ges of a -- ges. A -- men.
			On -- ly -- be -- got -- ten Son and Im -- mor -- tal Word of God,
			who for our sal -- va -- tion willed to be in -- car -- nate
			of the Ho -- ly The -- o -- to -- kos and Ev -- er -- Vir -- gin Ma -- ry,
			who with -- out change be -- came man and was cru -- ci -- fied,
			who is One of the Ho -- ly Tri -- ni -- ty;
			glo -- ri -- fied with the Fa -- ther and the Ho -- ly Spi -- rit,
			O Christ, our God, tramp -- ling down death by death, save us.
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
					c1 c4 c c d2 d1
					c4 c c d1
					c4 c c c c bes2 a1
					a4 a c1 a4( bes) c d1
					c4 d ees d c c c2 bes4 c d1
					c4 c c c c c c c c c c bes2 a1
					a4 a a c1 a4 a a a bes c d1
					c4 c c c c c bes2 a1
					a4 a c1 c4 d1
					c4 c c bes c d1
					c4 d ees d c c c bes2 a1
					c4 c1 c4 c c bes2 bes1
					c4 c c c c c c c c d2( c) c1
					c4 c c c c c c c c c c2 c4 a c2
					a4 a a c2 c4 c c c a c c2 a4( c) c2
					bes4 bes bes c d2 c4 c c c c c1 a2
					a4 c c2 c4 c c c c c c c c c c2( a) c
					a4 a a c2 c4 c c a c c2 a4( c) c2
					bes4 c d2 c4 c c c c2 c a
					c2 c4 c c c c2( a) c
					a4 a c2( a4) c c2( a4 c) c2
					bes4 bes c d2 c4 c c c2 c a
					bes2( c d2. c2. a2) bes1
				}
			}
			\context Voice = "bass"
			{
				\voiceTwo
				\relative f
				{
					c2( f) f4 f f bes,2 bes1
					f'4 f f bes,1
					f'4 f f f f c2 f1
					f4 f c2( f) f f4 bes,1
					f'4 bes a bes f f f2 f4 f bes,1
					f'4 f f f f f f f f f f c2 f1
					f4 f f c2( f) f4 f f f f f bes,1
					f'4 f f f f f c2 f1
					f4 f c2( f) f4 bes,1
					f'4 f f d c bes1
					f'4 bes a bes f f f c2 f1
					f4 g2( a) f4 g a bes2 bes1
					a4 a a a a a a a a g2~( <g c,>2) f1
					f4 f f f f f f f f c f2 c4 d c2
					d4 d d c2 c4 c c c d c f( c) d( c) f2
					g4 g g f bes,2 f'4 f f f c f2( c) d2
					d4 c f2 f4 f f f f f f f f c f( c d2) c
					d4 d d c2 c4 c c d c f( c) d( c) f2
					g4 f bes,2 f'4 f f c f2 c d
					f2 f4 f f c f( c d2) c
					d4 d c2( d4) c f( c d c) f2
					g4 g f bes,2 f'4 f c f2 c d
					g2( f bes,2. f'4 c2 d) <g g,>1
				}
			}
		>>
	>>
}
