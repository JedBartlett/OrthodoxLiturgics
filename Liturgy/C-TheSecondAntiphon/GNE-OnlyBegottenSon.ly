\version "2.18.2"

\header {
  title = "GNE & Only Begotten Son"
  tagline = "This arrangement is free to distribute for Liturgical use"
}
\paper {
  page-count = #1
 }

#(set-default-paper-size "letter")

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

global = {
  \time 1/1 % Not used, Time_signature_engraver is removed from layout
  \key f \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

verseOne = \lyricmode {
  \recite "Glory to the Father and to the Son and to the" Ho -- ly Spir -- it,
  \recite "Both now and ever and unto ag" -- es of ag -- es. A -- men.
  On -- ly- -- be -- got -- ten Son and Im -- mor -- tal Word of __ God,
  Who for our sal -- va -- tion willed to be in -- car -- nate
  of the Ho -- ly The -- o -- to -- kos and Ev -- er- -- Vir -- gin Ma -- ry,
  Who with -- out change be -- came man and was cru -- ci -- fied,
  Who is One of the Ho -- ly Trin -- i -- ty;
  glo -- ri -- fied with the Fa -- ther and the Ho -- ly Spir -- it,
  O Christ, our God, tram -- pling down death by death, save __ us.
}

soprano = \relative g' {
  \global
  a\breve a4 g a2 a \bar "|"
  a\breve a4 g a2 g4 f g2 \bar "||"
  f4 f f g2 g4 g g g f g a( g) f( g) a2
  g4 g g a bes2 a4 a a a g a2( g) f
  f4 g a2 a4 a a a a a a a a g a( g f2) g
  f4 f f g2 g4 g g f g a( g) f( g) a2
  g4 a bes2 a4 a a g a2 g f
  a2\< a4 a\! a g a( g f2) g
  f4 f g2( f4) g a( g f g) a2
  g4 g a bes2 a4 a g a2 g f
  g2( a bes2. a4 g2 f) g1\fermata
}

alto = \relative g' {
  \global
  f\breve f4 f f2 f
  f\breve f4 e f2 e4 d e2
  d4 d d e2 e4 e e e d e f( e) d( e) f2
  d4 d d f f2 f4 f f f e f2( e) d
  d4 e f2 f4 f f f f f f f f e f( e d2) e
  d4 d d e2 e4 e e d e f( e) d( e) f2
  d4 f f2 f4 f f e f2 e d
  f2 f4 f f e f( e d2) e
  d4 d e2( d4) e f( e d e) f2
  d4 d f f2 f4 f e f2 e d
  d2( f f1 e2 d) d1
}

tenor = \relative c' {
  \global
  c\breve c4 c c2 c
  c\breve c4 c c2 c4 a c2
  a4 a a c2 c4 c c c a c c2 a4( c) c2
  bes4 bes bes c d2 c4 c c c c c1 a2
  a4 c c2 c4 c c c c c c c c c c2( a) c
  a4 a a c2 c4 c c a c c2 a4( c) c2
  bes4 c d2 c4 c c c c2 c a
  c2 c4 c c c c2( a) c
  a4 a c2( a4) c c2( a4 c) c2
  bes4 bes c d2 c4 c c c2 c a
  bes2( c d2. c2. a2) bes1
}


bass = \relative a {
  \global
  f\breve f4 c f2 f
  f\breve f4 c f2 c4 d c2
  d4 d d c2 c4 c c c d c f( c) d( c) f2
  g4 g g f bes,2 f'4 f f f c f2( c) d2
  d4 c f2 f4 f f f f f f f f c f( c d2) c
  d4 d d c2 c4 c c d c f( c) d( c) f2
  g4 f bes,2 f'4 f f c f2 c d
  f2 f4 f f c f( c d2) c
  d4 d c2( d4) c f( c d c) f2
  g4 g f bes,2 f'4 f c f2 c d
  g2( f bes,2. f'4 c2 d) <g g,>1
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
  \midi { \tempo 4 = 300
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
