\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
fivebm=\set Timing.measureLength = #(ly:make-moment 5/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Starts with
  \key c \major
}

lyricText = \lyricmode {
  The mys -- t'ry which was hid -- den from ev -- er -- last -- ing
  and was un -- known of the an -- gels,
  O The -- o -- to -- kos,
  was re -- vealed through thee
  to those who dwell up -- on earth,
  in that God, hav -- ing be -- come in -- car -- nate
  in un -- con -- fused un -- ion,
  of His own good will, ac -- cept -- ed the cross for our sake,
  where -- by He raised a -- gain the first cre -- at -- ed,
  and hath saved __ our souls from death. __
}

melody = \relative g' { \global \partial 4
  e4 | f d e f | \sixbm g( a) g f g a | b( a)
  g g g f | \fourbm g2 g4 a | \sixbm g( f) e2.
  d4 | \fourbm e f g( a) | g2
  g4 a | b ( c b) a | g2. f4 |
  \sixbm g4 g g a g( f) | e2. r4
  g4 g | b2 b4( a) b c | \fourbm b a b( a) | g2.
  g4 | g4 a g( f) | \sixbm e( f) g2
  g4 a | \fourbm b a g g | g( a) g f | g a g( f) | e2. r4 |
  g4( a) g f | g a b a | b c b( a) | g2
  g4 a | \sixbm b( a g) g g8( f) e4 | \fourbm f2.( g4 | a2 g2) \bar"|."
}

ison = \relative c' { \global \tiny
  e4 d1 c\breve
  s1 c\breve s4
  d4 e\breve e
  e1 d2 e1
  d4 d g\breve e\breve
  s2 e\breve s1. d1 e1
  g2. f4 g\breve s2
  e\breve d1. e2
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { M I }
    } <<
      \new Voice = "melody" { \voiceOne \melody }
      \new Voice = "ison" { \voiceTwo \ison }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "melody" \lyricText

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
