\version "2.18.2"

\header {
  title = "Nativity of The Theotokos"
  subtitle = "Kontakion"
  subsubtitle = "Tone 4"
  composer = "Kievan"
  arranger = "Rdr. George"
  copyright = "This arrangement is free to distrubute for Liturgical use"
  tagline = "Arranged using https://oca.org/liturgics/learning-the-tones"
}

#(set-default-paper-size "letter")

% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

\defineBarLine "invisible" #'("" "" "")
global = {
  \time 1/1 % Not used, Time_signature_engraver is removed from layout
  \key g \major
  %\tempo 4=400
  \set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
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
  \recite "By thy holy" nativity, O pu -- re one, \break
  Jo -- a -- chim \recite "and Anna were delivered from the" reproach of bar -- ren -- ness;
  a -- nd Ad -- am \recite "and Eve were delivered from the" corrup -- tion of death;
  \recite "thy people" do cel -- e -- brate it,
  \recite "having been saved from" the stain of in -- i -- qu -- ity,
  cry -- ing un -- to thee:
  \recite "The barren doth give birth to the Theoto" kos,
      wh -- o nour -- ish -- eth our li -- fe.
}

soprano = \relative g' {
  \global
  %% Phrase A
  fis\breve fis4 a4 g fis g2 \bar "|"
  %% Phrase B
  e4 fis4 g4 % Intonation (Optional)
  a\breve a4 g a4 a4 g2 \bar "|"
  %% Phrase C
  g4 a4 b2 a4 % Intonation, either whole thing, or just b2 a4
  g\breve g4 a4 a4 g2 \bar "|"
  %% Phrase D
  g\breve g4 fis2 g4 g a2 \bar "|"
  %% Phrase E
  a\breve a4 g2 a4 b a g fis2 \bar "|"
  %% Phrase F
  g4 g g4 a2 g2 \bar "|"
  %% Final
  a\breve a4 g4 fis g a4 a g4 fis2 (e4 d4) e1 \bar "||"
}

alto = \relative c' {
  \global
  %% Phrase A
  d\breve d4 d4 d d d2
  %% Phrase B
  e4 e4 e4 % Intonation (Optional)
  fis\breve fis4 g fis4 fis4 d2
  %% Phrase C
  d4 d4 g2 d4 % Intonation, either whole thing, or just b2 a4
  d\breve d4 fis4 fis4 d2
  %% Phrase D
  d\breve d4 d2 d4 d fis2
  %% Phrase E
  fis\breve fis4 d2 d4 d d d d2
  %% Phrase F
  d4 d d4 fis2 d2
  %% Final
  fis\breve fis4 d4 d d4 d4 d d d2 cis4 b4 b1
}

tenor = \relative a {
  \global
  %% Phrase A
  a\breve a4 c b a b2
  %% Phrase B
  g4 a4 b4 % Intonation (Optional)
  c\breve c4 b4 c4 c4 b2
  %% Phrase C
  b4 c4 d2 c4 % Intonation, either whole thing, or just b2 a4
  b\breve b4 c4 c4 b2
  %% Phrase D
  b\breve b4 a2 b4 b c2
  %% Phrase E
  c\breve c4 b2 c4 d c b a2
  %% Phrase F
  b4 b b4 c2 b2
  %% Final
  c\breve c4 b4 a b c4 c b4 a2 a4 fis4 g1
}

bass = \relative c {
  \global
  %% Phrase A
  d\breve d4 d g d g2
  %% Phrase B
  e4 e4 e4 % Intonation (Optional)
  d\breve d4 d4 d4 d4 g2
  %% Phrase C
  g4 g4 g2 fis4 % Intonation, either whole thing, or just b2 a4
  g\breve g4 d4 d4 g2
  %% Phrase D
  g\breve g4 d2 d4 d d2
  %% Phrase E
  d\breve d4 g2 g4 g fis g d2
  %% Phrase F
  g4 g g4 d2 g2
  %% Final
  d\breve d4 d4 d g fis4 fis g4 d2 (a4 b4) e1
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
