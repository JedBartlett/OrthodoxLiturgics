\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

\defineBarLine "invisible" #'("" "" "")
global = {
  \time 7/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
  \set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  A mer -- cy of peace.
  A sac -- ri -- fice of praise.
}

soprano = \relative c'' {
  \global % Leave these here for key to display
  a4 a2 a4 a a2 \bar "|"
  a4 g f g2 g a1 \bar "||"
}

alto = \relative c' {
  \global % Leave these here for key to display
  f4 f2 f4 f f2
  f4 e d e2 e f1
}

tenor = \relative c' {
  \global % Leave these here for key to display
  c4 c2 c4 c c2
  c4 c a c2 c c1
}

bass = \relative c {
  \global % Leave these here for key to display
  f4 f2 f4 f f2
  f4 c d c2 c f1
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
