\version "2.18.2"

twobm= \set Timing.measureLength = #(ly:make-moment 2/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)
sevenbm= \set Timing.measureLength = #(ly:make-moment 7/4)

global = {
  \time 6/4 % Starts with
  \key f \major
}

lyricText = \lyricmode {
  Let my prayer a -- rise
  in Thy sight as in -- cense
}

melody = \relative g' {
  \sixbm d4 d g8( f) g( a) g2
  \sevenbm f4 g f e f8( e) d2
  \bar"|."
}

ison = \relative c' { \global \tiny
  d\breve
  s1 s4
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
  \midi { \tempo 4 = 100
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
