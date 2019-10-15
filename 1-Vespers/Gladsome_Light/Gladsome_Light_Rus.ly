\version "2.18.2"

\header {
  title = "O Gladsome Light"
  composer = "Tone 5"
  poet = "Byzantine"
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
  \numericTimeSignature
  \time 2/4
  \tempo 4=152
}

sopranoVoice = \relative g' {
  \global
  \dynamicUp
  % Music follows here.
  \relative g'
  {
    g4 g g a g f g a bes( c) bes2~ bes4
    bes4 a g a bes a8( g f4) g2
    bes4( a) g a bes( c) bes2
    bes4 a c8( bes) a( c) bes2
    g4 g g a bes( c) bes a bes a g a c( bes8 a bes2)
    bes4 c d c bes c bes( a) bes
    bes4 bes8( c bes a) g( f g a)
    bes4 g a a a bes a8( g f4) g2~ g4
    f4 g a bes c d( c) bes a g a c8( bes a c bes4.)
    a8 g4( a) bes c d( ees8 f) d4( c) bes( a c) bes8( a) bes4.
    bes8 bes4( c) bes a g8(f g4 a8 bes a4 c bes8 a bes2)
    bes4 bes a g f g c bes a2 g
  }
}

verse = \lyricmode {
  % Lyrics follow here.
  O Glad -- some Light of the Ho -- ly Glo -- ry
  Of the Im -- mor -- tal Fa -- ther,
  Hea -- ven -- ly, Ho -- ly,
  Bles -- sed Je -- sus Christ,
  Now that we have come to the set -- ting of the sun, __
  And be -- hold the light of eve -- ning
  We praise __ God: Fa -- ther, Son and Ho -- ly Spi -- rit.
  For meet it is at all times to wor -- ship Thee
  With voic -- es of praise, O Son  of God
  And giv -- er of life. __
  There -- fore all the world doth glo -- ri -- fy Thee.
}

\score {
  \new Staff \with {
    midiInstrument = "choir aahs"
  } { \sopranoVoice }
  \addlyrics { \verse }
  \layout { }
  \midi {
    \tempo 4=152
  }
}
