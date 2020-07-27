\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Starts with
  \key f \major
}

lyricText = \lyricmode {
  From the heights Thou didst de -- scend,
  O com -- pas -- sion -- ate One,
  and Thou didst sub -- mit to the three- day bur -- i -- al
  that Thou might de -- liv -- er us from pas -- sion.
  Thou art our Life and our Res -- ur -- rec -- tion,
  O Lord, glo -- ry to Thee.
}

melody = \relative g' {
  \global % Leave these here for key to display
  \partial 2 f4 f | bes4 a g a | g2
  d4 e | f( g) f e | f2.
  f4 | bes( a) g a | g2 d4 e | f g f e | f2.
  f4 | bes2 a4 g | a g f d | e( f) g2
  f2 g4 a | bes2 a4 bes | \sixbm c c bes( a) g( a) |
  \fourbm g2 d4( e) | f( g) f e | f1
}

ison = \relative c' {
  \global % Leave these here for key to display
  \tiny
  \partial 2 f2 f1 c2
  d4 e f( g) f e f1
  f1 c2 d4 e f g f e f\breve
  d1 c1
  f\breve f1 c2
  c2 d4 e f g f e f1
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
