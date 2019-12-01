\version "2.18.2"

global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
}

verseOne = \lyricmode {
   Al -- le -- lu -- ia,
   Al -- le -- lu -- ia,
   Al -- le -- lu -- ia
}

soprano = \relative g' {
  % Ritardando spanning several notes use '\startTextSpan' and \stopTextSpan
  \global % Leave these here for key to display
  \partial 4 f8 g a4.( g8) f4
  bes8 bes a4.( g8) f4
  f8 a g4.( f8 e4 d8 e) f2. \fermata \bar "||"
}

alto = \relative g' {
  \global % Leave these here for key to display
  \partial 4 f8 g a4.( g8) f4
  bes8 bes a4.( g8) f4
  f8 a g4.( f8 e4 d8 e) f2.
}

tenor = \relative c {
  \global % Leave these here for key to display
  \partial 4 f8 g a4.( g8) f4
  bes8 bes a4.( g8) f4
  f8 a g4.( f8 e4 d8 e) f2.
}

bass = \relative c {
  \global % Leave these here for key to display
  \partial 4 f8 g a4.( g8) f4
  bes8 bes a4.( g8) f4
  f8 a g4.( f8 e4 d8 e) f2. \fermata
}

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
    } \lyricsto "soprano" \verseOne

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
