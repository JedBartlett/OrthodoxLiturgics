\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

\defineBarLine "invisible" #'("" "" "")
global = {
  \time 2/4 % Not used, Time_signature_engraver is removed from layout
  \key c \major
  \set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  Most \recite "holy Theotokos," save __ us.
}

melody = \relative g' {
  \global % Leave these here for key to display
  g4 g\breve aes4 g2 \bar "|."
}

ison = \relative c' {
  \global % Leave these here for key to display
  c\breve
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
  \midi { \tempo 4 = 300
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
