\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

\defineBarLine "invisible" #'("" "" "")
global = {
  \time 5/4 % Not used, Time_signature_engraver is removed from layout
  \key c \major
  \set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  Let us praise the all- laud -- ed and no -- ble bride of Christ,
  the god -- ly Kath -- 'rine, the guard -- ian of Si -- nai and its de -- fence,
  who is al -- so our sup -- port and suc -- cor and our help;
  for __ with the Ho -- ly Spi -- rit's sword
    she hath si -- lenced bril -- liant -- ly
    the clev -- er a -- mong the god -- less;
  and be -- ing crowned as a Mar -- tyr,
  she now doth ask great mer  -- cy for __ us __ all.
}

melody = \relative a' {
  % Ritardando spanning several notes
  \override TextSpanner.bound-details.left.text = "rit."
  \global % Leave these here for key to display
  a4 b c c b c8( d c4) b a b b c b a2 \bar "|"
  g4 a b c a b c( d) c c c b c4.( b8) a4 b c2) \bar "|"
  c4 d e d c b c8( b) a4 b b c b a2 \bar "|"
  d4( \acciaccatura e8 d4) c c c b a b c2 \bar "|"
    c4 d e d c b c \bar "|"
    b c2 g4 a b c b2 a2 \bar "|"
  g4 c c c c b b8( c d4) a4 \bar "|"
  r8 a8 a4 a a g fis g a( b) b( a) a2. \bar "|"
}

ison = \relative c'' {
  \global % Leave these here for key to display
   a\breve s4 g1 a2
   g4 a\breve s\breve s4
   s\breve g1 a2
   a\breve s\breve s1 g1. a2
   g4 a\breve
   s2. a4 g fis g1 a1
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
