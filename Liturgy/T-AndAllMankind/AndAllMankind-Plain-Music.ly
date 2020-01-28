\version "2.18.2"

global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
}

lyrtxt  = \lyricmode  {                     And all        man --  kind. }
soprano = \relative g' { \global \partial 4 a4  bes2       bes     a1 \fermata \bar"|." }
alto    = \relative g' { \global \partial 4 f4  f2         e2      f1 }
tenor   = \relative c' { \global \partial 4 c4  d2         c2      c1 }
bass    = \relative c  { \global \partial 4 f4 <bes bes,>2 <g c,>2 <f f,>1 \fermata }

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
  \midi { \tempo 4 = 150
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
