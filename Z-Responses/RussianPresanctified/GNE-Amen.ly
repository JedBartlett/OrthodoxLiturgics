\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1


global = {
  \time 6/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyricText = \lyricmode{ \recite"" Ho -- ly Spir --  it
                        \recite"" s of age -- s. A -- men.  }

soprano = \relative f'  {\global \textLengthOn
                                 \parenthesize bes1_\markup {\column{
                                                      \line{Glory to the Father,}
                                                      \line{and to the Son,}
                                                      \line{and to the}
                                                 }} bes4 a bes2( a)            g1 \bar"|"
                                 \parenthesize bes1_\markup {\column{
                                                      \line{both now}
                                                      \line{and ever,}
                                                      \line{and unto age-}
                                                 }} bes4 a bes2  a4 \bar"||" a g1 \bar "|."}

alto    = \relative g'  {\global \parenthesize g1   g4   f g2(   f)  e1
                                 \parenthesize g1   g4   f g2    f4          f e1 }

tenor   = \relative c'  {\global \parenthesize c1   c4   c c1                  c1
                                 \parenthesize c1   c4   c c1                  c1 }

bass    = \relative c   {\global \parenthesize c1   c4   c e2(   f)  c1
                                 \parenthesize c1   c4   c e2(   f4         f  c1 }


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
