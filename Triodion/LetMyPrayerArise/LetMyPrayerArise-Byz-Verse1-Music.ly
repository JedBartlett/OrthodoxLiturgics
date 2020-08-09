\version "2.18.2"

global = {
  \time 4/4 % Starts with
  \key g \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  Lord, I have cried to Thee, hear __ me.
  Hear the voice __ of my prayer,
  when  I cry __ to Thee.
}

melody = \relative g' {
  e2^\markup{Verse 1} e4 e  b' b a2 g4( a4) b2
  e,4 fis g( fis) e g a2
  a4 g fis( a g2.) fis4 e1
  \bar"|."
}

ison = \relative c' { \global \tiny
  e2 e4 e e\breve
  e4 e e\breve s2
  d1 e1
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
