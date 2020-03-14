\version "2.18.2"

twobm=\set Timing.measureLength = #(ly:make-moment 2/4)
fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Starts with
  \key d \minor
}

lyricText = \lyricmode {
  All cre -- a -- tion was a -- mazed
  at thy di -- vine glo -- ry.
  for thou, O un -- wed -- ded Vir -- gin,
  didst hold with -- in thee the God of All.
  and didst bear the E -- ter -- nal Son.
  Who re -- wards with sal -- va -- tion
  all who hymn thy prais -- es.
}

melody = \relative g' { \global
  \partial 2 e4^"Ode 5" e | f d e f |\sixbm g2
  r4 f g g |\fourbm g8( f e4) f8( g f4) |\fourbm e2
  r4 e4 |\sixbm b'2 b4 c b a |\fourbm g8( a b4) b
  a4 |\sixbm b( c) bes a g a |\fourbm bes( a g) f | e2
  e4 e | g( f) e dis |\sixbm c dis e2
  e4 f |\fourbm g2 f4 g | a( bes) g2 | g4 a g e | f8( g f4) e2
  \bar"|."
}

ison = \relative g' { \global \tiny
  e4 e e\breve s\breve s2
  g\breve s
  e\breve s2 e4 dis c dis e2
  e\breve s1.
  d2 e
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
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
