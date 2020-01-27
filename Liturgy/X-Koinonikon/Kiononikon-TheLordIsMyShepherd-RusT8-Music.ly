\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1
#(set-global-staff-size 18)

%\defineBarLine "invisible" #'("" "" "")
global = {
  \small
  \time 17/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
  %\set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
}

lyrtxt = \lyricmode { \global% Positioned text in melody goes at recited quotes
  The Lord \recite"is my Shepherd," I shall not want.
  \recite"" pas -- tures, % He maketh me to lie down in green -
  \recite"" side the still wa -- ters
  He re -- stor -- eth my soul,
  \recite"" for His name's sake.
  \recite"" val -- ley of the shad -- ow of death.
  \recite"" with me.
  Thy rod and Thy staff they com -- fort me.
  \recite"" pres -- ence of mine en -- e -- mies:
  \recite"" o -- ver.
  \recite"" days of my life:
  and I will dwell in the house of the Lord for ev -- er.
}

soprano = \relative g' {
  \global % Leave these here for key to display

  % Ritardando spanning several notes use \startTextSpan and \stopTextSpan in-line with music.
  \override TextSpanner.bound-details.left.text = "rit."

  \textLengthOn
  g4 \p a2 g\breve g4 a2 g4 f2 |
  \set Timing.measureLength = #(ly:make-moment 14/4)
  a\breve_\markup{\column{ \line{He maketh}
                           \line{me to lie}
                           \line{down in green}}} a2( bes4 a) g2 |

  \set Timing.measureLength = #(ly:make-moment 20/4)
  a\breve_\markup{\column{ \line{He leadeth}
                           \line{me be-}}} g2 f4 a g2( f) e1 |

  \set Timing.measureLength = #(ly:make-moment 8/4)
  g4 g a2 a4 g f2 |

  \set Timing.measureLength = #(ly:make-moment 14/4)
  a\breve_\markup{\column{ \line{He leadeth me}
                           \line{in the paths}
                           \line{of righteous-ness}}} a2 bes4 a g2 |

  \set Timing.measureLength = #(ly:make-moment 19/4)
  a\breve_\markup{\column{ \line{Yea though I}
                           \line{walk through the}}}\pp g2 g4 f a\p g2 f4\pp f e2 |

  \set Timing.measureLength = #(ly:make-moment 13/4)
  g\breve_\markup{\column{ \line{I will fear no}
                           \line{evil, for Thou art}}} a2( g4) f2 |

  \set Timing.measureLength = #(ly:make-moment 11/4)
  a4\mp a a a a2 a4 bes a g2 |

  \set Timing.measureLength = #(ly:make-moment 21/4)
  a\breve_\markup{\column{ \line{Thou preparest}
                           \line{a table}
                           \line{before me in the}}} g2 g4 f a g2 f2 e1 |

  \set Timing.measureLength = #(ly:make-moment 13/4)
  g\breve_\markup{\column{ \line{Thou anointest my}
                           \line{head with oil,}
                           \line{my cup runneth}}} a2( g4) f2 |

  \set Timing.measureLength = #(ly:make-moment 14/4)
  a\breve_\markup{\column{ \line{Surely goodness}
                           \line{and mercy shall}
                           \line{follow me all the}}} a2\< bes4 a g2\! |

  \set Timing.measureLength = #(ly:make-moment 19/4)
  f4\< f f a \!\f a a bes bes bes bes \startTextSpan bes a2 \> ( g) \stopTextSpan \!\mp f1 | \bar"|."

}

alto = \relative g' {
  \global % Leave these here for key to display
  e4 f2 e\breve e4 f2 e4 d2
  f\breve f2( g4 f) e2
  f\breve e2 d4 f e2( d) c1
  e4 e f2 f4 e d2
  f\breve f2 g4 f e2
  f\breve e2 e4 d f e2 d4 d c2
  e\breve f2( e4) d2
  f4 f f f f2 f4 g f e2
  f\breve e2 e4 d f e2 d c1
  e\breve f2( e4) d2
  f\breve f2 g4 f e2
  d4 d d f f f g g g g g f2( e) d1
}

tenor = \relative c' {
  \global % Leave these here for key to display
  c4 c2 c\breve c4 c2 c4 a2
  c\breve c1 c2
  c\breve c2 c4 c c2( b) g1
  c4 c c2 c4 c a2
  c\breve c2 c4 c c2
  c\breve c2 c4 c c c2 b4 b g2
  c\breve c2. a2
  c4 c c c c2 c4 c c c2
  c\breve c2 c4 c c c2 b g1
  c\breve c2. a2
  c\breve c2 c4 c c2
  a4 a a d d d d d d d d d2( cis) a1
}


bass = \relative c {
  \global % Leave these here for key to display
  c4 f2 c\breve c4 f2 c4 d2
  f\breve f2( e4 f) c2
  f\breve c2 f4 f g2( <g g,>) c,1
  c4 c f2 f4 c d2
  f\breve f2 e4 f c2
  f\breve c2 c4 f4 f g2 <g g,>4 <g g,> c,2
  c\breve f2( c4) d2
  f4 f f f f2 f4 e f c2
  f\breve c2 c4 f f g2 <g g,> c,1
  c\breve f2( c4) d2
  f\breve f2 e4 f c2
  d4 d d d d d g g g g g a2( <a a,>) d,1

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
