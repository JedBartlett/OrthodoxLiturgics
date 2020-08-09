\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1


global = {
  \time 16/4 % Not used, Time_signature_engraver is removed from layout
  \key c \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  O pro -- tec -- tion of Chris -- tians that can -- not be put to shame,
  Me -- di -- a -- tion un -- to the Cre -- a -- tor most con -- stant,
  O de -- spise not the sup -- pli -- ant voi -- ces of those who have sinned;
  But be thou quick, O good one, to come un -- to our aid,
  Who in faith cry un -- to thee:
  Ha -- sten to in -- ter -- ces -- sion,
  and speed thou to make sup -- pli -- ca -- tion,
  Thou who dost e -- ver pro -- tect,
  O The -- o -- to -- kos, them that ho -- nor thee.__
}

melody = \relative c' {
  % Ritardando spanning several notes
  \override TextSpanner.bound-details.left.text = "rit."
  \global % Leave these here for key to display
  e4 f g g g aes g g aes g aes b( c) aes g2 \bar "|"
  g4 aes b aes g8[( f]) e4 f g aes aes g g( \acciaccatura aes8 g4 f) e2 \bar "|"
  e4 f g g aes b aes g aes g g f e f g2 \bar "|"
  g4 g aes b g aes b b c b aes8( g) fis4 g2 \bar "|"
  g4 g b( aes) g( aes) g f e2 \bar "|"
  g2 f8[( e]) d4 e f f( g) g \bar "|"
  g b aes g f e f f( g) g2 \bar "|"
  fis4 g aes b( aes) g aes b2 \bar "|"
  g4 g aes b aes g g g( \startTextSpan f) e f2( \stopTextSpan g4 aes4 \acciaccatura b8 aes4 g2) \bar "|."
}

ison = \relative c'' {
  \global % Leave these here for key to display
   g\breve s\breve
   g\breve s2. e2. e2
   e4 f g\breve s1.
   g\breve s1.
   s1 e1 e2
   g\breve s4
   s\breve s2.
   s\breve s4
   s\breve s2 f1 s4 g2
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
  \midi { \tempo 4 = 150
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
