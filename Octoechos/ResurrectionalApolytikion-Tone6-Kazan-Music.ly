\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Starts with
  \key c \major
}

lyricText = \lyricmode {
  When Ma -- ry stood __ at Thy grave look -- ing for Thy sa -- cred bod -- y,
  an -- gel -- ic pow'rs shone a -- bove __ Thy re -- vered tomb __
  and the sol -- diers who were to keep guard be -- came as dead men.
  Thou led ha -- des cap -- tive and wast not temp -- ted there -- by.
  Thou didst meet the Vir -- gin and didst give life __ to the world;
  O Thou __ who art ris -- en from the dead, O Lord, glo -- ry to Thee.
}

melody = \relative g' {
  \global % Leave these here for key to display
  \partial 2. g4 b aes | g( aes) g f | g2 g4 f | g g g aes | g( f) e2 |
  r4 aes aes aes | g2 g4 g | g( aes) g f | e( d) c2( | c4)
  r4 c4 c | aes'( g) g f | \sixbm g aes b( aes) g g | g8( aes g f) e4 f e2
  \fourbm g4 g aes g | \sixbm aes( g) g g g g | \fourbm g( aes) g f | e2.
  r4 | g4 g b aes | \sixbm b( aes) g f g aes | \fourbm b( c) b aes | g2.
  f4 | g( aes) b aes | g f e f | g e f( g) | aes8( b aes4) g4 f f4( e2.)
}

ison = \relative c' {
  \global % Leave these here for key to
  \tiny
  \partial 2. c2. c\breve c\breve
  c\breve c\breve s2
  c2 c1 c1. c1.
  c1 c1. c\breve
  c1 c1. c\breve
  c\breve c1 c1 c1
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { M I }
    } <<
      \new Voice = "melody" { \voiceOne \melody }
      \new Voice = "ison" { \voiceTwo \ison }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "melody" \lyricText

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
  \midi { \tempo 4 = 200
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
