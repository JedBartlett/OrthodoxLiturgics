\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 6/4 % Starts with
  \key c \major
}

lyricText = \lyricmode {
  Re -- joice, O un -- crossed gate.
  Re -- joice, O wall and pro -- tec -- tion of those who has -- ten un -- to thee.
  Re -- joice, O qui -- et ha -- ven __ who hast not known wed -- lock.
  O thou who hast giv -- en birth in the flesh to thy cre -- at -- or and God,
  thou shalt con -- tin -- ue to in -- ter -- cede
  for the sake of __ those who praise and wor -- ship thy birth -- giv -- ing. __
}

melody = \relative g' { \global \partial 4
  g4 | c( d c) b a b | \fourbm c2 r4
  c4 | \sixbm d c c( b) a b | \fourbm b( c) c c | \sixbm c8( b) a4 b c b a | \fourbm a2 r4
  a4 | bes c bes a | bes( a) g2( | g4) g4 g g | a8( g f4) g( a) | a2 r4
  b4 | \sixbm c2 c4 d e d | \fourbm c( b) a b | \sixbm c2. c4 b a | \fourbm b( c) b a | a2 r4 \sixbm
  g4 a b | c( d) c b a b | \fourbm  c2
  g4 g | c2 b8( c d4) | a a b a | a4( b) a g | c2 b8( c b4) | a4( g2 a4 | bes2 a2) \bar"|."
}

ison = \relative g' { \global \tiny
 g4 a\breve s4
 a\breve s2. s1. s2.
 a4 g\breve s1 a8 g f4 g a a\breve
 s2 s1 s1. s1
 s1. s1. s2
 g4 g a\breve s2. g4 a2 g2 a4 g2 a4 g2 a2
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
