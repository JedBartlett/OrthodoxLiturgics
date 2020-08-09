\version "2.18.2"

twobm= \set Timing.measureLength = #(ly:make-moment 2/4)
fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 6/4 % Starts with
  \key f \major
}

lyricText = \lyricmode {
  When Thou, O Christ our God,
  wast trans -- fig -- ured on the moun -- tain,
  Thou didst re -- veal Thy glo -- ry to Thy dis -- ci -- ples
  in pro -- por -- tion as they could bear it.
  Let Thine ev -- er -- last -- ing light al -- so en -- light -- en us sin -- ners,
  through the in -- ter -- ces -- sions of the The -- o -- to -- kos,
  O Thou be -- stow -- er of light,
  glo -- ry to Thee.
  glo -- ry to Thee.
}

melody = \relative g' { \global
  \repeat volta 3 { \partial 4
  f4 | f f e f g2 |
  g4 g g f g a |\fourbm bes( a) g2 |
  r4 f g a | bes g a8( bes a4) | g f e f | f( g) g2 |
  g4 g a( g) | f e d c |d8( e f4) f2 |
  \twobm f4 f |\fourbm g f e f | g g g a | bes( a) g f | e( f) g2
  f4 f g a | bes bes bes bes a g a8( bes a4) |
  g g g g |\sixbm f8( e d4) e f g2 |
  }
  \alternative {
    { \fourbm a4( g) f e | f1 \bar ":|." }
    { \fourbm a4( g) f a | g2.(f4 | e2 d4 e f1) \bar "|." }
  }
}

ison = \relative c' { \global \tiny
  f4 f f c\breve s1. s4
  \parenthesize f1 s2. c\breve
  s\breve d8( e f4) f2
  f4 f c\breve s
  f\breve s1 c\breve s2

  c1 f1
  f1 c1. d4 e f1
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
