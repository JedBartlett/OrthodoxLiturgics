\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

\defineBarLine "invisible" #'("" "" "")
global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
  \set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  Lord \recite "have mercy, Lord have mercy, Lord" have mer -- cy.
  Fa -- ther, bless.
}

soprano = \relative c'' {
  \global % Leave these here for key to display
  \textLengthOn
  % Note that inserted text here ABOVE the lyrics noted above
  a4 a\breve a4 g2^"rit." a4 \bar "|"
  bes2. bes4 a2 \fermata \bar "|."
}

alto = \relative c' {
  \global % Leave these here for key to display
  \textLengthOn
  % Note that inserted text here ABOVE the lyrics noted above
  f4 f\breve f4 e2 f4
  d2( e4) g4 f2
}

tenor = \relative c' {
  \global % Leave these here for key to display
  \textLengthOn
  % Note that inserted text here ABOVE the lyrics noted above
  c4 c\breve c4 c2  c4
  d2( c4) c4 c2
}

bass = \relative c {
  \global % Leave these here for key to display
  \textLengthOn
  % Note that inserted text here ABOVE the lyrics noted above
  f4 f\breve f4 c2 f4
  d2( c4) c4 <f f,>2 \fermata
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
    } \lyricsto "soprano" \lyricText

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
