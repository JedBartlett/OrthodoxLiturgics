\version "2.18.2"

threebm=\set Timing.measureLength = #(ly:make-moment 3/4)
fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Starts with
  \key d \minor
}

lyricText = \lyricmode {
  Let all earth -- born mor -- tals
  re -- joice in spir -- it, bear -- ing their lamps,
  and let the na -- ture of bod -- i -- less minds
  cel -- e -- brate with hon -- or the ho -- ly fes -- ti -- val
  of the Moth -- er of God,
  and cry out:
  Hail, all- bless -- ed pure and ev -- er vir -- gin The -- o -- to -- kos!
}

melody = \relative g' { \global
  b4^"Ode 9" a g g | f2 e |
  r4 e b' a | bes( a) g2 | g4( a) g f |\sixbm e2.
  e4 f d |\fourbm e8( f g4) g g |\sixbm f( d) e f g2 |\fourbm
  e4 e f g |\sixbm g( f) e d e f | a f g2 a4 b | c8( d c4) bes a |\fourbm g2.
  e4 |\sixbm f8( g f4) e2. r4 |
  b'4( c b) a g a |\fourbm b2. g4 | g a bes a g8( f) e4 f8( g f4) e1
  \bar"|."
}

ison = \relative g' { \global \tiny
  e\breve s s s s s
  g\breve
  e\breve s2
  g\breve s4
  e4 e1.
  d2 e2
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
      \accidentalStyle StaffGroup.modern-voice-cautionary
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
