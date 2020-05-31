\version "2.18.2"

twobm= \set Timing.measureLength = #(ly:make-moment 2/4)
threebm=\set Timing.measureLength = #(ly:make-moment 3/4)
fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
fivebm=\set Timing.measureLength = #(ly:make-moment 5/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 6/4 % Starts with
  \key c \major
}

lyricText = \lyricmode {
 Thou has as -- cend -- ed in glo -- ry, O Christ our God,
 and glad -- dened Thy Dis -- ci -- ples with the prom -- ise of the Ho -- ly spir -- it,
 mak -- ing them con -- fi -- dent through the bless -- ing that Thou art the Son of God,
 and De -- liv -- er -- er of the world.
 and De -- liv -- er -- er of the world.
}

melody = \relative g' { \global % Leave these here for key to display
  \repeat volta 3 { e4 e f g g g |\threebm aes g f |\fourbm f e e2 |
  \fivebm e4 g g f g |\fourbm aes g g aes | b aes g f |\sixbm aes g f2 e2
  \threebm e4 e f |\fivebm g g g f g |\threebm aes g aes |\threebm b( aes) b |\fivebm aes aes g g2 |}
   \alternative {
        { \twobm g4 g |\fourbm b( aes) g f | f e e2 }
        { \twobm g4 g |\fivebm b aes g g8( f) e4 | f2( g4 aes2 |\threebm g2.) \bar"|." }
   }
}

ison = \relative c' { \global \tiny % Leave these here for key to
  \repeat volta 3 { e4 e f g g g e\breve
  g\breve s1 e1.
  e4 e f g\breve g}
   \alternative {
        { g4 g e\breve }
        { g4 g e1 s4 f1 s4 g2.}
   }
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
