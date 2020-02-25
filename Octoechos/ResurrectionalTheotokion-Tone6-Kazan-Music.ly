\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Starts with
  \key c \major
}

lyricText = \lyricmode {
  Thou who didst call Thy moth -- er bless -- ed of Thine own good will,
  and didst come to Thy pas -- sion shin -- ing ra -- diant -- ly up -- on the cross,
  de -- sir -- ing to re -- call Ad -- am and say -- ing un -- to the an -- gels:
  'Re -- joice with Me, for I have found the piece of sil -- ver which was lost',
  O our God, Who with wis -- dom hast or -- dered all things,
  glo -- ry to Thee. __
}

melody = \relative g' { \global  \partial 2.
  g4 g f | g aes b aes | b( aes) g aes | g( f) e aes \fourbm | g2 r4
  g4 | \sixbm b b aes b c c | \fourbm b( aes) g2 | \sixbm g4 f g aes g f | \fourbm e2 r4
  e4 | \sixbm aes g g aes b( c) | \fourbm b( aes) g f | \sixbm g( aes) g f g aes | b( aes) g
  aes4 g f | e2. f4 g aes | \fourbm b aes b c | \sixbm b( aes) g( aes) g f | \fourbm e2
  e4 f | g2 g4 aes | b( aes) g g | \sixbm f8( e d4) e f | g2 \fourbm aes8( b aes4) | g f f2.( g4 | aes2 g) \bar"|."
}

ison = \relative c' {\global \tiny
  c2. c\breve c\breve
  c\breve s2 c\breve
  s4 c\breve s2. c\breve s4
  c\breve s4 c\breve s\breve
  c\breve s1 c\breve c1
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
