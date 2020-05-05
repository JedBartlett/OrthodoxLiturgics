\version "2.18.2"

global = {
  \time 4/4 % Starts with
  \key g \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  In -- cline not my heart to an -- y e -- vil thing,
  nor to prac -- tice wick -- ed deeds.
}

melody = \relative g' {
  e4^\markup{Verse 2} e2 b'4 b a2 a4 a a g4 a4 b2
  e,4 g a2 g4 fis( a g2.) fis4 e1
  \bar"|."
}

ison = \relative c' { \global \tiny
  e4 e2 e\breve s2.
  e4 e1. d1 e1
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
  \midi { \tempo 4 = 150
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
