\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1


global = {
  \time 2/4 % Not used, Time_signature_engraver is removed from layout
  \key d \aeolian
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  More \recite ""% Positioned text in melody goes here
  we mag -- ni -- fy __ _ thee.
}

melody = \relative c' {
  \global % Leave these here for key to display
  \textLengthOn
  % Note that inserted text here ABOVE the lyrics noted above
  c4 \parenthesize d\breve_\markup {\hspace #2 \column{
      \line{hon'rable than the Cherubim, and more glorious}
      \line{beyond compare than the Seraphim, thou who without}
      \line{corruption bearest God the Word and art truly Theotokos}
  }}\bar "|"
  % of Ages Amen
  d4 f g \bar "|" e c \bar "|" d2 \bar "|." \break
}

ison = \relative c' {
  \global % Leave these here for key to display
  c4 s\breve \bar "|"
  % of Ages Amen
  s4 s2 \bar "|" c4 c4 \bar "|" d2 \bar "|."
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
