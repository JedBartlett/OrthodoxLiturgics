\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Starts with
  \key f \major
}

lyricText = \lyricmode {
  In that Thou art the treas -- ur -- y of our res -- ur -- rec -- tion,
  O all- praised One,
  lead Thou forth from the pit and bot -- tom of trans -- gres -- sion
  those who set their hope in Thee,
  for Thou has saved those who were guil -- ty of sin,
  in that Thou didst give birth to our sal -- va -- tion,
  O Thou who be -- fore giv -- ing birth wast vir -- gin,
  and at giv -- ing birth and af -- ter giv -- ing birth was vir -- gin still. __
}

melody = \relative g' { \global \partial 2
  f4 f | bes2 bes4 a | \sixbm bes a g2 g4 g | g a a( f) g g |
  \fourbm f8( e d4) e4( f) | g2
  a4 bes | \sixbm c8( d c4) bes a g g | \fourbm g f g a | \sixbm bes4( a) g2
  g4 f | \fourbm g bes a g | \sixbm f2. r4
  g4( a) | \fourbm bes a g2 | g4( a) g g | f8( e d4) e f | g2
  a4 bes | c8( d c4) bes a | g2. f4 | g bes a( g) | f2. r4
  d4 d e f | \sixbm g( f) e f g g | a4( bes) g2
  g4 g | \fourbm a f g a | c c bes a | g f bes a | g2.( f4 e2 d4 e f1) \bar"|."
}

ison = \relative c' { \global \tiny
  f4 f f\breve f
  d1 c\breve s\breve
  s\breve f1
  c\breve c
  s\breve s1. f1
  d1 c\breve s2
  s2 f\breve s1 c1. d4 e f1
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
