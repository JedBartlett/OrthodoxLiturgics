\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm=\set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
}

lyricText = \lyricmode {
  Thee, who art the me -- di -- a -- trix
  for the sal -- va -- tion of our race,
  we praise, O vir -- gin The -- o -- to -- kos,
  for in the flesh as -- sumed from thee,
  af -- ter that He had suf -- fered the pas -- sion of the cross,
  thy Son and our God de -- liv -- ered us from cor -- rup -- tion,
  be -- cause He is the Lov -- er of man -- kind. __
}

melody = \relative g' { \global
  f4 f g a | bes a a g( | g)
  g g g | \sixbm a( g) f2 g4 a | \fourbm a2.
  bes4 | \sixbm c( bes) a8( bes a g) f4 a | \fourbm g g f( e) | \sixbm d2.
  f4 f f | \fourbm g f g a | a2
  a4 bes | c bes c( d) | c( bes) a f | a g f e | d2.
  g4 | \sixbm g( a) bes a g f | g4 g g2 e4 f | e( d) c2.
  c4 | f f g f g g | \fourbm a( g) f( e) | g2.( f4 e2 d4 e f1) \bar"|."
}

ison = \relative c' { \global \tiny
  f\breve
  f\breve s2 f\breve
  s2 d1. s4
  f\breve s4
  f\breve s2
  d\breve s1. c\breve
  s1 f\breve s2 c1. d4 e f1
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
