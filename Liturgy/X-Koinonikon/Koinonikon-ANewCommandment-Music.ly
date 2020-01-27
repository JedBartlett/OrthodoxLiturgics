\version "2.18.2"

global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
}

verseOne = \lyricmode {
 A new com -- mand -- ment I give to you:
 A new com -- mand -- ment I give to you:
 that you __ love each -- o -- ther;
 that you __ love each -- o -- ther;
 e -- ven as I have loved __ you.
}

verseTwo = \lyricmode {
 By this _ all __ men will know:
 By this _ all __ men will know:
 that you are my dis -- ci -- ples;
 that you are my dis -- ci -- ples;
 if you have love for each o -- ther.
}

soprano = \relative c' {
  % Ritardando spanning several notes use '\startTextSpan' and \stopTextSpan
  \override TextSpanner.bound-details.left.text = "rit."
  \global % Leave these here for key to display
  \slurDotted
  c2 d4 e f2 g4 bes a2 g f1
  c2 d4 e f2 g4 bes a2 g f1
  a2 g4( a) c2. bes4 a1 g
  a2 g4( a) c2. bes4 a1 g
  c,2 d4 e f2( g4) bes4 a2( g) f1 \bar":|."
}

alto = \relative c' {
  \global % Leave these here for key to display
  \slurDotted
  c2 d4 e f2( g4 bes) a2 g f1
  c2 d4 e d2( d4 g  ) f2 e c1
  f2 e4 f a2. g4 f1 e1 \slurSolid
  f2 e4 f a2. g4 f2( d2) e1 \slurDotted
  c2 d4 e d2 d4 g f2( d4 e) c1
}

tenor = \relative c {
  \global % Leave these here for key to display
  \slurDotted
  c2 d4 e f2 g4 bes a2 g f1
  c2 d4 e a2 bes4 d4 c2 c2 a1
  c2 c c2. c4 c1 c
  c2 c c2. c4 c1 c
  c2 bes4 bes a2( bes4) d c2( bes) a1
}


bass = \relative c {
  \global % Leave these here for key to display
  \slurDotted
  c2 d4 e f2( g4 bes) a2 g f1
  c2 d4 e d2( bes4 g) c2 c f1
  f2 c4 f f2. e4 f1 c
  f2 c4 f f2. bes,4 c1 c
  c2 d4 d d2 bes4 g c1 f1
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
    } \lyricsto "soprano" { \verseOne }
    \new Lyrics = "ahha"\lyricsto "alto" \verseTwo

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
  \midi { \tempo 4 = 100
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
