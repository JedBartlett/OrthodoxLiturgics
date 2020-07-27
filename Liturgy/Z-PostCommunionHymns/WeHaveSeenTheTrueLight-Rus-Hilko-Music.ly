\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1


global = {
  \time 100/4 % Not used, Time_signature_engraver is removed from layout
  \key ees \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyrtxt = \lyricmode {
  \recite "We have seen the" true Light, \bar"|"
  \recite "we have received the Heavenly" Spi -- rit,  \bar"|"
  we have found the true Faith,  \bar"|"
  \recite "Worshiping the Undivided" Tri -- ni -- ty, \bar"|"
  for He hath saved us.
}

soprano = \relative g' {
  \global % Leave these here for key to display
  aes\breve c2( bes) aes2 \fermata
  aes\breve g2 aes \fermata
  aes4 aes aes2\accent aes4 aes2 g2 \fermata
  g\breve aes2\accent aes4 aes2 \fermata
  aes4^"rit." aes aes g2( aes g) f1\fermata \bar"|."
}

alto = \relative g' {
  \global % Leave these here for key to display
  f\breve aes2( g) f
  f\breve e2 f
  f4 f f2 f4 f( d) ees2
  e\breve f2 f4 f2
  f4 f d ees2( f ees) d1
}

tenor = \relative c' {
  \global % Leave these here for key to display
  c\breve c1 c2
  c\breve c2 c
  c4 c c2 c4 c( bes) bes2
  c\breve c2 c4 c2
  c4 c bes bes1. bes1
}


bass = \relative c {
  \global % Leave these here for key to display
  f\breve c1 f2 \fermata
  f\breve c2 f\fermata
  f4 f f2 f4 f( bes,) ees2 \fermata
  c\breve f2 f4 f2 \fermata
  f4 f bes,4 ees2( d ees) bes1 \fermata
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
