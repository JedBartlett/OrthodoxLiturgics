\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm=\set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
}

lyricText = \lyricmode {
  Let the heav -- ens re -- joice and the earth __ be __ glad,
  for the Lord hath done a might -- y act with His own __ arm.
  He hath tram -- pled down death by death and be -- come the First -- born __ from the dead.
  He hath de -- liv -- ered us from the depths of ha -- des,
  grant -- ing the world the great mer -- cy.
}

melody = \relative g' {
  \global % Leave these here for key to display
  \partial 2 f4 f  | g( f) g a | a2 f4 a | g8( a g4) f4( e) | d2
  g4 a | bes a g g | a g g f | f2 g4( a) | a2
  a4 bes \sixbm | c bes a( bes) bes g \fourbm | a2 a4 bes | a g f( a) | g8( a g4) f e | d2.
  g4 g a bes a g2 g4 e g f e( d) c1
  a'8( bes c4) bes g a2. g4 a( g) f( e) f1
}

ison = \relative c' {
  \global % Leave these here for key to
  \tiny
  f4 f f\breve d1 d2 g\breve s4 f4 f1
  f2 f\breve f\breve d1 d\breve
  c\breve c1
  f\breve c1 f1
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
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
