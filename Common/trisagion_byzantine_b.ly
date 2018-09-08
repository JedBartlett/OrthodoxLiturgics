\version "2.18.2"

\score
{
	\context ChoirStaff
	<<
		\context Staff = women
		<<
			\key f \major
			\time 2/4
			\clef treble
			\context Voice = "sopranos"
			{
				\voiceOne
				\relative g'
				{
					a4( g f8 e d c d4) e f2 \bar "||"
					a4( g f) f a( bes) c2 \bar "||"
					c2 d4 c bes8( a g bes) a2 \bar "||"
					bes4( g) a8( bes a g) f[( e]) d[( e]) f2 \bar "|."
				}
			}
			\context Voice = "altos"
			{
				\voiceTwo
				\relative f'
				{
					f4( e c2 bes4) c c2
					f4( e c) c f( e) f2
					f2 f4 f g8( f e g) f2
					e2 f c4 c c2
				}
			}
		>>
		\new Lyrics \lyricsto "sopranos"
		{
			Ho -- ly God,
			Ho -- ly Migh -- ty,
			Ho -- ly Im -- mor -- tal,
			Have Mer -- cy on us.
		}
		\context Staff = men
		<<
			\key f \major
			\time 2/4
			\clef bass
			\context Voice = "tenors"
			{
				\voiceOne
				\relative c'
				{
					c4( bes a2 f4) bes a2
					c4( bes a) a c2 c
					c2 bes4 c c2 c
					c2 c8( d c bes) a[( g]) f[(bes]) a2
				}
			}
			\context Voice = "bass"
			{
				\voiceTwo
				\relative f
				{
					f4( c f2 bes,4) c f2
					f4( c f) f f( g) a2
					a2 bes4 a g8( f c4) f2
					c2 f c4 c f2
				}
			}
		>>
	>>
}
