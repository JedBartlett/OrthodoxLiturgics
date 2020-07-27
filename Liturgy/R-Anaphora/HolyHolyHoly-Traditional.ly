\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1


global = {
  \time 1/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  Ho -- ly! Ho -- ly! Ho -- ly! \bar"|"
  Lord of Sa -- ba -- oth; \bar"|"
  \recite "Heaven and earth are" full of Thy glo -- ry: \bar"|"
  \recite "Hosanna in the" high -- est. \bar"|"
  Bless -- ed is He that comes in the name of the Lord. \bar"|"
  Ho -- san -- na in the high -- est.
}
soprano = \relative g' {
  \global % Leave these here for key to display
  a4 a bes bes c4.( bes8) a2
  bes4 a g g a2
  a\breve g2 f4 f g2 a2
  a\breve a2 a2 s4
  a4 a bes c2 bes4 a2 g4 a bes2 a4 g a2
  a4 c c bes a g2( a4 bes) a1 \bar"||"
}

alto = \relative f' {
  \global % Leave these here for key to display
  f4 f g g a4.( g8) f2
  g4 f e e f2
  f\breve e2 d4 d e2 f
  f\breve f2 f r4
  f4 f g a2 g4 f2 e4 f g2 f4 e f2
  f4 a a g f e2( f4 g) f1
}

tenor = \relative c' {
  \global % Leave these here for key to display
  c4 c c c <f c>2 c2
  c4 c c c c2
  c\breve c2 a4 a c2 c
  c\breve c2 c r4
  c4 c c <f c>2 c4 c2 c4 c c2 c4 c c2
  c4 <f c> <f c> c c c1 c1
}

bass = \relative d {
  \global % Leave these here for key to display
  f4 f f f f2 f
  c4 c c c f2
  f\breve c2 d4 d c2 f
  f\breve f2 f s4
  f4 f f f2 f4 f2 c4 c c2 c4 c f2
  f4 f f f f c1 f
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
    } \lyricsto "soprano" \lyricText

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
  \midi { \tempo 4 = 150
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
