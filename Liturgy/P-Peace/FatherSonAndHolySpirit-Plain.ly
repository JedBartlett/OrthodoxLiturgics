\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1


global = {
  \time 1/1 % Not used, Time_signature_engraver is removed from layout
  \key f \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  Fa -- ther, Son and Ho -- ly Spi -- rit,
  \recite"the Trinity, one in" es -- sence,
  and un -- di -- vi -- ded.
}

soprano = \relative c'' {
  \global % Leave these here for key to display
  a4 a a a bes2 bes4 bes2 a \bar "|"
  a\breve a2 a \bar "|"
  a4 a a bes1 a1 \bar "|."
}

alto = \relative c' {
  \global % Leave these here for key to display
  f4 f f f f2 f4 e2 f2
  f\breve f2 f
  f4 f f f2( e) f1
}

tenor = \relative c' {
  \global % Leave these here for key to display
  c4 c c c d2 d4 c2 c
  c\breve c2 c
  c4 c c d2( c) c1
}

bass = \relative c {
  \global % Leave these here for key to display
  f4 f f f <bes bes,>2 <bes bes,>4 <g c,>2 f2
  f\breve f2 f
  f4 f f <bes bes,>2( <g c,>2) f1
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
  \midi { \tempo 4 = 200
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
