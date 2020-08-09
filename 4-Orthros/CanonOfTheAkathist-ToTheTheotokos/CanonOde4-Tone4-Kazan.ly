\version "2.18.2"

twobm=\set Timing.measureLength = #(ly:make-moment 2/4)
fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 6/4 % Starts with
  \key d \minor
}

lyricText = \lyricmode {
  He who sits in clouds of glo -- ry
  up -- on the throne of the God -- head,
  Je -- sus the Most High God,
  game with might -- ty hand
  and saved those who cried out un -- to Him:
  Glo -- ry to thy Pow -- er, O Christ!
}

melody = \relative g' { \global
  b4^"Ode 4" c b ais b c | bes( a) g4.
  g8 g4 g |\fourbm a( g) f d | e8( f g4) g2
  c8( d c4) b a | b( c) bes( a) | g2
  g4 a | a f g a |
  bes( a) g f | g a g f |\twobm e2 |\fourbm
  g4 f g a | bes( a) g f | f( e2.) \bar"|."
}

ison = \relative g' { \global \tiny
  g1. e\breve s1.
  g\breve e\breve
  s\breve s s4 d4 d e2.
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
