\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

\defineBarLine "invisible" #'("" "" "")
global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key c \major
  \set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  % Note that inserted text in the melody will go ABOVE the lyrics
  Through the in -- ter -- ces -- sions of the The -- o -- to -- kos, Sav -- ior, save __ us.
  \recite"Glory to the Father and to the Son and to the" Ho -- ly Spi -- rit.
  \recite"Both now and ever, and unto ages" of a -- ges. A -- men.
  Through the in -- ter -- ces -- sions of the The -- o -- to -- kos, O Sav -- ior, save __ us. __
}

melody = \relative c' {
  % Ritardando spanning several notes
  \override TextSpanner.bound-details.left.text = "rit."
  \global % Leave these here for key to display
  \repeat volta 2 { e4 e e f g g g g fis g aes2 g \bar "|" aes f g4( aes g f) e2 \bar "|"}
     \alternative {
          { g\breve  g4 g g2 g2 \bar ":|." }
          { g\breve  g4 g2 g4 g g \bar "||" }
     }
  e4 e e f g g g g g\startTextSpan  aes aes( b) b2.\stopTextSpan \bar"|"
  b4 c2 aes g4(\startTextSpan e f g) aes1( g)\fermata \bar"|."
}

ison = \relative c' {
  \global % Leave these here for key to display
  \repeat volta 2 { c\breve s\breve s\breve}
     \alternative {
          { c\breve  s1. \bar ":|." }
          { c\breve  s1. \bar "||" }
     }
  c\breve c2. g'1 g4 c,\breve f1( c)\fermata  \bar"|."
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { M I }
    } <<
      \new Voice = "melody" { \voiceOne \melody }
      \new Voice = "ison" { \voiceTwo \ison }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "melody" \lyricText

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
  \midi { \tempo 4 = 250
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
