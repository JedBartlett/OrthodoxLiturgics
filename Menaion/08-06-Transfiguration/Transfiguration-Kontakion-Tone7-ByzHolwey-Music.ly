\version "2.18.2"

twobm=  \set Timing.measureLength = #(ly:make-moment 2/4)
threebm=\set Timing.measureLength = #(ly:make-moment 3/4)
fourbm= \set Timing.measureLength = #(ly:make-moment 4/4)
fivebm= \set Timing.measureLength = #(ly:make-moment 5/4)
sixbm=  \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Starts with
  \key f \major
}

lyricText = \lyricmode {
  Thou wast trans -- fig -- ured on the mount,
  and Thy dis -- ci -- ples, in so far as they were a -- ble,
  be -- held Thy glo -- ry, O Christ our God;
  so that ,when they should see Thee cru -- ci -- fied,
  they would re -- mem -- ber that Thy suf -- fer -- ing was vol -- un -- tar -- y,
  and could de -- clare to all the world that Thout art tru -- ly
  the ef -- ful -- gent splen -- dour of the Fa -- ther. __
}

melody = \relative g' { \global \partial 2.
  f4 f f | g f e f |\fivebm g2
  f4 g a |\sixbm bes( a) g2 f4 f |\fourbm g g f g | g8( a16 bes a8 g) g4 r4 |
  \threebm g4 f g |\fourbm a( g) f g | a g f2 |
  r4 f4 e f | g g f8( e) d4 | e f g2 |
  r4 g f g | a a a a | bes a g f |\sixbm e c d8( e f4) f2 |
  r4 g4 g g  f8( e) d4 |\fourbm e f g g |\sixbm g a  bes bes
  g a | bes g a8( bes a4) g2 |\twobm f4 f |\sixbm bes( a) g2.(f4 |\fourbm e2 d4 e f1)
}

ison = \relative c' { \global \tiny
  f4 f f c\breve s s s
  f2 f1 c\breve s s1. d8( e f4) f2
  d1. c\breve s f1 c1. d4 e f1
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
      % Setting the accidentalStyle to modern-voice-cautionary results in
      % explicitly printing the cancellation of sharps/flats, even if
      % a bar-line passes.  It prints these cancellations in brackets.
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
