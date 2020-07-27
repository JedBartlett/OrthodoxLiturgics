\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1


global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key g \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  As ma -- ny of you as have been bap -- tized in -- to Christ,
  have put on Christ, Al -- le -- lu -- i -- a.
}


melody = \relative c' {
 \global % Leave these here for key to display
 \partial 4  e4 a2 a4 g a2 g4 fis e2 b'4 b g a a2. \bar "|"
 a4 d( c) b( a) b( a g fis) e fis a( g) fis8( g fis e) e2. \bar "|."
}

ison = \relative c' {
  \global % Leave these here for key to display

  e\breve s1 s1 s2.
  d1 g4 fis e1. b2 e2.

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
