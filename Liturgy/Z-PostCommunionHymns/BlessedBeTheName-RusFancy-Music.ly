\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

\defineBarLine "invisible" #'("" "" "")
global = {
  \time 100/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
  \set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
}

lyrtxt = \lyricmode {
  A -- men.
  \recite "" ev -- er more. % In-line text below is placed at the recite.
  Bless -- ed be the name of the Lord, \bar"|"
  hence -- forth and for -- ev -- er more. \bar"|"
}

soprano = \relative g' {
  \global % Leave these here for key to display
  a2 a
  \textLengthOn
  \repeat volta 2 {a\breve _\markup{\column{ \line{Blessed be the name of}
                                             \line{the Lord, henceforth and for-}}}  a2 a4 a2}
  f4 g a a a a g a2
  a4 a a bes a2 g f1 \fermata
  \bar"|."
}

alto = \relative g' {
  \global % Leave these here for key to display
  f2 f
  \repeat volta 2 {f\breve f2 f4 f2}
  d4 e f f f f e f2
  f4 f f g f2 e c1
}

tenor = \relative c' {
  \global % Leave these here for key to display
  c2 c
  \repeat volta 2 {c\breve c2 c4 c2}
  a4 c c c c c c c2
  d4 d d d c2 c4( bes) a1
}


bass = \relative c {
  \global % Leave these here for key to display
  f2 f
  \repeat volta 2 {f\breve f2 f4 f2}
  d4 c f f f f c f2
  d4 d d g c2 c, <f f,>1 \fermata
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
