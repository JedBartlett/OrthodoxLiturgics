\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1


global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key g \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  Glo -- ry to Thee, O Lord, glo -- ry to Thee.
}

soprano = \relative c'' {
  \global % Leave these here for key to display
  g2 g4 a b b a( b) c2 b4 a g1  \bar "|."
}

alto = \relative c' {
  \global % Leave these here for key to display
  d2 d4 g g g g2 g g4 fis d1
}

tenor = \relative c' {
  \global % Leave these here for key to display
  b2 b4 c d d c( d) e2 d4 d b1
}

bass = \relative c' {
  \global % Leave these here for key to display
  g2 g4 g g g e( d) c2 d4 d g1
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
  \midi { \tempo 4 = 120
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
