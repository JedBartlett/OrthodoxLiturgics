\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

\defineBarLine "invisible" #'("" "" "")
global = {
  \time 14/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
  \set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
}

lyrtxt = \lyricmode {
  \recite"" name of the Lord! \bar"|" % Positioned text in melody goes at recited quote
  \recite"" Him -- self to us!
}

soprano = \relative g' {
  \global % Leave these here for key to display
  \textLengthOn
  a\breve_\markup{\hspace #2 \column{ \line{Blessed is He}
                                      \line{that comes in the}}} a2 a4 a4 a1 \fermata
  a\breve_\markup{\hspace #2 \column{ \line{God is the Lord}
                                      \line{and has revealed}}} a4 bes2 bes a1 \fermata \bar"||"
}

alto = \relative g' {
  \global % Leave these here for key to display
  f\breve f2 f4 f4 f1
  f\breve f4 f2( e) f1
}

tenor = \relative c' {
  \global % Leave these here for key to display
  c\breve c2 c4 c4 c1
  c\breve c4 d2( c) c1
}


bass = \relative c {
  \global % Leave these here for key to display
  f\breve f2 f4 f4 f1 \fermata
  f\breve f4  <bes bes,>2 <g c,>2 <f f,>1 \fermata
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
