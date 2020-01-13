\version "2.18.2"

global = {
  \time 8/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
}

lyrtxt  = \lyricmode           { Lord, have mer -- cy. }
soprano = \relative f' { \global a4    a    a2     a1 \fermata \bar "|." }
alto    = \relative d' { \global f4    f    f2     f1 }
tenor   = \relative c' { \global c4    c    c2     c1 }
bass    = \relative c  { \global f4    f    f2     f1 \fermata }

\score {
  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { S A }
    } <<
      \new Voice = "soprano" { \voiceOne \soprano }
      \new Voice = "alto" { \voiceTwo \alto }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "soprano" \lyrtxt

    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { T B }
    } <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
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
  \midi { \tempo 4 = 120
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
