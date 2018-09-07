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
born of a bar -- ren womb.
\recite "Verily, virginity," O The -- o -- to -- kos,
\recite "is impossible for" a moth -- er,
as __ birth -- \recite "giving is impossi" -- ble for vir -- gins.
\recite "Yet in thee hath the dispensation" of both been ac -- com -- plished.
\recite "Wherefore, all we families of the" earth
  do cease -- less -- ly bless  __ thee.
}

soprano = \relative g' {
  \global
  %% Phrase A
  a4 b4 c2 % Intonation
    b\breve b4 c2.( b4) a2 \bar "|"
  %% Phrase B
  b4 c d % Intonation
    c2( d4) c b2 \bar "|" % Cadence
  %% Phrase C
  c\breve c4 b2 a4( c4) b2( a2) g2 \bar "|"
  %% Phrase A'
  b\breve b4 c2.( b4) a2 \bar "|"
  %% Phrase B
  b4( c4) d4 % Intonation
    c\breve c4 b4 c2( d4 c4) b2 \bar "|"
  %% Phrase C
  c\breve c4 b2 a4 c4 b2( a2) g2 \bar "|"
  %% Final
  c\breve c4 b4 c2 d4 b4 c2( b2) a1 \bar "|."
}

alto = \relative c' {
  \global
  %% Phrase A
  e4 g g2 % Intonation
    g\breve g4 g2.( g4) e2
  %% Phrase B
  g4 g g % Intonation
    g2( g4) g g2 % Cadence
  %% Phrase C
  g\breve g4 g2 g4( g4) g2( fis2) d2
  %% Phrase A'
  g\breve g4 g2.( g4) e2
  %% Phrase B
  g4( g4) g4 % Intonation
    g\breve g4 g4 g2( g4 g4) g2
  %% Phrase C
  g\breve g4 g2 g4 g4 g2( fis2) d2
  %% Final
  g\breve g4 g4 g2 g4 g4 g2( g2) e1
}

tenor = \relative a {
  \global
  %% Phrase A
  c4 d e2 % Intonation
    d\breve d4 e2.( d4) c2
  %% Phrase B
  d4 e f % Intonation
    e2( f4) e d2 % Cadence
  %% Phrase C
  e\breve e4 d2 c4( e4) d2( c2) b2
  %% Phrase A'
  d\breve d4 e2.( d4) c2
  %% Phrase B
  d4( e4) f4 % Intonation
    e\breve e4 d4 e2( f4 e4) d2
  %% Phrase C
  e\breve e4 d2 c4 e4 d2( c2) b2
  %% Final
  e\breve e4 d4 e2 f4 d4 e2( d2) c1
}

bass = \relative a {
  %% Phrase A
  a4 g4 c,2 % Intonation
    g'\breve g4 c,2.( g'4) a2
  %% Phrase B
  g4 g g % Intonation
    c,2( b4) c4 g'2 % Cadence
  %% Phrase C
  c,\breve c4 g'2 e4( c4) d2( d2) g2
  %% Phrase A'
  g\breve g4 c,2.( g'4) a2
  %% Phrase B
  g4( g) g4 % Intonation
    c,\breve c4 g'4 c,2( b4 c4) g'2
  %% Phrase C
  c,\breve c4 g'2 e4 c4 d2( d2) g2
  %% Final
  c,\breve c4 g'4 c,2 g'4 g c,2( g2) a1
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
