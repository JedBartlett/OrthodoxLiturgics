\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1


global = {
  \time 1/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyrtxt = \lyricmode {
  One is Ho -- ly. \bar"|"
  \recite"" Christ, \bar"|" % Positioned text in melody goes at recited quotes
  \recite"" the Fa -- ther. A -- men.
}

soprano = \relative g' {
  \global % Leave these here for key to display
  \textLengthOn
  a4 a a2 a1
  a\breve_\markup{\hspace #2 \column{ \line{One is the}
                                      \line{Lord Jesus}}} a2
  a\breve_\markup{\hspace #2 \column{ \line{to the glory}
                                      \line{of God}}} a4 bes2 bes4 bes a1 \fermata \bar"||"
}

alto = \relative g' {
  \global % Leave these here for key to display
  f4 f f2 f1
  f\breve f2
  f\breve f4 f2 e4 e f1
}

tenor = \relative c' {
  \global % Leave these here for key to display
  c4 c c2 c1
  c\breve c2
  c\breve c4 d2 c4 c c1
}


bass = \relative c {
  \global % Leave these here for key to display
  f4 f f2 f1
  f\breve f2
  f\breve f4 <bes bes,>2 <g c,>4 <g c,>4 <f f,>1 \fermata
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
  \midi { \tempo 4 = 200
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
