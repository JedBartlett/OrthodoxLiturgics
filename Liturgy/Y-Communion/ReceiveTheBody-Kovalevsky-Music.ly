\version "2.18.2"

global = {
  \time 2/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
}

lyrtxt = \lyricmode {
  Re -- ceive __ the bo -- dy of Christ;
  Taste the foun -- tain of im -- mor -- tal -- i -- ty.

  Al -- le -- lu -- i -- a!
  Al -- le -- lu -- i -- a!
  Al -- le -- lu -- i -- a!
}

soprano = \relative g' {
  \global % Leave these here for key to display
  \repeat volta 3 {\partial 8 c8^\markup{Thrice} c4.( bes8 a4) a bes8([ c bes a]) g4 a8( bes) c4 \fermata \breathe
  c4( d c8 bes) a( bes) c( bes) a4 g f4 d'4 c( g8 a bes4) c8( bes) a2 \fermata }
  c4 c8( bes) a4 g f2 \breathe
  g4 g f g a2 \breathe
  c4 c8( bes) a4 g f2 \fermata \bar "|."
}

alto = \relative g' {
  \global % Leave these here for key to display
  \repeat volta 3 {\partial 8 a8 a4.( g8 f4) f g8([ a g f]) e4 f8( g) a4
  a4( bes a8 g) f( g) a( g) f4 e f f f( g8 f g f) e4 f2}
  a4 a8( g) f4 e f2
  e4 e f e f2
  f4 g f e8( d) c2
}

tenor = \relative c' {
  \global % Leave these here for key to display
  \repeat volta 3 {\partial 8 f8 f4( c c) d d4.( c8) c4 c c
  f( f2) c4 c c c c bes c( d d) c c2}
  c4 c c c c2
  c4 c c c c2
  c4 d c c8( bes) a2
}


bass = \relative c {
  \global % Leave these here for key to display
  \repeat volta 3 {\partial 8 f8 f2( f4) d g4.( a8) c4 a8( g) f4 \fermata  \breathe
  f4( bes f) f f f g a bes a( bes8 a g4) <g c,> f2 \fermata}
  f4 f f g a2 \breathe
  c4 c8( bes) a4 g f2 \breathe
  a4 bes c c, <f f,>2 \fermata
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { S A }
    } <<
      \new Voice = "soprano" { \voiceOne \soprano }
      \new Voice = "alto" { \voiceTwo \alto }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "soprano" \lyrtxt

    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { T B }
    } <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \layout {
    \context {
      \Staff
      \remove "Time_signature_engraver"
    }
    \context {
      \Score
      \omit BarNumber
    }
  }
  \midi { \tempo 4 = 100
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
