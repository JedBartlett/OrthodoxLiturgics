\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
fivebm=\set Timing.measureLength = #(ly:make-moment 5/4)
sixbm=\set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 6/4 % Starts with
  \key c \major
}

lyricText = \lyricmode {
  When Thou __ didst sub -- mit Thy -- self un -- to death,
  O Thou death -- less and im -- mor -- tal One,
  then Thou didst de -- stroy hell with Thy God -- ly pow'r,
  and when Thou didst raise the dead from be -- neath the earth,
  all the pow'rs of heav -- en did cry a -- loud un -- to Thee:
  O Christ, __ Thou Giv -- er of life,
  glo -- ry to Thee!
}

melody = \relative g' {
  \global % Leave these here for key to display
  \partial 4 g4 | e( f g aes) g f aes g g( f) f e f2.
  \fourbm \partial 4 g4 aes2 aes4 g g8 f e( f g4) g g2.
  aes4 aes2 g4 g \sixbm b( aes) g2 f4 g \fourbm aes2( g4) f e2. r4
  \sixbm g4 aes b c c b \fourbm aes( g) g g \fivebm g8( aes b4) aes g2
  \fourbm b4 b b aes \sixbm aes( b) g f aes g \fourbm g( aes) g f e2.
  c'4 d( c b) aes \sixbm b( c) b aes g2
  e4( f g aes) g f \fourbm g1 \bar"|."
}

ison = \relative g' {
  \global % Leave these here for key to display
  \tiny
  \partial 4 g4 | e f g aes g f aes g g( f) f e f2.
  \partial 4 g4 aes2 aes4 g g8 f e f g4 g g2.
  aes4 aes2 g4 g g2 g2 f4 g aes2 g4 f e2. r4
  g1.g\breve s4 g1 g2. f4 aes g g aes g f e2.
  g4 g1 g1.
  e4 f g aes g f g1
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
