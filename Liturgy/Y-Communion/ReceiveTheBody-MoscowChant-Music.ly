\version "2.18.2"


global = {
  \time 14/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyrtxt = \lyricmode {
  Re -- ceive the bo -- dy of Christ; \bar"|"
  Taste the foun -- tain of im -- mor -- tal -- i -- ty.

  Al -- le -- lu -- ia! \bar"|"
  Al -- le -- lu -- ia! Al -- le -- lu -- ia!
}

soprano = \relative g' {
  \global % Leave these here for key to display
  \repeat volta 3 {f4^\markup{Thrice} f g a( bes) g a8( g) f2
  bes4 bes a4.( g8) f4 g a bes g a8( g) f1 \fermata}

  f4 g a( bes g a8 g) f2
  bes4 bes a4.( g8) f4( g) a bes g( a8 g) f1 \fermata \bar "|."
}

alto = \relative g {
  \global % Leave these here for key to display
  \repeat volta 3 {c4 c e f2 e4 e f2
  f4 f f4.( e8) f4 f f f e e c1}

  c4 e f2( e2) f2
  f4 f f4.( e8) f2 f4 f e2 c1
}

tenor = \relative c' {
  \global % Leave these here for key to display
  \repeat volta 3 {a4 a c c( d) bes c8( bes) a2
  d4 d c4.( bes8) a4 bes c d bes c8( bes) a1}

  a4 c c( d bes c8 bes) a2
  d4 d c4.( bes8) a4( bes) c d bes( c8 bes) a1
}


bass = \relative c {
  \global % Leave these here for key to display
  \repeat volta 3 {f4 f c f( bes,) c c d4.( c8)
  bes4 bes c2 f4 f f bes, c c f1 \fermata}

  f4 c f( bes, c c) d4.( c8)
  bes4 bes c2 f2 f4 bes, c( c) f1 \fermata
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
