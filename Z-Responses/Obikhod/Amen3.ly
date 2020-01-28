\version "2.18.2"

global = {
  \time 10/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
}

lyrtxt  = \lyricmode           { A     --                   men. }
soprano = \relative f' { \global a2(   bes2        bes2)    a1 \fermata \bar "|." }
alto    = \relative d' { \global f2(   f2          e2)      f1 }
tenor   = \relative c' { \global c2(   d2          c2)      c1 }
bass    = \relative c  { \global f2(   <bes bes,>2 <g c,>2) <f f,>1 \fermata }

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
