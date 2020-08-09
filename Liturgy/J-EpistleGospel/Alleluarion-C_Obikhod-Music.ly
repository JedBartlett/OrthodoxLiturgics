\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1


global = {
  \time 4/4
  \key f \major
}

verseOne = \lyricmode {
  Al -- le -- lu -- ia, Al -- le -- lu -- ia, Al -- le -- lu -- ia.
}

soprano = \relative g' {
  \global % Leave these here for key to display
  c4 c8( d) e4( d) cis2 d4 \< e \! f2 \> e \! d4( e d c8 d e4) e d2 c1 \bar "||"
}

alto = \relative g' {
  \global % Leave these here for key to display
  e4 e8( f) g4( f) e2 f4 g a2 g g1( g4) g g( f) e1
}

tenor = \relative c' {
  \global % Leave these here for key to display
  g4 g c( a) a2 a4 c c2 c bes4( c bes a8 bes c4) c bes2 c1
}

bass = \relative f {
  \global % Leave these here for key to display
  c4 c c( d) a2 d4 c f2 \acciaccatura {f,4 a} c2 <g' g,>1( c,4) <e c>4 <g g,>2 <g c,>1
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
