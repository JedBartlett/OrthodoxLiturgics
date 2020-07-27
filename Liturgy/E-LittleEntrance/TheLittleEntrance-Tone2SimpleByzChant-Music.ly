\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1


global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key c \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  Come, let us wor -- ship and fall __ down be -- fore __ Christ.
  Save us, O Son of God Who art ri -- sen from __ the dead, __
    who sing __ to Thee,
    Al -- le -- lu __ i --  a.
}

melody = \relative c'' {
  \global % Leave these here for key to display
  g2 g4 g aes2 g4 g b( aes) g f e8( f g4) g2 \bar "|"
  b4( c) b aes b aes g2 b4 aes g f e8( f e4) f aes( g f8 g e f g2)  \bar "|"
  g4 c8( b c d) b4 b2 \bar"|"
  aes4 g g8( aes b4) aes g2 \bar "|."
}

ison = \relative c' {
  \global % Leave these here for key to display
  c\breve s\breve \bar "|"
  s\breve s\breve s1 s4 \bar "|"
  c4 g'2 g4 g2 \bar "|"
  c,1 s2. \bar "|."
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
