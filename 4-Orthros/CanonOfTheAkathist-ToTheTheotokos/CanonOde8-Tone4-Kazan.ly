\version "2.18.2"

threebm=\set Timing.measureLength = #(ly:make-moment 3/4)
fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Starts with
  \key d \minor
}

lyricText = \lyricmode {
  The three ho -- ly chil -- dren in the fur -- nace
  the Child of the The -- o -- to -- kos saved;
  then was the type, now is its ful -- fill -- ment,
  and the whole world gath -- ers to sing:
  All ye works, praise the Lord,
  and mag -- ni -- fy Him un -- to all ag -- es.
}

melody = \relative g' { \global
  e4^"Ode 8" e f d |\sixbm e8( f g4) g2 g4 a |\fourbm bes4( a) g
  g4 | a2 g4 e | f g g f |\sixbm e2 r4
  d4 e f | g2 g4 f e d | e8( f g4) g2
  g4 a |\fourbm bes( a) g2 | a8( bes a4) g f |\sixbm e2. r4
  b'4 a | b( c) bes a g2 |\fourbm r4
  f4 g a |\sixbm bes( a) g g g e |\fourbm f8( g f4) e2
  \bar"|."
}

ison = \relative g' { \global \tiny
  e4 e f d e\breve s s s s s
  g1 e\breve s1.
  d2 e2
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
      \accidentalStyle StaffGroup.modern-voice-cautionary
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
