\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

\defineBarLine "invisible" #'("" "" "")
global = {
  \time 1/1 % Not used, Time_signature_engraver is removed from layout
  \key g \major
  \set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
}

verseOne = \lyricmode {
  Be -- fore thy Cross,
  we bow down in wor -- ship, O Mas -- ter,
  and Thy ho -- ly Re -- sur -- rec -- tion, we glo -- ri -- fy.
  \recite"" ly Spir -- it, \bar"|" % In-line text in melody is inserted at \recite
  \recite"" ages of a -- ges. A -- men. \bar"|"
  and Thy ho -- ly Re -- sur -- rec -- tion \bar"|"
  we glo -- ri -- fy. \bar"||"
}

soprano = \relative g' {
  % Ritardando spanning several notes use '\startTextSpan' and \stopTextSpan
  \override TextSpanner.bound-details.left.text = "rit."
  \global % Leave these here for key to display
  \cadenzaOn
  \repeat volta 3 { \bar".|:" fis4^\markup {1 - Thrice } g2( fis4) fis g2 \bar"|"
                              a4 b c( b c) a b2 a4 a g2 a2 \bar"|"
                              b4 b a2 g fis4 g a4.(b8 a4 g) fis2 \bar "|"
                              fis4 g2 fis g1 }
                  \textLengthOn
                   g\breve_\markup{\fontsize #-2 {\hspace #1 \column{
                                                      \line{Glory to the Father,}
                                                      \line{and to the Son,}
                                                      \line{and to the Ho-}}}}
                            g4 g2 fis2 \bar"|"
                   fis\breve_\markup{\fontsize #-2 {\hspace #1 \column{
                                                      \line{both now}
                                                      \line{and ever,}
                                                      \line{and unto}}}}
                    fis4 fis4 g2 g4 g g2( a) \bar"|"
                   \textLengthOff
                   b4 b a2 g fis4 g a4.(b8 a4 g) fis2
                   fis4 g2 fis g1_\markup {Priest: With strength!} \bar":|."
  \cadenzaOff
}

alto = \relative g' {
  \global % Leave these here for key to display
  \repeat volta 3 {           dis4 e2( dis4) dis e2
                              fis4 g a( g a) fis g2 fis4 fis e2 fis
                              g4 g fis2 e dis4 e fis4. g8 fis4 e dis2
                              dis4 e2 dis e1 }
                   e\breve e4 e2 dis
                   dis\breve dis4 dis e2 e4 e e2( fis)
                   g4 g fis2 e dis4 e fis4.( g8 fis4 e4 dis2
                   dis4 e2 dis e1
}

tenor = \relative c' {
  \global % Leave these here for key to display
  \repeat volta 3 {           b4 b2. b4 b2
                              d4 d d2. d4 d2 d4 d b2 d2
                              d4 d d2 b b4 b b1 b2
                              b4 c2 b b1 }
                   b\breve b4 b2 b
                   b\breve b4 b b2 b4 b b2( d)
                   d4 d d2 b b4 b b1 b2
                   b4 c2 b b1

}


bass = \relative c {
  \global % Leave these here for key to display
  \repeat volta 3 {           b4 e2( b4) b e2
                              d4 d d2. d4 g2 d4 d e2 d2
                              g4 g d2 e b4 b b1 b2
                              b4 <a' a,>2 <b b,> <e, e,>1 }
                  e\breve e4 e2 b2
                  b\breve b4 b e2 e4 e e2( d)
                  g4 g d2 e b4 b b1 b2
                  b4 <a' a,>2 <b b,> <e, e,>1^\markup{Choir: Repeat 1}
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
  \midi { \tempo 4 = 150
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
