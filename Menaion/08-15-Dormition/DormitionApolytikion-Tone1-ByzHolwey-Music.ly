\version "2.18.2"

twobm= \set Timing.measureLength = #(ly:make-moment 2/4)
fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
fivebm=\set Timing.measureLength = #(ly:make-moment 5/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 5/4 % Starts with
  \key f \major
}

lyricText = \lyricmode {
  In thy birth -- giv -- ing, O The -- o -- to -- kos,
  thou didst keep and pre -- serve vir -- gin -- i -- ty;
  and in thy fall -- ing a -- sleep thou has not for -- sak -- en the world;
  for thou wast trans -- lat -- ed in -- to life,
  be -- ing the Moth -- er of Life.
  Where -- fore by thine in -- ter -- ces -- sions,
  de -- liv -- er our souls from __
  death.
  death. __
}

melody = \relative g' { \global % Leave these here for key to display
  \repeat volta 3 { \partial 2.
  d4 e f | g g g f g |\sixbm a8( bes a4) g2
  f4 g |\fourbm a( g) f e | g g f e | d2 r4
  d4 | e f g8( a g f) | e4 f g2 | a4 g f e | g8( a g4) f e | d2 r4
  d4 | g2 g4 fis | ees d ees fis |\fivebm g2 g4f e |\fourbm g( \acciaccatura {a8} g4) f e | d2 r2 |
  g4 g g f | e f f( g) | g2 f4 g |\twobm f e |\fourbm g4( f) e8.( f16 e8 d) |
  }
  \alternative {
    { d2. s4 \bar ":|." }
    {\fourbm d8( e c2 d4 |\sixbm e8 f e4 d2. s4 ) \bar "|." }
  }
}

ison = \relative c' { \global \tiny
  d\breve s s
  s s1.
  c1 d1
  d\breve
  s1 s4
  c1 d1
  d\breve
  s s2
  d1
  d4 c1 s4 d1
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
