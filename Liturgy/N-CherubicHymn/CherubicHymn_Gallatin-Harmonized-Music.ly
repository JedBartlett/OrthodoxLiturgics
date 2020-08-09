\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1


global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
}

hymnLyrics = \lyricmode {
  Let __ us who mys -- tic -- 'lly
  rep -- re -- sent the cher -- u -- bim
  and who sing the thrice- ho -- ly hymn
  to __ the __ life- cre -- a -- ting,
  life- cre -- a -- ting Tri -- ni -- ty
  Now lay a -- side, lay a -- side all earth -- ly -- cares,
  lay -- a -- side all -- earth -- ly cares.
}

soprano = \relative g' {
  \global % Leave these here for key to display
  % Ritardando spanning several notes use '\startTextSpan' and \stopTextSpan
  \override TextSpanner.bound-details.left.text = "rit."
  f4.\mp( g8) bes4 a a\> f8( g)\! g2\pp

  c,8( f) f( e) f4. f8 g4\< f8( g)\! a2\mp

  \set Timing.measureLength = #(ly:make-moment 8/4)
  a4. g8 bes4 a\> a\!\pp f8 g g2

  \set Timing.measureLength = #(ly:make-moment 6/4)
  c,8\p( f) f(e) f4.\< f8 g4 f8( g)

  \set Timing.measureLength = #(ly:make-moment 4/4)
  a4 bes8( c) d4\f c c\> f,8( g)\! g2\p \break

   \set Timing.measureLength = #(ly:make-moment 10/4)
  f8\mp\<( a) g8 bes a4  a8 bes\! c4.\ff c8 c4\> f,8( g)\! g2\mp

  \set Timing.measureLength = #(ly:make-moment 4/4)
  c,8\pp\startTextSpan( f) f( e) f2 c8( f) f\> e\! f2\ppp\stopTextSpan
}

alto = \relative f' {
  \global % Leave these here for key to display
  f4.( g8) bes4 a f f8( g) e2
  c4 c d4. d8 e4 d8( e) f2
  f4. e8 f4 f f d8( d) e2
  c4 c d4. d8 e4 d8( e)
  f4 f f f d c e2
  d4 e8 e f4 f8 f f4. f8 f4 d e2
  c4 c d2 c4 c8 c c2
}

tenor = \relative c' {
  \global % Leave these here for key to display
  c2 d4 c a a g2
  f4 g a4. a8 c4 c c2
  c4. c8 d4 c a4 a8( a) g2
  f4 g a4. a8 c4 c
  c c g a f f g2
  a4 c8 c c4 c8 c c4. c8 a4 a g2
  f4 g a2 f4 g16( a) bes8 a2
}

bass = \relative c {
  \global % Leave these here for key to display
  f2 f4 f d d c2
  bes4 c d4. d8 e4 d8( e) f2
  f4. e8 f4 f d d8( d) c2
  bes4 c d4. d8 e4 d8( e)
  f4 g8( a) bes,4 d bes bes c2
  d4 e8 e f4 f8 g8 a4. a8 d,4 d c2
  bes4 c d2 bes4 c8 c f2
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
  \midi { \tempo 4 = 50
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
