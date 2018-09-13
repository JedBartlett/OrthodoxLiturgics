\version "2.18.2"

\header {
  title = "Nativity of The Theotokos"
  subtitle = "Kontakion"
  subsubtitle = "Tone 4"
  composer = "Kievan"
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
  \set Timing.defaultBarType = "" % Only put bar lines where I say
}

% http://media.oca.org/chanting-tutorial/Tutorial-Kievan-Tone4-Explanation.pdf
% The sticheron melody for Tone 4 consists of six (6) melodic phrases
% (A, B, C, D, E, F) and a Final Phrase for the last line of text.
% The first three phrases, A, B, and C are used only once,
% at the beginning of a sticheron, then D, E, and F are sung in rotation up to
% the last line of the text for the Final Cadence.
% If a sticheron is divided into 9 textual phrases, the musical
% lines will consist of A, B, C, D, E, F, D, E and Final Cadence.

verseOne = \lyricmode {
  \recite "By thy holy nativi" -- ty, O pure __ one,
  \recite "Joachim and Anna were delivered from the re" -- proach of bar -- ren -- ness;
  and __ Ad -- am and \recite "Eve were delivered from the" cor -- rup -- tion of death;
  \recite "thy people" do cel -- e -- brate it,
  \recite "having been saved from" the stain of in -- iq -- ui -- ty,
  cry -- ing un -- to thee:
  \recite "The barren doth give birth to the The" -- o -- to -- kos,
  \recite "who nourish" -- eth our __ life. __
}

soprano = \relative g' {
  \global
  %% Phrase A
  fis\breve fis4 a4 g (fis) g2 \bar "|"
  %% Phrase B
  a\breve a4 g a2 a2 g2 \bar "|"
  %% Phrase C
  g4 (a4) b2 b4 a % Intonation, either whole thing, or just b2 a4
  g\breve g4 a2 a4 a g2 \bar "|"
  %% Phrase D
  g\breve g4 fis2 g4 g a2 \bar "|"
  %% Phrase E
  a\breve a4 g2 a4 b a g fis2 \bar "|"
  %% Phrase F
  g4 g a2 a g2. \bar "|"
  %% Phrase D
  g\breve g4 fis2 (g) a \bar "|"
  %% Variation of Final
  a\breve a4 a8 (g fis4) g2 (fis e1) \bar "|."
}

alto = \relative c' {
  \global
  %% Phrase A
  d\breve d4 d4 d2 d2
  %% Phrase B
  fis\breve fis4 g fis2 fis2 d2
  %% Phrase C
  d2 g2 g4 d % Intonation, either whole thing, or just b2 a4
  d\breve d4 fis2 fis4 fis d2
  %% Phrase D
  d\breve d4 d2 d4 d fis2
  %% Phrase E
  fis\breve fis4 d2 d4 d d d d2
  %% Phrase F
  d4 d fis2 fis d2.
  %% Phrase D
  d\breve d4 d1 fis2
  %% Variation of Final
  fis\breve fis4 d2 d1 (b1)
}

tenor = \relative a {
  \global
  %% Phrase A
  a\breve a4 c b (a) b2
  %% Phrase B
  c\breve c4 b4 c2 c2 b2
  %% Phrase C
  b4 (c) d2 d4 c % Intonation, either whole thing, or just b2 a4
  b\breve b4 c2 c4 c b2
  %% Phrase D
  b\breve b4 a2 b4 b c2
  %% Phrase E
  c\breve c4 b2 c4 d c b a2
  %% Phrase F
  b4 b c2 c b2.
  %% Phrase D
  b\breve b4 a2 (b) c2
  %% Variation of Final
  c\breve c4 a2 b (a g1)
}

bass = \relative c {
  \global
  %% Phrase A
  d\breve d4 d g (d) g2
  %% Phrase B
  d\breve d4 d4 d2 d2 g2
  %% Phrase C
  g2 g g4 fis % Intonation, either whole thing, or just b2 a4
  g\breve g4 d2 d4 d g2
  %% Phrase D
  g\breve g4 d2 d4 d d2
  %% Phrase E
  d\breve d4 g2 g4 g fis g d2
  %% Phrase F
  g4 g d2 d g2.
  %% Phrase D
  g\breve g4 d1 d2
  %% Final
  d\breve d4 d2 g (d e1)
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
  \midi { \tempo 4 = 200
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
