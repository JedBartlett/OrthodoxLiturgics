\version "2.18.2"

twobm=\set Timing.measureLength = #(ly:make-moment 2/4)
fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Starts with
  \key f \major
}

lyricText = \lyricmode {
  God is the Lord and hath ap -- peared un -- to us.
  Bless -- ed is He that com -- eth in the Name of the Lord.
}

melody = \relative g' {\global % Leave these here for key to display
  \partial 2. f4 e f | g f f e | f8.( g16 f8 e) d4 e |\twobm f2 |
  \sixbm a4( bes) a g g f | a8( bes a4) g2 f4 g |\fourbm a( g) f e | f2. r4 \bar"|."
}

ison = \relative c' {\global \tiny
  f\breve s s1 s4
  c\breve f2.
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
