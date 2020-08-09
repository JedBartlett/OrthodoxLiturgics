\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1


global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
}

hymnLyrics = \lyricmode {
  A -- men
  That we may re -- ceive,
  may re -- ceive the King of __ _ all,
  Who __ comes in -- vis -- i -- bly up -- born
  by the an -- gel -- ic host,
  A -- le -- lu -- ia,
  A -- le -- lu -- ia.
}

soprano = \relative g' {
  % Ritardando spanning several notes use '\startTextSpan' and \stopTextSpan
  \override TextSpanner.bound-details.left.text = "rit."
  \global % Leave these here for key to display
  f2 f \bar "||"

  \set Timing.measureLength = #(ly:make-moment 6/4)
  f4. a8 g4. bes8 a2

  \set Timing.measureLength = #(ly:make-moment 5/4)
  a4 bes c2. c4 c2 f,4 g
         \set Timing.measureLength = #(ly:make-moment 4/4) g1

  \set Timing.measureLength = #(ly:make-moment 10/4)
  f4.( a8) g4. bes8 a4. a8 a4 bes c2

  \set Timing.measureLength = #(ly:make-moment 6/4)
  d4 c c2 f,4 g8( a)
         \set Timing.measureLength = #(ly:make-moment 4/4) g1

  c,4.\startTextSpan f8 f4.( e8) f1 \stopTextSpan
  c4 f f( e) f1 \bar "|."
}

alto = \relative f' {
  \global % Leave these here for key to display
  c2 c
  d4. d8 e4. e8 f2
  f4 f f2. f4 f2 d e1
  c2 e4. e8 f4. f8 e4 e f2
  f4 f f2 d4 d e1
  c4. c8 c2 c1
  c4 c c2 c1
}

tenor = \relative c' {
  \global % Leave these here for key to display
  a2 a2
  a4. a8 c4. c8 c2
  c4 c c2. c4 a2 a g1
  f2 g4. g8 a4. a8 a4 bes f2
  bes4 f a2 a4 a g1
  f4. f8 g2 a1
  f4 f a8( g) bes4 a1
}

bass = \relative c {
  \global % Leave these here for key to display
  f2 f
  d4. d8 e4. e8 f2
  f4 g a2. a4 d,2 d c1
  bes2 c4. c8 d4. d8 c4 bes a2
  bes4 a d2 d4 d c1
  bes4. bes8 c2 d1
  bes4 bes c2 <f f,>1
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
    } \lyricsto "soprano" \hymnLyrics

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
