\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
fivebm=\set Timing.measureLength = #(ly:make-moment 5/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 6/4 % Starts with
  \key c \major
}

lyricText = \lyricmode {
  Hav -- ing learned the joy -- ful mes -- sage
  of the res -- ur -- rec -- tion from the an -- gel
  the wom -- en dis -- ci -- ples of the Lord cast from them
  their pa -- ren -- tal con -- dem -- na -- tion,
  and proud -- ly broke the news to the dis -- ci -- ples,
  say -- ing: Death __ hath been spoiled.
  Christ __ God is ris -- en, grant -- ing the world great __ mer -- cy.
}

melody = \relative g' {
  \global % Leave these here for key to display
  \partial 2 e4 f | g2. e4 f g \fourbm b( a) g2
  g4 f g g b a g f \sixbm g( f) e2.
  d4 \fourbm e( f) g g g f e f g2) e4 f g2
  b4 a g g g a \fivebm g( f) e2.
  f4 g8( a b4) b2 \fourbm b4 b b a b c b( a) g2
  g4 f g( a) g f e2. r4
  g4( a) g f g8( a b4) b2 c8( d c4) b a g2 b4( a) g2( f) e1
}

ison = \relative c' {
  \global % Leave these here for key to
  \tiny
  \partial 2 e2 e1. e\breve e1 d2 e1
  e\breve e\breve e1 d2 e2.
  f4 g1 g\breve g2 g4 f g a g f e2. s4
  g4 a g f g\breve g2 g2 d1 e1
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
