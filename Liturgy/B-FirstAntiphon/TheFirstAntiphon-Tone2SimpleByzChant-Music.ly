\version "2.18.2"

twobm=\set Timing.measureLength = #(ly:make-moment 2/4)
fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
fivebm=\set Timing.measureLength = #(ly:make-moment 5/4)
sixbm=\set Timing.measureLength = #(ly:make-moment 6/4)
sevenbm=\set Timing.measureLength = #(ly:make-moment 7/4)
ninebm=\set Timing.measureLength = #(ly:make-moment 9/4)
tenbm=\set Timing.measureLength = #(ly:make-moment 10/4)
fourteenbm=\set Timing.measureLength = #(ly:make-moment 14/4)

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

\defineBarLine "" #'("" "" "")
global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key c \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  % Note that inserted text in the melody will go ABOVE the lyrics
  Through the in -- ter -- ces -- sions of the The -- o -- to -- kos, Sav -- ior, save __ us.
  \recite"" Ho -- ly Spi -- rit.
  \recite"" of a -- ges. A -- men.
  Through the in -- ter -- ces -- sions of the The -- o -- to -- kos, O Sav -- ior, save __ us. __
}

melody = \relative c' { \textLengthOn \global
  % Ritardando spanning several notes
  \override TextSpanner.bound-details.left.text = "rit."
  \repeat volta 2 { e4 e e f g g g g |\sixbm fis g aes2 g | \bar "|"
                   \fourbm aes f |\sixbm g4( aes g f) e2 | \bar "|"}
     \alternative {
          { \fourteenbm g\breve_\markup{\column{ \line{Glory to the}
                                                 \line{Father and to the }
                                                 \line{Son and to the }}} g4 g g2 g2 \bar ":|." }
          { g\breve_\markup{\column{ \line{Both now and}
                                     \line{ever, and unto ages}}}  g4 g2 g4 g g \bar "||" }
     }
  e4 e e f g g g g g\startTextSpan  aes aes( b) b2.\stopTextSpan \bar"|"
  b4 c2 aes g4(\startTextSpan e f g) aes1( g)\fermata \stopTextSpan \bar"|."
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
