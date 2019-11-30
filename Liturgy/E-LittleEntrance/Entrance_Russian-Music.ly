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
					f4(\mark "Moderato" g) a2 a4 bes a4( g8 a) f4( g)
					a4 g8( a) bes2 bes4 bes a4( g8 a)
					f4( g) a2 a4( bes) a g8( a) f4( \phrasingSlurDashed g)\( \slurSolid
					\parenthesize a4 \parenthesize a4 a4\) a a a a a a a
					a4 g8( a) bes2 bes4 bes a4( g8 a)
					f4 g a a a bes a( g8 a) f4( g8 a)
					bes4 bes a2(\mark "rit." g) f2\fermata \bar"|."
				}
			}
			\context Voice = "altos"
			{
				\voiceTwo
				\relative f'
				{
					f2 f f4 f f2 f4( e)
					f4 f f2 f4 f f2
					f2 f f f4 f f( \slurDashed e)( \slurSolid
					\parenthesize f4 \parenthesize f4 f4) f f f f f f f
					f4 f f2 f4 f f( e)
					f4 f f f f f f2 f
					f4 f f2( e) c2
				}
			}
		>>
		\new Lyrics \lyricsto "sopranos"
		{
			O, come, let us wor -- ship,
			and fall down be -- fore Christ,
			save us, O Son of God,
			\skip 1 \skip 1 who art ri -- sen from the dead, save
			us who sing un -- to Thee:
			Al -- le -- lu -- ia, al -- le -- lu -- ia,
			al -- le -- lu -- ia.
		}
		\new Lyrics \lyricsto "sopranos"
		{
			\skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1
			\skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1
			\skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1
			\skip 1 \skip 1 who art won -- d'rous in thy saints,
		}
		\new Lyrics \lyricsto "sopranos"
		{
			\skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1
			\skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1
			\skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1
			through the prayers of the The -- o -- to -- kos,
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
					a4 ( bes) c2 c4 d c( bes8 c) a4( bes)
					c4 bes8( c) d2 d4 d c( bes8 c)
					a4( bes) c2 c4( d) c bes8( c) a4( \slurDashed bes)( \slurSolid
					\parenthesize c4 \parenthesize c4 c4) c c c c c c c
					c4 bes8( c) d2 d4 d c( bes8 c)
					a4 bes c c c d c( bes8 c) a4( bes8 c)
					d4 d c2~( c4 bes) a2
				}
			}
			\context Voice = "bass"
			{
				\voiceTwo
				\relative f
				{
					f2 f f4 <bes, f'> f'2 f4( c)
					f4 g8( f) d'2 bes,4 d f2
					f2 f f f4 f f( \slurDashed c)( \slurSolid
					\parenthesize f4 \parenthesize f4 f4) f f f f f f f
					f4 g8( f) d'2 bes,4 d f( c)
					f4 f f f f bes, f'2 f8( ees d c)
					bes4 bes c2~ c <f f,>2
				}
			}
		>>
	>>
}
