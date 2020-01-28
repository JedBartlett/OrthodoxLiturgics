\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 6/4 % Starts with
  \key f \major
}

lyricText = \lyricmode {
  Thou didst shat -- ter death by Thy cross.
  Thou didst o -- pen par -- a -- dise to the thief.
  Thou didst turn the sad -- ness
  of the oint -- ment- bear -- ing wo -- men in -- to joy,
  and didst bid Thine a -- pos -- tles pro -- claim a warn -- ing
  that Thou hast ris -- sen, O Christ,
  grant -- ing to the world the great mer -- cy.
}

melody = \relative g' {
  \global % Leave these here for key to display
  \partial 2 f4 f | bes a g( a) a f |\fourbm g2 g4 a |
  bes a g f | g( bes) a g | f2. r4 |
  g4 a bes g | \sixbm a8( bes a4) g2
  g4 g | \fourbm a4 g f e | d c d e | f2
  e4 f | g2 g4 a | bes( a) g g | g a a8( g f4) | g2
  a4( bes) | c( d) c( bes) | \sixbm a( g) a bes g2 |
  g4 f e f g g | \fourbm a( g) f( e) | f1
}

ison = \relative c' {
  \global % Leave these here for key to display
  \tiny
  \partial 2 f2 f1. c\breve
  c1 f1 f1 f2 c1 c4 d f e4 d c d e f2
  e4 d c\breve c\breve
  f1 f1 e2 c1. c1 f1
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
