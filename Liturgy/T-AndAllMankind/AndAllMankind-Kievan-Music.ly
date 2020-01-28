\version "2.18.2"

global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key g \major
}

lyrtxt  = \lyricmode  {                     And all         man --     kind. }
soprano = \relative g' { \global \partial 4 e4  a4.( b8)\acciaccatura { b16 a }
                                                           g4( fis)   e1 \fermata \bar"|." }
alto    = \relative g' { \global \partial 4 e4  d2         d2         b1}
tenor   = \relative c' { \global \partial 4 g4  c2         b4( a)     g1}
bass    = \relative c  { \global \partial 4 e4  d2         d         <e e,>1\fermata }

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
