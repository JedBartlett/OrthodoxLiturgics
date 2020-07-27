\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1


global = {
  \time 100/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyrtxt = \lyricmode {
  A -- men. \bar"||"

  \recite "" praise O Lord. \bar"|" % In-line text in the soprano line below is inserted in the quotes
  \recite "" glo -- ry.  \bar"|"
  For Thou hast per -- mit -- ted us  \bar"|"
  \recite "" mys -- ter -- ies. \bar"|"
  Es -- tab -- lish \recite""fi -- ca -- tion, \bar"|"
  \recite"" Thy right -- eous -- ness. \bar"|"
  \recite"" ia! \bar"|"
  Al -- le -- lu -- ia.
}

soprano = \relative g' {
  \global % Leave these here for key to display
  \textLengthOn
  a2 a
  bes\breve _\markup{\column{ \line{Let our mouths}
                              \line{be filled with Thy}}} d2\accent c bes
  bes\breve _\markup{\column{ \line{That we may}
                              \line{sing of Thy}}} a2\accent bes
  bes4 bes2\accent bes4 bes a2\accent a4 a2
  a\breve _\markup{\column{ \line{to partake of Thy holy,}
                            \line{divine, immortal and life-giving}}} bes2\accent bes4 bes2
  bes4 bes2\accent bes4 bes\breve _\markup{\column{ \line{us in Thy}
                                                    \line{sanc-ti-}}} bes4 a2\accent a
  a\breve _\markup{\column{ \line{that all the day long}
                            \line{we may meditate upon}}} a4\accent bes2 bes4 bes2
  bes\breve _\markup{\column{ \line{Alleluia!}
                             \line{Allelu-}}} bes4^"rit."
  a2.\accent a4 bes2\accent( a\accent) g1 \fermata \bar "|."
}

alto = \relative g' {
  \global % Leave these here for key to display
  f2 f
  g\breve bes2 a g
  g\breve fis2 g
  g4 g2 g4 e f2 f4 f2
  fis\breve g2 g4 g2
  g4 g2 g4 g\breve e4 f2 f
  fis\breve fis4 g2 g4 g2
  g\breve e4
  f2. f4 g2( f) e1
}

tenor = \relative c' {
  \global % Leave these here for key to display
  c2 c
  d\breve d2 d d
  d\breve d2 d
  d4 d2 d4 c c2 c4 c2
  d\breve d2 d4 d2
  d4 d2 d4 d\breve c4 c2 c
  d\breve d4 d2 d4 d2
  d\breve c4
  c2. c4 c1 c1
}


bass = \relative c {
  \global % Leave these here for key to display
  f2 f
  g\breve d2 d g
  g\breve d2 g
  g4 g2 g4 c, f2 f4 f2
  d\breve g2 g4 g2
  g4 g2 g4 g\breve c,4 f2 f
  d\breve d4 g2 g4 g2
  g\breve c,4
  f2. f4 e2( f) c1 \fermata
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
