\version "2.18.2"

\header {
  title = "O Joyous Light"
  subtitle = "Plagal of First Tone (Heirmologic)"
}

\paper {
  #(set-paper-size "letter")
  top-margin = 1\in
  right-margin = 1.5\in
  bottom-margin = 1\in
  left-margin = 1.5\in
}

\layout {
  \context {
    \Voice
    \consists "Melody_engraver"
    \override Stem #'neutral-direction = #'()
  }
}

global = {
  \key f \major
  \time 2/4
  \tempo 4=152
}

sopranoVoice = \relative g' {
  \global
  \dynamicUp
  % Music follows here.
  <g \parenthesize d>4^"D" g4 g a g f <\parenthesize g>^"G" a bes( c) bes2~ bes4
  bes4 a g <a \parenthesize f>^"F" bes a8[( g]) f4 <\parenthesize g>2^"G"
  g4( a) bes( c) bes a c8[( bes a c]) bes2
  bes4( a) g a bes2
  g4 a bes( c) bes a bes a g a c( bes8[ a] bes4.)
  a8 bes4 c d c bes a bes
  a4 bes8[( c bes a]) g[( f g a]) bes4 g <a \parenthesize f>^"F" a a( bes) a8[( g] f4) <\parenthesize g>2^"G"
  g4 a bes c bes c d( c) bes( a) g a c8[( bes a c] bes4.)
  a8 bes4 c d( ees8[ f]) d4( c) bes( a) c bes8[( a]) bes2
  bes4( c bes a) g8[( f] g4) a8[( bes] a4) c( bes8[ a] bes4)
  bes4 a g <\parenthesize f>^"F" g c bes a2 <\parenthesize g>^"G"
}

verse = \lyricmode {
  % Lyrics follow here.
  O Joy -- ous Light of the ho -- ly glo -- ry
  of the im -- mor -- tal hea -- ven -- ly,
  ho -- ly, bles -- sed fa -- ther,
  O Je -- sus Christ:
  we that come to the set -- ting of the sun,
  when we be -- hold the eve -- ning light
  praise Fa -- ther, Son, and Ho -- ly Spi -- rit, God.
  Meet it is for Thee at all times
  to be praised with glad -- some voi -- ces, O Son of God,
  Gi -- ver of Life;
  where -- fore the world doth glo -- ri -- fy Thee.
}

\score {
  \new Staff \with {
    midiInstrument = "choir aahs"
  } { \sopranoVoice }
  \addlyrics { \verse }
  \layout { }
  \midi { }
}
