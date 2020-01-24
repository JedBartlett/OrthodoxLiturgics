\version "2.18.2"

global = {
  \time 8/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
}

verseOne = \lyricmode {
 Praise __ the Lord,
 Praise __ the Lord,
 from the heav -- ens,
 from the heav -- ens.
}

verseTwo = \lyricmode {
  Praise __ ye Him,
  O __ praise ye Him
  in the high -- est.
  in the high -- est.
}

soprano = \relative g' {
  % Ritardando spanning several notes use '\startTextSpan' and \stopTextSpan
  \override TextSpanner.bound-details.left.text = "rit."
  \global % Leave these here for key to display

  f4( g a g) f( e) f2
  \slurDotted
  a4( bes c d) \slurSolid bes( c) c2
  c4 c d1 c2
  a4 bes a2( g) a2 \fermata
}

alto = \relative c' {
  \global % Leave these here for key to display
  c4( e f d) c2 c
  \slurDotted
  f4( e) f2 \slurSolid e2 f
  a4 a bes1 a2
  f4 g f2( e) f2
}

tenor = \relative c' {
  \global % Leave these here for key to display
  a4( c2 bes4) a( g) a2
  \slurDotted
  c2 c4 d \slurSolid c( e) a,2
  c4 c bes1 c2
  c4 d c1 c2
}


bass = \relative c {
  \global % Leave these here for key to display
  f4( c f bes,) c2 f2
  \slurDotted
  f4( g a bes) \slurSolid g( c,) f2
  f4 f bes,1 <f' f,>2
  <f f,>4 bes, c1 f2 \fermata
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

\markup{\larger Verses:}
\markup{\hspace#4 1. Praise Him, all ye angels; praise Him all ye hosts }
\markup{\hspace#4 2. Praise Him, O sun and moon; praise Him all ye stars and lights }
\markup{\hspace#4 3. Praise Him, ye heavens of heavens and thou water that art above the heavens }