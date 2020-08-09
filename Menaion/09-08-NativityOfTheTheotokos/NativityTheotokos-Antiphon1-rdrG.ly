\version "2.18.2"

\header {
  title = "Nativity of the Theotokos"
  subtitle = "Antiphon"
  subsubtitle = "First"
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

refrain = \lyricmode {
  Through the in -- ter -- ces -- sions of the The -- o -- to -- kos, __ O __ Sav -- ior, save __ us.
}
verseOne = \lyricmode {
  % The verses can be broken up further than they are in the Liturgy variable text
  % http://ww1.antiochian.org/sites/default/files/nativity_of_theotokos_series.pdf
  Re -- mem -- ber, O Lord, Da -- vid and all his meek -- ness.
  \refrain
  Lo, we have heard it at Eph -- ra -- tha.
    We have found it in the plains of the wood.
  \refrain
  Glo -- ri -- ous things are spo -- ken of thee,
    O ci -- ty of God.
  \refrain
  God is in the midst of her; she shall not be shak -- en;
    God shall help her right ear -- ly in the morn -- ing.
  \refrain
  Glo -- ry to the \recite "Father and to the Son and to" the Ho -- ly Spir -- it,
    both now and \recite "ever, and unto ages" of ag -- es. A -- men.
  \refrain
}

soprefmost = { g4 g g a b4 b4 b4 b4 a b c2 b4( c) b( a) g2 a2 b1( a) g1 }
sopref = { \soprefmost \bar "||" }
soprano = \relative g' {
  \global
  % Verse 1
  g4 g g a b c2. b4 r4 \bar "|"
  a4 b g a2. g2 \bar "||"
  \sopref % Refrain
  % Verse 2
  g4 g a b a b c2. c4 b2 r4 \bar "|"
  g4 a b b b g a2 a4 a g2. \bar "||"
  \sopref % Refrain
  % Verse 3
  g4 g a b b c2. c4 c b2 r4 \bar "|"
  g4 a2 a4 a g2. \bar "||"
  \sopref \allowPageTurn % Refrain
  % Verse 4
  g4 g g a b b b b b a b c2. b4 r4 \bar "|"
  g4 a b b b b b b g a2. g4 \bar "||" \allowPageTurn
  \sopref % Refrain
  \allowPageTurn % GNE
  g4 g g a b\breve b4 a4 b4 c2. b4 r4 \bar "|"
  g4 g a b\breve g4 a2 a4 a g2 r4 \bar "||"
  \soprefmost \bar "|." % Refrain
}

altrefmost = { g4 g g g g g g g g g g2 g2 g g g2 g1( d) d1 }
altref = { \altrefmost \bar "||" }
alto = \relative g' {
  \global
  % Verse 1
  g4 g g g g g2. g4 r4 \bar "|"
  g4 g g fis2. d2 \bar "||"
  \altref % Refrain
  % Verse 2
  g4 g g g g g g2. g4 g2 r4 \bar "|"
  g4 g g g g g fis2 fis4 fis d2. \bar "||"
  \altref % Refrain
  % Verse 3
  g4 g g g g g2. g4 g g2 r4 \bar "|"
  g4 fis2 fis4 fis d2. \bar "||"
  \altref% Refrain
  % Verse 4
  g4 g g g g g g g g g g g2. g4 r4 \bar "|"
  g4 g g g g g g g g fis2. d4 \bar "||"
  \altref % Refrain
  % GNE
  g4 g g g g\breve g4 g4 g4 g2. g4 r4 \bar "|"
  g4 g g g\breve g4 fis2 fis4 fis d2 r4 \bar "||"
  \altref \bar "|." % Refrain
}

tenrefmost = { b4 c d d d d d d c d e2 d4( e) d( c) b2 c2 d1( c) b1 }
tenref = { \tenrefmost \bar "||" }
tenor = \relative c' {
  \global
  % Verse 1
  b4 c d d d e2. d4 r4 \bar "|"
  d4 d b c2. b2 \bar "||"
  \tenref % Refrain
  % Verse 2
  b4 b c d c d e2. e4 d2 r4 \bar "|"
  b4 c d d d b c2 c4 c b2. \bar "||"
  \tenref % Refrain
  % Verse 3
  b4 b c d d e2. e4 c d2 r4 \bar "|"
  b4 c2 c4 c b2. \bar "||"
  \tenref % Refrain
  % Verse 4
  b4 c d d d d d d d c d e2. d4 r4 \bar "|"
  b4 c d d d d d d b c2. b4 \bar "||"
  \tenref % Refrain
  % GNE
  b4 b b c d\breve d4 c4 d4 e2. d4 r4 \bar "|"
  b4 c d d\breve b4 c2 c4 c b2 r4 \bar "||"
  \tenref \bar "|." % Refrain
}


basrefmost = { g4 g g g g g g g g g c,2 g'2 g g e2 d1( d) g1 }
basref = { \basrefmost \bar "||" }
bass = \relative c {
  \global
  % Verse 1
  g'4 g g g g c,2 e4 g4 r4 \bar "|"
  g4 g g d2. g2 \bar "||"
  \basref % Refrain
  % Verse 2
  g4 g g g g g c,2. e4 g2 r4 \bar "|"
  g4 g g g g g d2 d4 d g2. \bar "||"
  \basref % Refrain
  % Verse 3
  g4 g g g g c,2. c4 e g2 r4 \bar "|"
  g4 d2 d4 d g2. \bar "||"
  \basref % Refrain
  % Verse 4
  g4 g g g g g g g g g g c,2( e4) g4 r4 \bar "|"
  g4 g g g g g g g g d2. g4 \bar "||"
  \basref % Refrain
  % GNE
  g4 g g g g\breve g4 g4 g4 c,2( e4) g4 r4 \bar "|"
  g4 g g g\breve e4 d2 d4 d g2 r4 \bar "||"
  \basref \bar "|." % Refrain
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
