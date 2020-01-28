\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite =  \once \override LyricText.self-alignment-X = #-1

%\defineBarLine "invisible" #'("" "" "")
global = {
  \time 12/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
  %\set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
}

lyrtxt = \lyricmode { \global% Positioned text in melody goes at recited quotes
  \recite"All of creation re-"  joi -- ces in thee,
  O Full of Grace,
  \recite"" race of men.
  \recite"" par -- a -- dise,
  \recite"the glo-ry of" vir -- gins,
  \recite"" be -- came a child
  \recite"" a -- ges.
  \recite"" in -- to a throne,
  \recite"" heav -- ens.
  \recite"" joi -- ces in thee,
  O Full of Grace.
  Glo -- ry to thee.
}

soprano = \relative g' {\textLengthOn \global % Leave these here for key to display
  % Ritardando spanning several notes use \startTextSpan and \stopTextSpan in-line with music.
  \override TextSpanner.bound-details.left.text = "rit."

  g1. fis2 fis4 fis g2 |

  \set Timing.measureLength = #(ly:make-moment 7/4)
  a4 a2 g a |

  \set Timing.measureLength = #(ly:make-moment 16/4)
  bes\breve_\markup{\column{ \line{the assembly}
                             \line{of angels and the}}} a2 g fis1 |

  g\breve_\markup{\column{ \line{O sanctified }
                           \line{temple and spiritual}}} fis2 fis g1 |

  \set Timing.measureLength = #(ly:make-moment 12/4)
  \parenthesize a1 a2( g) a1 |

  \set Timing.measureLength = #(ly:make-moment 17/4)
  bes\breve_\markup{\column{ \line{from whom God}
                             \line{was incarnate and}}} bes4 a2 g fis1 |

  \set Timing.measureLength = #(ly:make-moment 10/4)
  \parenthesize g1_\markup{\column{ \line{our God}
                                    \line{before the}}} fis2 g1 |

  \set Timing.measureLength = #(ly:make-moment 12/4)
  \parenthesize a1_\markup{\column{ \line{He made}
                                    \line{thy body}}} a2 g4 g a1 |

  \set Timing.measureLength = #(ly:make-moment 16/4)
  bes\breve_\markup{\column{ \line{and thy womb He made}
                             \line{more spacious than the}}} a2( g2) fis1 |

  \set Timing.measureLength = #(ly:make-moment 14/4)
  \parenthesize g1._\markup{\column{ \line{All of }
                                     \line{creation re-}}} fis2 fis4 fis g1 |

  \set Timing.measureLength = #(ly:make-moment 17/4)
  g4 g a bes1( a2) \startTextSpan g fis4 fis \stopTextSpan g1 | \bar"|."
}

alto = \relative g' { \global % Leave these here for key to display
  d1. d2 d4 d d2
  f4 f2 f f
  f\breve f2 d d1
  d\breve d2 d d1
  \parenthesize f1 f1 f1
  f\breve f4 f2 d d1
  \parenthesize d1 d2 d1
  \parenthesize f1 f2 f4 f f1
  f\breve f2( d) d1
  \parenthesize d1. d2 d4 d d1
  d4 d f f1. d2 d4 d d1
}

tenor = \relative c' { \global % Leave these here for key to display
  bes1. a2 a4 a bes2
  c4 c2 bes c
  d\breve c2 bes a1
  bes\breve a2 a bes1
  \parenthesize c1 c2( bes) c1
  d\breve d4 c2 bes a1
  \parenthesize bes1 a2 bes1
  \parenthesize c1 c2 bes4 bes c1
  d\breve c2( bes) a1
  \parenthesize bes1. a2 a4 a bes1
  bes4 bes c d1( c2) bes a4 a bes1
}


bass = \relative a { \global % Leave these here for key to display
  g1. d2 d4 d g2
  f4 f2 f f
  <bes bes,>\breve f2 g d1
  g\breve  d2 d g1
  \parenthesize f1 f1 f1
  <bes bes,>\breve <bes bes,>4 f2 g d1
  \parenthesize g1 d2 g1
  \parenthesize f1 f2 f4 f f1
  <bes bes,>\breve f2( g) d1
  \parenthesize g1. d2 d4 d g1
  g4 g f <bes bes,>1(f2) g2 d4 d g1
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
