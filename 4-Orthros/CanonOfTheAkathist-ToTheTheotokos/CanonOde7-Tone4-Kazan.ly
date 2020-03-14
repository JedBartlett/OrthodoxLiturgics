\version "2.18.2"

threebm=\set Timing.measureLength = #(ly:make-moment 3/4)
fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Starts with
  \key d \minor
}

lyricText = \lyricmode {
  The God -- ly mind -- ed chil -- dren
  wor -- shipped not the crea -- ture
  rath -- er than the Cre -- a -- tor,
  but tram -- pling up -- on the threat of fire
  in man -- ly fash -- ion,
  they re -- joiced __ and sang:
  O All -- Praised Lord
  and God of our Fa -- thers,
  bless -- ed art Thou.
}

melody = \relative g' { \global
  \partial 2 r4 e4^"Ode 7" | g f g a | bes( a) g2 |
  g4 f e d | e8( f g4) g2 |
  g4 e f g8 g |\sixbm a4( f) e2
  r4 g | b2 b4 a b c |\fourbm bes a g
  g4 | f8( e) d4 e8( f g4) | g2
  g4 a | bes( a g) f | e2. r4
  b'4 b g( a) | b2.
  a4 | b( c) bes a | bes( a) g2 |
  g4( e) g f |\threebm e2.
  \bar"|."
}

ison = \relative g' { \global \tiny
  r4 e e\breve s s
  s4 g4 g\breve s2
  f8 e d4 e2 e\breve s1
  g\breve s1
  e\breve e2.
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
