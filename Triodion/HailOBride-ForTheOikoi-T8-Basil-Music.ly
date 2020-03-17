\version "2.18.2"

global = {
  \time 4/4 % starts with
  \key c \major
}

lyricText = \lyricmode {
  Hail O Bride, __
  Hail, O Bride __
  with -- out Bride -- groom.
}

melody = \relative c' { \global
  \partial 2 c c|  d4.( c8 d4 e|  c2)
  e4 e | b'2( c4 b | a g f e8[ a] | g2.) r4 |
  c,4.( b8 a b) c( d) | e4.( c8 d2) c1
\bar"|."}

ison = \relative c' { \global \tiny
  c4 c c\breve
  g\breve c\breve
  g1 c1
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
  \midi { \tempo 4 = 120
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
