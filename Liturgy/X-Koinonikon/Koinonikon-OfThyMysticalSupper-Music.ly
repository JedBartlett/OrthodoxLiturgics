\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

%\defineBarLine "invisible" #'("" "" "")
global = {
  \time 16/4 % Not used, Time_signature_engraver is removed from layout
  \key g \major
  %\set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
}

lyrtxt = \lyricmode { \global% Positioned text in melody goes at recited quotes
  \recite"Of Thy Mystical Supper, O" son of God,
  ac -- cept me to -- day
  as a com -- mu -- ni -- cant;
  \recite"for I will not speak of Thy Mystery to Thine" en -- e -- mies,
  \recite"nei-ther like Judas will I" give Thee a kiss,
  \recite"but like the theif will I con-" fess thee:
  Re -- mem -- ber me, O Lord, in Thy King -- dom. % Repeated
  Re -- mem -- ber me, O Lord, in Thy King -- dom.
}

soprano = \relative g' { \global % Leave these here for key to display

  % Ritardando spanning several notes use \startTextSpan and \stopTextSpan in-line with music.
  \override TextSpanner.bound-details.left.text = "rit."
  \textLengthOn
  g\breve\p^"Slowly" fis2 fis g1 |
  \set Timing.measureLength = #(ly:make-moment 7/4)
  a4 a2\< g4 g\!\mf a2 |
  \set Timing.measureLength = #(ly:make-moment 11/4)
  b4 b b a2\> g fis1\!\p |
  \set Timing.measureLength = #(ly:make-moment 16/4)
  g\breve\pp fis2 fis g1 |
  \set Timing.measureLength = #(ly:make-moment 14/4)
  a\breve\p a2 g4 g a2 |
  \set Timing.measureLength = #(ly:make-moment 16/4)
  b\breve\mp a2( g) fis1
  \set Timing.measureLength = #(ly:make-moment 17/4)
  \repeat volta 2 {g4\p g g g a b2 a4 a g2( fis) g1}
  g4\f g g g\< a \startTextSpan b2\!\ff c4 c \stopTextSpan b2(\> a) g1\!\mf \bar"|."
}

alto = \relative g' { \global % Leave these here for key to display
  e\breve dis2 dis e1
  fis4 fis2 e4 e fis2
  g4 g g fis2 e dis1
  e\breve dis2 dis e1
  fis\breve fis2 e4 e fis2
  g\breve fis2( e) dis1
  e4 e e e fis g2 fis4 fis e2( dis) e1
  e4 e e e fis g2 a4 a g2( fis) e1
}

tenor = \relative c' { \global % Leave these here for key to display
  b\breve b2 b b1
  d4 d2 d4 d d2
  d4 d d d2 b b1
  b\breve b2 b b1
  d\breve d2 d4 d d2
  d\breve d2( b) b1
  b4 b b b d d2 d4 d b1 b
  b4 b b b d d2 e4 e e2( dis) b1
}


bass = \relative c { \global % Leave these here for key to display
  e\breve b2 b e1
  d4 d2 d4 d d2
  g4 g g d2 e b1
  e\breve b2 b e1
  d\breve d2 d4 d d2
  g\breve d2( e) b1
  e4 e e e d g2 d4 d e2( b) e1
  e4 e e e d g2 a4 a b2( b,) e1
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
