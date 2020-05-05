\version "2.18.2"

global = {
  \time 4/4 % Starts with
  \key g \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  Let my prayer a -- rise
  in Thy sight as in -- cense
  and let the lif -- ting up __ of my hands
  be an eve -- ning sac -- ri -- fice.
}

melody = \relative g' {
  e4^REFRAIN e b' b a2
  a4 a g a b2 b
  e,4 e e e fis g( fis) e g a2
  a4 g fis a g2. fis4 e1
  \bar"|."
}

ison = \relative c' { \global \tiny
  e4 e e\breve
  s1
  e4 e e e e\breve
  s2. d1 e1
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
