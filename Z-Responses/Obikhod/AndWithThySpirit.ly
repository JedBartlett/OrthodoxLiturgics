\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1


global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyricText = \lyricmode {          And with thy Spi -- rit. }
soprano = \relative c'' { \global a4  a    a  a2     a1 \fermata \bar "||" }
alto    = \relative c'  { \global f4  f    f  f2     f1 }
tenor   = \relative c'  { \global c4  c    c  c2     c1 }
bass    = \relative c   { \global f4  f    f  f2     f1 \fermata }

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
  \midi { \tempo 4 = 120
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
