\version "2.18.2"

twobm=\set Timing.measureLength = #(ly:make-moment 2/4)
fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 6/4 % Starts with
  \key d \minor
}

lyricText = \lyricmode {
  As a liv -- ing and cop -- ious foun -- tain,
  O The -- o -- to -- kos,
  do thou strength -- en those who hymn thy prais -- es,
  and are joined to -- geth -- er
  in a spir -- it -- ual com -- pa -- ny
  for thy ser -- vice;
  and in thy di -- vine glo -- ry
  make them wor -- thy of crowns of glo -- ry.
}

melody = \relative g' { \global
  \partial 2 e4^"Ode 3" e | e8( f g4) g f g a | bes( a) g
  g4 g a | a( f) g2
  g4 a |\fourbm bes( a) g2 |  g4 f e d | e8( f g4) g2 |
  g4 a b c | bes a
  g a |\twobm bes8 bes a4 |\sixbm a g f
  g4 g( e) f8( g f4) e2 |
  e4 d e f | g( a8 g) f4( e) | d2
  g4 a bes( a) g g | g e f8( g f4) e1 \bar"|."
}
ison = \relative c' { \global \tiny
  e\breve s\breve s s s s s s2
  f4 e d2
  e\breve d2 e1
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
