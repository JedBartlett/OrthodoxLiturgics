\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
fivebm=\set Timing.measureLength = #(ly:make-moment 5/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Starts with
  \key f \major
}

lyricText = \lyricmode {
  Though Thou didst de -- scend in -- to the grave, O Im -- mor -- tal One,
  yet didst Thou de -- stry the pow -- er of Ha -- des,
  and didst a -- rise as vic -- tor, O __ Christ God,
  call -- ing to the myrrh -- bear -- ing wom -- en: Re -- joice!
  and giv -- ing peace un -- to Thine A -- pos -- tles,
  O Thou Who dost grant res -- ur -- rec -- tion to the
  fall -- en. __
}

melody = \relative c' { \global
  c4 f f f | f8( e) d4 e f | g2 f4 g | a4( g) f( e)|\sixbm f2
  |f4 f g a |\fivebm bes a bes a g |\fourbm a8( bes a4) g2
  |\fivebm f4 g a bes a |\fourbm g2 d4( e) | f( g) f( e) | f2
  d4 d |\fivebm e f a g f | g e f g2
  |\fourbm a4 bes a g | g f e f | g( a) g2
  |\sixbm f4 f g a bes8( c bes4)| a g a g f8( e) d4
  |\fourbm bes'4( a8 g) g4.( f8 | e4 d8 e f2)
  \bar"|."
}

ison = \relative c' { \global \tiny
  c4 f f f | d2 c2~ | c2 f2~ | f2. e4 f2 |
  f\breve c\breve
  s1 d4( e) f( g) f( e) f2
  d4 d c\breve
  s\breve s1.
  f\breve d1
  c1 c4 d8( e) f2
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
  \midi { \tempo 4 = 150
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
