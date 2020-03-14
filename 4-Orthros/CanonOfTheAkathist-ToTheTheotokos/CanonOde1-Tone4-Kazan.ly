\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Starts with
  \key d \minor
}

lyricText = \lyricmode {
  I shall o -- pen my mouth
  and it will be filled with the Spir -- it
  and I __ shall speak forth to the Queen and Moth -- er.
  I shall be seen joy -- ful -- ly sing -- ing her prais -- es,
  and I shall de -- light to sing of her won -- ders.
}

melody = \relative g' { \global
  \partial 2 e4^"Ode 1" e | f8( e d4) e f |\sixbm g2
  g4 a bes a |\fourbm g8( a g4) f e | f8( g f4) e4.
  e8 | e4( d) e f | g2 g4 a | bes( a g) a |\sixbm g( f) e2
  r4 e4 |\fourbm g4 g a( g) | c8( d c4) b a | b( c) bes a | bes( a) g4.
  g8 |\sixbm g4( f) g a bes a | g8( a g4) f e | f8( g f4) e2 \bar"|."
}
ison = \relative c' { \global \tiny
  e4 e f8 e d4 e\breve
  s\breve s s s1.
  g\breve e
  s1.
  d2 e
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
