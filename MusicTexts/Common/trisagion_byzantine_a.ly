\version "2.18.2"

\score 
{
	\context ChoirStaff
	<<
		\context Staff = women
		<<
			\key f \major
			\clef treble
			\time 2/4
			\context Voice = "sopranos"
			{
				\voiceOne
				\relative g'
				{
					\repeat volta 3
					{
						a4(^\markup { "Thrice" } g f8 e d c d4) e f2 \bar "||"
						a4( g f) f a( bes) c2 \bar "||"
						c2 d4 c bes8( a g bes) a2 \bar "||"
						bes4( g) a8[( bes a g]) f[( e]) d[( e]) f2
					}
					f8 f f g a4 a8 a g f g4 f e8( d) c4 d e f f
					a4~ a8 a8 bes4 a8 a a a bes4 g8 g a4.( g8) a4 bes c2 \bar "||"
					c2 d4 c bes8( a g bes) a2 \bar "||"
					bes4( g) a8( bes a g) f[( e]) d[( e]) f2 \bar "||"
				}
			}
			\context Voice = "altos"
			{
				\voiceTwo
				\relative f'
				{
					\repeat volta 3
					{
						f4( e c2 bes4) c c2
						f4( e c) c f( e) f2
						f2 f4 f g8( f e g) f2
						e2 f c4 c c2
					}
					c8 c d e f4 f8 f e d d4 d c c c c c c
					f4~ f8 f8 g4 f8 f f f g4 e8 e f4.( e8) f4 g a2
					f2 f4 f g8( f e g) f2
					e2 f c4 c c2
				}
			}
		>>
		\new Lyrics \lyricsto "sopranos"
		{
			\repeat volta 3
			{
				Ho -- ly God,
				Ho -- ly Migh -- ty,
				Ho -- ly Im -- mor -- tal,
				Have Mer -- cy on us.
			}
			Glo -- ry to the Fa -- ther, and to the Son, and to the Ho -- ly Spi -- rit,
			now and ev -- er and un -- to a -- ges of a -- ges.  A -- men.
			Ho -- ly Im -- mor -- tal,
			Have Mer -- cy on us.
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
						c4( bes a2 f4) bes a2
						c4( bes a) a c2 c
						c2 bes4 c c2 c
						c2 c8( d c bes) a[( g]) f[(bes]) a2
					}
					a8 a a c c4 c8 c bes a g4 g g8( f) e4 f g a a
					c4~ c8 c8 c4 c8 c c c c4 c8 c c2 c4 c c2
					c2 bes4 c c2 c
					c2 c8( d c bes) a[( g]) f[(bes]) a2
				}
			}
			\context Voice = "bass"
			{
				\voiceTwo
				\relative f
				{
					\repeat volta 3
					{
						f4( c f2 bes,4) c f2
						f4( c f) f f( g) a2
						a2 bes4 a g8( f c4) f2
						c2 f c4 c f2
					}
					f8 f d c f4 f8 f c d bes4 bes c c c c f f
					f4~ f8 f8 e4 f8 f f f c'4 c8 bes a4.( bes8) a4 g f2
					a2 bes4 a g8( f c4) f2
					c2 f c4 c f2
				}
			}
		>>
	>>
}
