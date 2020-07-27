\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm=\set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Starts with
  \key f \major
}

lyricText = \lyricmode {
  As Ga -- bri -- el cried un -- to thee,
  hail, O Vir -- gin,
  with that cry __ did the Lord __ of all
  be -- come in -- car -- nate in thee, O ho -- ly ark,
  as spake the right -- eous Da -- vid,
  and thou was re -- vealed as more spa -- cious than the heav -- ens,
  in that thou bore thy Cre -- at -- or.
  Where -- fore, glo -- ry to Him who a -- bode in thee!
  Glo -- ry to Him who came from thee!
  Glo -- ry to Him who through thy birth -- giv -- ing
  hath set us free. __
}

melody = \relative g' { \global \partial 4
  g4 a g g g f f g( f)
  f4 e f( g) g2
  g4 g a8( bes c4) bes a bes( c bes) a g
  f4 g a bes( a) g g a g f e d2.
  d4 d c d e \sixbm f( e) d2. r4
  \fourbm d4 d e f g2 g4 g a( bes) g2 g4 a bes( c) d2 r4
  g,4 g f f( g) f d e( f) d2. r4
  e8( f g4) g2 a8( bes a4) g f g2 f4 e f g g2
  g4( a) a g a c bes a g2. r4
  \sixbm f4( e) f g g2 \fourbm g4( f) g a \sixbm bes( a) g( f) f
  e4 \fourbm g( f) e8( f e4) d2( c4 d \sixbm e8 f e4 d1 ) \bar"|."
}

ison = \relative c' { \global  \tiny
  d4 d\breve
  d\breve
  a'1 g1 d\breve
  s1 d\breve
  c2 d\breve
  d\breve d\breve
  s1. c2 d\breve
  d\breve s1
  d\breve s1
  d\breve s
  d1. c1 d
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
  \midi { \tempo 4 =150
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
