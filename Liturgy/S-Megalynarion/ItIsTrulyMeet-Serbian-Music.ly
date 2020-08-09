\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1


global = {
  \time 1/4 % Not used, Time_signature_engraver is removed from layout
  \key d \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

verseOne = \lyricmode {
  It is tru -- ly meet to bless thee, \bar"|"
  O The -- o -- to -- kos, \bar"|"
  ev -- er bles -- sed and most __ pure and the Mo -- ther of our God. \bar"||"
  More hon -- 'ra -- ble than the Che -- ru -- bim, \bar"|"
  and more glo -- ri -- ous be -- yond com -- pare than the Se -- ra -- phim, \bar"|"
  with -- out de -- file -- ment thou ga -- vest birth to God __ the Word: \bar"|"
  true __ The -- o -- to -- kos, \bar"|"
  we __ mag -- ni -- fy __ thee! \bar"|"
}

soprano = \relative g' {
  % Ritardando spanning several notes use '\startTextSpan' and \stopTextSpan
  \override TextSpanner.bound-details.left.text = "rit."
  \global % Leave these here for key to display
  fis^\markup{Moderato} fis8( g) a4 a b( a) fis g8([ a g fis ]) e4( fis)
  g4( a) fis4.( g8 a4) b a4( g8 a) fis2 \breathe
  e4( fis) g a2 a4 fis g8([ a g fis]) e4( fis) g a fis4.( g8 a4) b4 a g8( a) fis1 \fermata \breathe
  e4 fis8.( g16) a4 a a a b b a2
  a4 fis g8( a) g( fis) e4 fis g a fis4.( g8) a4 b a g8( a) fis2 \breathe
  e4 fis g a2 g4 a b b a a fis8([ g a b] a4) g8( a) fis2 \breathe
  a2( g4 fis e2) fis4.( g8) a2 b1 a2 \breathe
  a4.( b8 a g fis4) b2 a4( fis) g4( fis8 g a2) fis1 \fermata
}

alto = \relative g' {
  \global % Leave these here for key to display
  d4 d8( e) fis4 fis g( fis) d e8([ fis e d]) cis4( d)
  e4( fis) d4.( e8 fis4) g4 fis4( e8 fis) d2
  cis4( d) e fis2 fis4 d e8([ fis e d]) cis4( d) e fis d4.( e8 fis4) g4 fis e8( fis) d1
  cis4 d8.( e16) fis4 fis fis fis g g fis2
  fis4 d e8( fis) e( d) cis4 d e fis d4.( e8) fis4 g fis e8( fis) d2
  cis4 d e fis2 e4 fis g g fis fis d8([ e fis g] fis4) e8( fis) d2
  fis2( e4 d cis2) d4.( e8) fis2 g1 fis2
  fis4.( g8 fis e d4) g2 fis4( d) e4( d8 e fis2) d1
}

tenor = \relative c' {
  \global % Leave these here for key to display
  d4 d d d d2 a4 a2 a
  a2 d2. d4 a2 a
  a2 a4 a2 a4 a a2 a2 a4 a a2( d4) d a a a1
  a4 a d d d d d d d2
  d4 a a a a a a a a2 d4 d a a a2
  a4 a a d2 d4 d d d d d a2.a4 a2
  a1( a2) a2 d d1 d2
  d1 d2 d4( a) a2 a) a1
}


bass = \relative c {
  \global % Leave these here for key to display
  d4 d d d g( d) d a2 a
  a2 d2. g4 a2 d, \breathe
  a2 a4 d2 d4 d a2 a a4 a d2. g4 a4 <a a,> d,1 \fermata \breathe
  a4 d d d d d g g d2
  d4 d a a a a a a d2 d4 g a <a a,> d,2 \breathe
  a4 d d d2 d4 d g g d d d2. a4 d2 \breathe
  d2( cis4 d a2) d2 d g1 d2 \breathe
  d1 g2 d a( a) d1\fermata
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
  \midi { \tempo 4 = 120
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
