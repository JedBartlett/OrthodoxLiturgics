\version "2.18.2"

\header {
  title = "Nativity of the Theotokos"
  subtitle = "Antiphon"
  subsubtitle = "Verse for 3rd (Sung immediately before Apolytikion)"
  copyright = "This arrangement is free to distribute for Liturgical use"
  tagline = "Arranged using https://oca.org/liturgics/learning-the-tones"
}

#(set-default-paper-size "letter")

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

global = {
  \time 1/1 % Not used, Time_signature_engraver is removed from layout
  \key g \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

verseOne = \lyricmode {
  Here will I dwell, for I have cho -- sen her.
  The Most High hath hal -- lowed His tab -- er -- nac -- le.
  Ho -- ly is Thy tem -- ple,
  won -- der -- ful in right -- eous -- ness.
}

soprano = \relative g' {
  \global
  % Verse 1
  g4 g a b b a b c2 c4 b4 r4 \bar "|"
  g4 a b b b b g a2 a4 a g2 \bar "||"
  g4 a b g c2. b2 r4 \bar "|"
  g4 a b g a2 a2 g2 \bar "|."
}

alto = \relative g' {
  \global
  % Verse 1
  g4 g g g g g g g2 g4 g4 r4
  g4 g g g g g g fis2 fis4 fis4 d2
  g4 g g g g2. g2 r4
  g4 g g g d2 d d
}

tenor = \relative c' {
  \global
  % Verse 1
  b4 b d d d d d e2 e4 d4 r4
  b4 d d d d d b c2 c4 c b2
  b4 d d d e2( c4) d2 r4
  b4 d d d c2 c2 b2
}

bass = \relative c {
  \global
  % Verse 1
  g'4 g g g g g g c,2 e4 g4 r4
  g4 g g g g g g d2 d4 d g2
  g4 g g g c,2. g'2 r4
  g4 g g g d2 fis2 g2
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
