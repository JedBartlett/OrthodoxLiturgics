\version "2.18.2"

global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
}

lyrictxt = \lyricmode {
  O give thanks to the Lord, for He is good! Al -- le -- lu -- i -- a.
  For His mer -- cy en -- dur -- eth for -- ev -- er, Al -- le -- lu -- i -- a.
}


melody = \relative g' {
  \global % Leave these here for key to display
  \partial 2 d4^"Verse 1" d g( a) a bes c( bes) a( g) f2 g4( bes) a( bes) a g f e d2
  f2^"REFRAIN" c \set Timing.measureLength = #(ly:make-moment 6/4)
       g'4( f e d) c c \set Timing.measureLength = #(ly:make-moment 4/4)
                      g'2 f4 g a g f e g( f) e2 d1
}

ison = \relative c' {
  \global % Leave these here for key to display
  d4 d d\breve d\breve s1
  f2 c c1. d\breve c1 d1
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
    } \lyricsto "melody" { \lyrictxt }
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

\markup{\larger Verses:}
\markup{\hspace#4 2.  O give * thanks to the * Go - - - -*  d of * Gods! Alleluia. \teeny{[REFRAIN]}}
\markup{\hspace#4 3.  O give * thanks to the * Lo - - - -* rd of * Lords! Alleluia. \teeny{[REFRAIN]}}
\markup{\hspace#4 4.  ___ To * Him who a - *lone does * great * wonders, Alleluia. \teeny{[REFRAIN]}}
\markup{\hspace#4 5.  ___ To * Him who by * wisdom * made the * heavens, Alleluia. \teeny{[REFRAIN]}}
\markup{\hspace#4 6.  ___ To * Him who * laid out the * earth above the * waters, Alleluia. \teeny{[REFRAIN]}}
\markup{\hspace#4 7.  ___ To * Him who * ma - - -  de * great * lights,  Alleluia. \teeny{[REFRAIN]}}
\markup{\hspace#4 8.  __ The * sun to * ru - - - * le by * day, Alleluia. \teeny{[REFRAIN]}}
\markup{\hspace#4 9.  __ The * moon and * stars to * rule by * night, Alleluia. \teeny{[REFRAIN]}}
\markup{\hspace#4 10. O give * thanks to the * Go - - - - * d of * heaven! Alleluia. \teeny{[REFRAIN]}}