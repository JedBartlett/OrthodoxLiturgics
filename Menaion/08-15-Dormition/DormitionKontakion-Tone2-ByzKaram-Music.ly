\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
fivebm=\set Timing.measureLength = #(ly:make-moment 5/4)
sixbm=\set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 6/4 % Starts with
  \key c \major
}

lyricText = \lyricmode {
  Ver -- i -- ly, the The -- o -- to -- kos,
  who is ev -- er watch -- ful in in -- ter -- ces -- sions,
  and whose prayers are nev -- er re -- ject -- ed,
  nei -- ther tomb nor death could con -- trol.
  But since she is the Moth -- er of Life,
  He who dwelt in her ev -- er -- vir -- gin womb
  did trans -- late her to life. __
}

melody = \relative g' { \global
  \partial 1 aes4 g g f | e e e8( f g4) g2 |
  \fourbm e4 e f g |\fivebm aes aes g g \accent g |\fourbm g4. ( f8 e f g4) |\fivebm e2 r4 \breathe
  e4 e f f g f e e8( f g4) g2 r4 \breathe |
  \fourbm e4 e f g aes8(b aes4) g f e2 r4 \breathe
  g4 | aes g g aes b( c) b aes | g2
  f4 g |\fivebm aes aes aes aes g b( aes) g g2 \breathe
  g4 g aes g f |\sixbm f2.( g4 aes8 b aes4 g2.)
  \bar"|."
}

ison = \relative g' {\global \tiny
  g2. f4 e e e8( f g4) g2
  e\breve s
  e4 e f f g f e e8( f g4) g2 s4
  e\breve s2.
  g\breve s2.
  f4 g aes aes aes g\breve s4
  f\breve s4 g2.)
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
