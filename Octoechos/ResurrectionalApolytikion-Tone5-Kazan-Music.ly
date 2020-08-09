\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Starts with
  \key c \major
}

lyricText = \lyricmode {
  Let us be -- liev -- ers praise __ and wor -- ship the Word,
  co- e -- ter -- nal with the Fa -- ther and the Spir -- it,
  born of a vir -- gin for our sal -- va -- tion,
  for He took plea -- sure in as -- cend -- ing the cross in the flesh,
  to suf -- fer death,
  and to raise __ the dead by His glo -- ri -- ous re -- sur -- rec -- tion.
}

melody = \relative g' {
  \global % Leave these here for key to display
  \partial 2. g4 a b | c( d c) b | c8( d c b a4) a | b( c) b a | a2
  g4 g a( b c d) c2 c4 b \sixbm c( d c) b a b \fourbm b( c) c2
  d2 c4 c b4( a) g a b c b8( c b a) a2 r4
  \partial 2. g4 a b c c c b c8( d c b) a4 b c2 b4 a g2.
  \sixbm f4 g a a2 c4 c \fourbm b( c d) d a2 a4 a a( g) a b c c b8( c b4) a1
}

ison = \relative g' {
  \global % Leave these here for key to
  \tiny
  \partial 2. g4 a b a\breve g1 a2
  g4 g a\breve a1. a1
  a1 g\breve a2 s4
  g4 a b a\breve a1 g2.
  f4 g a a2
  a2 a\breve a4 g a2 a g a1
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
