\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

\defineBarLine "invisible" #'("" "" "")
global = {
  \time 1/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
  \set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  It is meet and right, \bar"|"
  \recite "to worship the" Fa -- ther, \bar"|"
  and the Son, \bar"|"
  and the Ho -- ly Spir -- it: \bar"|"
  \recite "the Tri-ni-ty, one in" es -- sence, \bar"|"
  and un -- di -- vid -- ed
}
soprano = \relative g' {
  \global % Leave these here for key to display
  bes4 bes bes2 bes4 a2
  a\breve a2 a
  a4 a a2
  a4 a g f g2 a
  a\breve a2 a
  a4 g f g2 a1 \bar"||"
}

alto = \relative f' {
  \global % Leave these here for key to display
  g4 g g2 g4 f2
  f\breve f2 f
  f4 f f2
  f4 f e d e2 f
  f\breve f2 f
  f4 e d e2 f1
}

tenor = \relative c' {
  \global % Leave these here for key to display
  d4 d d2 c4 c2
  c\breve c2 c
  c4 c c2
  c4 c c a c2 c
  c\breve c2 c
  c4 c a c2 c1
}

bass = \relative d {
  \global % Leave these here for key to display
  g4 g g2 c,4 f2
  f\breve f2 f
  f4 f f2
  f4 f c d c2 f
  f\breve f2 f
  f4 c d c2 f1
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
