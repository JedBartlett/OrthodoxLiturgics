\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

\defineBarLine "invisible" #'("" "" "")
global = {
  \time 1/4 % Not used, Time_signature_engraver is removed from layout
  \key g \major
  \set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
}

verseOne = \lyricmode {
  It is tru- \recite"ly meet to bless thee, O" The -- o -- to -- kos, \bar"|"
  ev -- ver \recite"bless-ed and most pure" and the moth -- er of our God, \bar"|"
  more hon' -- ra -- ble than the Cher -- u bim, \bar"|"
  and more \recite"glorious beyond compare" than the Ser -- a -- phim. \bar"|"
  With -- out cor -- rup- \recite"tion thou gavest" birth to God the Word: \bar"|"
  true The -- o -- to -- kos we mag -- ni -- fy thee!
}

soprano = \relative e' {
  % Ritardando spanning several notes use '\startTextSpan' and \stopTextSpan
  \override TextSpanner.bound-details.left.text = "rit."
  \global % Leave these here for key to display
  e4 e g2 g\breve g4 e a4.( b8 \acciaccatura { b16 a } g4 fis) e2
  g4 g a\breve a4 fis g b a g fis( g2)
  e4 g2 g4 g g e a4.( b8 g4) fis e2
  g4 g a\breve a4 fis g( b a) g fis( g2)
  e4 e e g2 g\breve g4 e a4.( b8 \acciaccatura { b16 a } g4) fis e2
  g4 g g a \startTextSpan a b g2 fis4 \stopTextSpan fis e1 \fermata \bar"|."
}

alto = \relative e' {
  \global % Leave these here for key to display
  e4 e e2 e\breve e4 e e2.( dis4) b2
  e4 e fis\breve fis4 d d g d d d2.
  e4 e2 e4 e e e e2. dis4 b2
  e4 e fis\breve fis4 d d( g d) d d( d2)
  e4 e e e2 e\breve e4 e e2. dis4 b2
  e4 e e fis fis g e2 dis4 c b1
}

tenor = \relative e {
  \global % Leave these here for key to display
  e4 e b'2 b\breve b4 b c2( b4 a) g2
  b4 b c\breve c4 a b d c c a( b2)
  e,4 b'2 b4 b b b c2( b4) a g2
  b4 b c\breve c4 a4 b( d c) b a( b2)
  e,4 e e b'2 b\breve b4 b c2( b4) a g2
  b4 b b c c b c2 a4 a g1
}


bass = \relative c {
  \global % Leave these here for key to display
  e4 e e2 e\breve e4 g a2( b4 b,) e2
  e4 e d\breve d4 d g g fis g d( g2)
  e4 e2 e4 e e g a2( b4) b, e2
  e4 e d\breve d4 d g2( fis4) g d( g2)
  e4 e e e2 e\breve e4 g a2( b4) b,4 e2
  e4 e e d d fis a,2 b4 b <e e,>1 \fermata
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
  \midi { \tempo 4 = 100
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
