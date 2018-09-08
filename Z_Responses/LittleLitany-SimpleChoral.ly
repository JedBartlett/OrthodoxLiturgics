\version "2.18.2"

\header {
  title = "Little Litany"
  composer = "Simple Choral"
  copyright = "This arrangement is free to distribute for Liturgical use"
  tagline = "Arranged using https://oca.org/liturgics/learning-the-tones"
}

#(set-default-paper-size "letter")

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

\defineBarLine "invisible" #'("" "" "")
global = {
  \time 1/1 % Not used, Time_signature_engraver is removed from layout
  \key f \major
  \set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
}

verseOne = \lyricmode {
  Lord, have mer -- cy
  Lord, have mer -- cy
  \recite "Most holy Theo" to -- kos save us
  A -- men
}

soprano = \relative g' {
  \global % Leave these here for key to display
  a4^\mf g a2 a \bar "||"
  a4 a bes2 a \bar "||"
  a\breve^\pppp a4 g4 a2 a \bar "||"
  a2^\mf a \bar "|."
}

alto = \relative g' {
  \global % Leave these here for key to display
  f4 f f2 f
  f4 f g2 f
  f\breve f4 f f2 f
  f2 f
}

tenor = \relative c' {
  \global % Leave these here for key to display
  c4 c c2 c
  c4 c d2 c
  c\breve c4 c c2 c
  c2 c
}


bass = \relative c {
  \global % Leave these here for key to display
  f4 f f2 f
  f4 f bes,2 f'
  f\breve f4 f f2 f
  f2 f
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
    } \lyricsto "soprano" \verseOne

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
