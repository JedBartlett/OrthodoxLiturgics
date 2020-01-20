\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm=\set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Starts with
  \key f \major
}

lyricText = \lyricmode {
  While the stone was sealed by the Jews
  and the sol -- diers were guard -- ing Thy most pure bod -- y,
  Thou didst a -- rise on the third day, O Sav -- iour,
  grant -- ing life to the world,
  for which cause the heav -- en -- ly pow'rs cried a -- loud un -- to Thee,
  O Giv -- er of life:
  Glo -- ry to Thy res -- ur -- rec -- tion, O Christ!
  Glo -- ry to Thy king -- dom!
  Glo -- ry to Thy prov -- i -- dence,
  O Thou who a -- lone art the Lov -- er of man -- kind.
}

melody = \relative g' {
  \global % Leave these here for key to display
  g4 g g f g( f) e f g2
  f4 g a8( bes a4) g4 f \sixbm g( a) g f f e \fourbm f( g) g2
  r4 g a g a8( bes c4) bes4 a bes( c) bes a bes( a) g2
  a4( g f) e f( g) f e d2. r4
  e4 f g g a8( bes c4) bes4 a g2 g4 f g( f) e f g2.
  g4 a( g) f e d2. r4
  a'8( bes a4) g2 g4 g f g \sixbm f( d) e f g2
  \fourbm g4 a a a bes( a) g2
  g4 f f g
  e4( f g) a g2. r4
  f4 f g g a( \sixbm g) g f f e \fourbm g( f) e8( f e d) d1 \bar"|."
}

ison = \relative c' {
  \global % Leave these here for key to
  \tiny
  d\breve
  d\breve
  d1.
  d1
  d1 a'1 % Thou didst arise..
  g\breve % Third day..
  d1 c1 % granting..
  d1
  d1
  d\breve
  d\breve
  c1 d1 % Giver of life
  d\breve
  d1.
  d\breve
  d1 c1 % Glory to the providence
  d1
  d1
  d1.
  c2 a2
  d1
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
  \midi { \tempo 4 =150
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
