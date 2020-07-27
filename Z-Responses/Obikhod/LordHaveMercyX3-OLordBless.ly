\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1


global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  Lord \recite "have mercy, Lord have mercy, Lord" have mer -- cy.
  O Lord, bless.
}

soprano = \relative c'' {
  \global % Leave these here for key to display
  \textLengthOn
  % Note that inserted text here ABOVE the lyrics noted above
  a4 \parenthesize a\breve
  % of Ages Amen
  a4 a2 a2 \bar "|" bes2 bes a1 \bar "|."
}

alto = \relative c' {
  \global % Leave these here for key to display
  \textLengthOn
  % Note that inserted text here ABOVE the lyrics noted above
  f4 \parenthesize f\breve
  % of Ages Amen
  f4 f2 f2 f2 e f1
}

tenor = \relative c' {
  \global % Leave these here for key to display
  \textLengthOn
  % Note that inserted text here ABOVE the lyrics noted above
  c4 \parenthesize c\breve
  % of Ages Amen
  c4 c2 c2 d2 c c1
}

bass = \relative c {
  \global % Leave these here for key to display
  \textLengthOn
  % Note that inserted text here ABOVE the lyrics noted above
  f4 \parenthesize f\breve
  % of Ages Amen
  f4 f2 f2 <bes bes,>2 <a c,>2 f1
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { S A }
    } <<
      \new Voice = "soprano" { \voiceOne \soprano }
      \new Voice = "alto" { \voiceTwo \alto }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "soprano" \lyricText

    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { T B }
      } <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
    >>
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
