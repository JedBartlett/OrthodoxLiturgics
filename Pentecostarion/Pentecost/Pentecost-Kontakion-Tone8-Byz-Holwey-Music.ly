\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
fivebm= \set Timing.measureLength = #(ly:make-moment 5/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Starts with
  \key f \major
}

lyricText = \lyricmode {
  When the High One de -- scend -- ed, con -- fus -- ing tongues,
  He di -- vid -- ed the na -- tions.
  And when He dis -- trib -- u -- ted the fier -- y tongues
  He called all to one u -- ni -- ty.
  Where -- fore, in u -- ni -- son we glo -- ri -- fy the
  most -- Ho -- ly spir -- it.
}

melody = \relative g' { \global % Leave these here for key to display
  \partial 2 f4 g | a g g f( | e) d d e | f g2
  f4 | f a g2 |\sixbm d4( e) f2 f |
  \fourbm f4 f g a | bes bes a g | a f g2 |
  \fivebm g4 a g g2 |\fourbm d4( e) f( g) |\sixbm f( e) f2 r4
  g4 |\fourbm f g a g | g a bes a |\sixbm g g
  g4( f) e d |\fourbm bes'( a) g4.( f8 |\fivebm e4 d8 e f2.) \bar"|."
}

ison = \relative c' { \global \tiny
  f2 d\breve s4 c2
  f2. c2 d4 e f\breve
  f1. \parenthesize c1
  s2. d4 e f g f e f2.
  c\breve s2.
  \parenthesize d1 s2 c1 f2.
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
  \midi { \tempo 4 = 150
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
