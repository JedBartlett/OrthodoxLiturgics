\version "2.18.2"

twobm=\set Timing.measureLength = #(ly:make-moment 2/4)
threebm=\set Timing.measureLength = #(ly:make-moment 3/4)
fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
fivebm=\set Timing.measureLength = #(ly:make-moment 5/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)
eightbm= \set Timing.measureLength = #(ly:make-moment 8/4)

global = {
  \time 3/4 % Starts with
  \key c \major
}

lyricText = \lyricmode {
  When Thou didst ful -- fil Thy dis -- pen -- sa -- tion for our sakes,
  u -- nit -- ing the ter -- res -- tri -- als with the ce -- les -- tials,
  Thou didst as -- cend in glo -- ry, O Christ our God,
  in sep -- 'ra -- ble in space, but con -- stant with -- out sep -- a -- ra -- tion,
  and cry -- ing un -- to Thy __ be -- lov -- ed: I am with you,
  and no one shall be a -- gainst __ you. __
}

melody = \relative g' { \global % Leave these here for key to display
  \partial 4 g4 | aes g f |\fourbm g g f g | aes aes g f |e2 r4
  e4 | g f e f |\sixbm aes g g f e e | e8( f g4) g2 r4
  f4 |\twobm g aes |\fivebm b aes b( c) b | aes aes g g2 |
  \fivebm aes4 b\accent b aes8( g) f4 |\fourbm g2 r4 aes4 | b aes g aes | g( f) e f | e2 r4
  e4 | f f aes g | g4.( f8) e4 aes | g2 r4 f4 | g aes b2 |
  g4 b aes g |\sixbm g g g( f e g) |\eightbm f2(~ f8 g aes2 g2.) \bar"|."
}

ison = \relative g' { \global \tiny % Leave these here for key to
  \partial 4 g4 | aes g f |g g f g | e1. s4
  e4 | g f e f | aes g g f e e | e8( f g4) g2 s4
  f4 | g\breve s1 g4 g2 f2 \parenthesize g1 s2. e\breve
  e4 | f f aes g | g4.( f8) e4 aes | g2 s4 f4 | g\breve
  s2 e1 f1 s4 g2.

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
