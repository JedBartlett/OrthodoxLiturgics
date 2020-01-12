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
  We praise Thee, \bar"|"
  we bless Thee, \bar"|"
  we give thanks un -- to Thee, O Lord, \bar"|"
  and we pray un -- to Thee, \bar"|"
  we pray un -- to Thee, \bar"|"
  O our God, \bar"|"
  O our God.
}
soprano = \relative g' {
  \global % Leave these here for key to display
  a4 a2 g2
  a4\< bes2( a4\> g) a1\!
  g4 g a2 a4 a g2( f) \breathe g4 a1
  a4 a g2 f4 g a1
  a4\< bes2 a4\> g a1\!
  a4 a g2( f)
  g2 g a1\fermata \bar"|."
}

alto = \relative f' {
  \global % Leave these here for key to display
  f4 f2 e
  f4 g2( f4 e) f1
  e4 e f2 f4 f e2( d) e4 f1
  f4 f e2 d4 e f1
  f4 g2 f4 e f1
  f4 f e2( d) e2 e f1
}

tenor = \relative c' {
  \global % Leave these here for key to display
  c4 c2 c
  c4 c1 c
  c4 c c2 c4 c c2(a) c4 c1
  c4 c c2 a4 c c1
  c4 c2 c4 c c1
  c4 c c2( a2)
  c2 c c1
}

bass = \relative d {
  \global % Leave these here for key to display
  f4 f2 c
  f4 e2( f4 c) <f f,>1
  c4 c f2 f4 f c2( d) c4 f1
  f4 f c2 d4 c f1
  f4 e2 f4 c4 f1
  f4 f c2( d)
  c2 c <f f,>1\fermata
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
