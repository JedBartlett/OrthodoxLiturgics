\version "2.18.2"

twobm=\set Timing.measureLength = #(ly:make-moment 2/4)
fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Starts with
  \key d \minor
}

lyricText = \lyricmode {
  As we the God -- ly- mind -- ed,
  cel -- e -- brate this sa -- cred and all- hon -- 'ra -- ble feast
  of the Moth -- er of God,
  come, let us clap our hands to -- geth -- er
  and glo -- ri -- fy the God Whom she bore. __
}

melody = \relative g' { \global
  r4 e4^"Ode 6" e f | g( a g) f |\sixbm f4( e) d2
  d4 d |\fourbm g( f e) f | g a g g | f( g) f e | d2
  e4 f | e2 e4 c | d2. r4 |
  g2 g4 f | g f e d |\sixbm a'( f) g2.
  f4 |\fourbm g a bes g | a8( bes a4) g f | f( e2) r4
  \bar"|."
}

ison = \relative g' { \global \tiny
 r4 e e e d\breve s2
 e\breve
 d\breve
 e2 e4 c d2. r4
 e\breve s s1 s4 d4 d e2
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
