\version "2.18.2"

twobm=\set Timing.measureLength = #(ly:make-moment 2/4)
threebm=\set Timing.measureLength = #(ly:make-moment 3/4)
fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Starts with
  \key c \major
}

lyricText = \lyricmode {
  God is the Lord and hath ap -- peared un -- to us.
  Bless -- ed is He that com -- eth in the Name of the Lord.
}

melody = \relative g' {\global % Leave these here for key to display
  \partial 2. aes4 g g | e4.( f8 g4) f |\twobm g aes |\threebm b aes8( g) f4 |\twobm g2 |
  \threebm aes4 g aes |\twobm b g |\sixbm aes8( b aes4) g2 f4 f |\fourbm g8.( aes16 g8 f) e4 f | g8( aes g2) r4 \bar"|."
}

ison = \relative g' {\global \tiny
  g\breve s s4 s\breve
  c,1 g'1
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
  \midi { \tempo 4 = 150
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}

\markup{\hspace#4 \wordwrap
        \italic{Verse 1:} O give thanks unto the Lord, and call upon his holy name.
        \teeny{\italic{REFRAIN}}}
\markup{\hspace#4 \wordwrap
        \italic{Verse 2:} All nations compassed me about: but in the name of the Lord will I destroy them.
        \teeny{\italic {REFRAIN}}}
\markup{\hspace#4 \wordwrap
        \italic{Verse 3:} This is the Lord's doing; it is marvelous in our eyes.
        \teeny{\italic {REFRAIN}}}
