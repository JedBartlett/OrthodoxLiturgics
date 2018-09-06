   \version "2.18.2"

\header {
  title = "Nativity of The Theotokos"
  subtitle = "Megalynarion"
  subsubtitle = "Tone 8"
  composer = "Kievan"
  copyright = "This arrangement is free to distribute for Liturgical use"
  tagline = "Arranged using https://oca.org/liturgics/learning-the-tones"
}

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
#(set-default-paper-size "letter")

recite = \once \override LyricText.self-alignment-X = #-1

\defineBarLine "invisible" #'("" "" "")
global = {
  \time 1/1 % Not used, Time_signature_engraver is removed from layout
  \key g \major
  \set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
}

% http://media.oca.org/chanting-tutorial/Tutorial-Kievan-Tone8-Explanation.pdf
% The sticheron melody for Tone 8 consists of three phrases (A, B, C, A'ʹ, B, C)
% which are sung in rotation up to the last line of the sticheron,
% and a final phrase.  If a sticheron is divided into 7 textual phrases,
% the musical lines will consist of A, B, C, A'ʹ, B, C and Final Phrase.

verseOne = \lyricmode {
Mag -- ni -- fy, \recite "O my soul, the Vir" -- gin Ma -- ry,
born of a bar __ -- ren womb. __
\recite "Verily, virgini" -- ty, O The -- o -- to -- kos,
\recite "is impossible for" a moth -- er,
as birth -- \recite "giving is impossi" -- ble for __ vir -- gins.
\recite "Yet in thee hath the dispensation" of both been ac -- com -- plished.
Where -- \recite "fore, all we families of" the earth
  do cease -- less -- ly bless  __ thee.
}

soprano = \relative g' {
  \global
  %% Phrase A
  a4 b4 c2 % Intonation
    b\breve b4 c2.( b4) a2 \bar "|" \break
  %% Phrase B
  b4 c4 d4 % Intonation
    c4 b4 c2( d4 c4 b2) \bar "|"
  %% Phrase C
  c\breve c4 b2 a4 c4 b2( a2) g2 \bar "|"
  %% Phrase A'
  b\breve b4 c2.( b4) a2 \bar "|"
  %% Phrase B
  b4( c4) d4 % Intonation
    c\breve c4 b4 c2( d4 c4) b2 \bar "|"
  %% Phrase C
  c\breve c4 b2 a4 c4 b2( a2) g2 \bar "|"
  %% Final
  b4 c\breve c4 b4 c4 c4 d4 b4 c2( b2) a1 \bar "|."
}

alto = \relative c' {
  \global
}

tenor = \relative a {
  \global
  %% Phrase A
  %% Phrase B
  %% Phrase C
  %% Phrase A'
  %% Phrase B
  %% Phrase C
  %% Final
}

bass = \relative a {
  %% Phrase A
  a4 g4 c,2 % Intonation
    g'\breve g4 c,2.( g'4) a2 \bar "|"
  %% Phrase B
  g4 g g % Intonation
    c,4 g'4 c,2( b4 c4 g'2) \bar "|"
  %% Phrase C
  c,\breve c4 g'2 e4 c4 d2( d2) g2 \bar "|"
  %% Phrase A'
  g\breve g4 c,2.( g'4) a2 \bar "|"
  %% Phrase B
  g4( g) g4 % Intonation
    c,\breve c4 g'4( c,2) b4( c4) g'2 \bar "|"
  %% Phrase C
  c,\breve c4 g'2 e4 c4 d2( d2) g2 \bar "|"
  %% Final
  g4 c,\breve c4 g'4 c,4 c g'4 g c,2( g2) a1 \bar "|."
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
