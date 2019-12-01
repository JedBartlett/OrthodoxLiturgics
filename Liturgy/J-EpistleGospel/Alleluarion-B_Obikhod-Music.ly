\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

\defineBarLine "invisible" #'("" "" "")
global = {
  \time 4/4
  \key f \major
}

verseOne = \lyricmode {
  Al -- le -- lu -- ia, Al -- le -- lu -- ia, Al -- le -- lu -- ia
}

soprano = \relative g' {
  \global % Leave these here for key to display
  a4 a8( bes) c4( bes) a2 bes4 \< c \! d2 \> c \! bes4( c bes a8 bes c4) c bes2 a1 \bar "||"
}

alto = \relative g' {
  \global % Leave these here for key to display
  f4 f8( g) a4( g) fis2 g4 a bes2 a g4( a g f8 g a4) a g2 f1
}

tenor = \relative c' {
  \global % Leave these here for key to display
  c4 c f( d) d2 d4 f f2 f e4( f c2( c4)) c c2 c1
}

bass = \relative f {
  \global % Leave these here for key to display
  f4 f f( g) d2 g4 f bes,4( d) f2 c2.( d8 c f4) f c2 <f f,>1
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
