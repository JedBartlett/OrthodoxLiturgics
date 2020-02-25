\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 6/4 % Starts with
  \key f \major
}

lyricText = \lyricmode {
  Thou who for our sake wast born of a vir -- gin,
  and didst suf -- fer cru -- ci -- fix -- ion, O good __ One,
  and didst de -- spoil -- death through death,
  and as God didst re -- veal res -- ur -- rec -- tion,
  de -- spise not those whom Thou hast cre -- at -- ed with Thine own hand.
  Show forth Thy love for man -- kind, O mer -- ci -- ful One.
  Ac -- cept the in -- ter -- ces -- sion of Thy moth -- er,
  the The -- o -- to -- kos, for us
  and save Thy des -- pair -- ing peo -- ple,
  O our Sav -- iour. __
}

melody = \relative g' { \global
  f4 f g a bes bes | \fourbm a2 g4 a | \sixbm a( f) g2
  g4 a | \fourbm bes bes a g | g2 d4 e | f( g f e) | \sixbm f2.
  g4 g g | \fourbm f8( e d4) e f | g2
  g4 a | bes2 a4 g | g2 d4 e | f( g f e) | f2.
  g4 | g a a( f) | g a bes bes | \sixbm a2 g4 g a f | g2.
  a4 bes a | \fourbm g4( a) a f | g2 d4( e) f( g) f e | \sixbm f2.
  d4 e f | g g a g g a | bes( a) g
  g4 g g | \fourbm f8( e d4) e f g2 r4
  a4 bes2 a4 g | \sixbm g a a( f) g2 |
  \fourbm f4 f bes( a) | g4.( f8 e4 d8 e | f1) \bar"|."
}

ison = \relative c' { \global \tiny
  f\breve f1
  c\breve s2 d4 e f g f e f1.
  d1 c\breve
  s4 s4 d4 e f g f e f2.
  c\breve s4 s1. s\breve
  s1 d4 e f g f e f2.
  d2. c\breve s\breve s1
  f\breve c\breve
  s2 f1

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
