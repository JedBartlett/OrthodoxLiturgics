\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
fivebm= \set Timing.measureLength = #(ly:make-moment 5/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Starts with
  \key f \major
}

lyricText = \lyricmode {
  Bless -- ed art Thou, O Christ our God,
  who has re -- vealed the fish -- er -- men as most wise,
  hav -- ing sent up -- on them the Ho -- ly Spir -- it,
  and through them Thou has fished the u -- ni -- verse
  O Lov -- er of man -- kind,
  glo -- ry to Thee
  glo -- ry to Thee
}

melody = \relative g' { \global % Leave these here for key to display

  \bar"|."
}

ison = \relative c' { \global \tiny

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
