\version "2.18.2"

\header {
  title = "Nativity of the Theotokos"
  subtitle = "Antiphon"
  subsubtitle = "Second"
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
  Save us, O Son of God, __
    Who art won -- drous in the Saints;
    who sing to Thee. __ Al -- le -- lu -- ia.
}
verseOne = \lyricmode {
  The Lord hath sworn in truth un -- to Da -- vid;
    and He will not an -- nul it.
    Of the fruit of thy loins
    will I set up -- on thy throne.
  \refrain
  There will I make to spring forth a horn for Da -- vid.
    I have pre -- pared a lamp for my Christ.
  \refrain
  For the Lord hath e -- lect -- ed Zion; __
    He hath cho -- sen her to be a hab -- i -- ta -- tion for Him -- self.
  \refrain
}

sopref = {
  b2 b4 b a b c2( b2) r4 \bar "|" \allowPageTurn
  b4 g a2 a4 a a g2( a4) b4 c2. c4 b4( c b a) g2 a2 b1( a) g \bar "||" \allowPageTurn
}
soprano = \relative g' {
  \global
  % Verse 1
  g4 g a b b b a b c2. b4 r4 \bar "|"
  g4 b b b g a2 g2 r4 \bar "|"
  g4 a b( a) b c2 b2 r4 \bar "|"
  g4 a b g a2 a2 g2 r4 \bar "||" \allowPageTurn
  \sopref % Refrain
  % Verse 2
  g4 g a b b b b b a b c2 b2 r4 \bar "|"
  g4 g a b g a2 a4 a4 g2 r4 \bar "||" \allowPageTurn
  \sopref % Refrain
  % Verse 3
  g4 a b b b a b c2( b2) r4 \bar "|"
  g4 a b b b b b b b g a2 a4 a a g2 r4 \bar "||" \allowPageTurn
  \sopref % Refrain
}


altref = {
  g2 g4 g g g g2( g2) r4 \bar "|"
  g4 g fis2 fis4 fis fis d2( fis4) g4 g2. g4 g4( g g g) g2 g2 g1( d) d \bar "||"
}
alto = \relative g' {
  \global
  % Verse 1
  g4 g g g g g g g g2. g4 r4 \bar "|"
  g4 g g g g fis2 d2 r4 \bar "|"
  g4 g g( g) g g2 g2 r4 \bar "|"
  g4 g g g g2 fis2 d2 r4 \bar "||"
  \altref % Refrain
  % Verse 2
  g4 g g g g g g g g g g2 g2 r4 \bar "|"
  g4 g g g g fis2 fis4 fis4 d2 r4 \bar "||"
  \altref % Refrain
  % Verse 3
  g4 g g g g g g g2( g2) r4 \bar "|"
  g4 g g g g g g g g g fis2 fis4 fis fis d2 r4 \bar "||"
  \altref % Refrain
}

tenref = {
  d2 d4 d d b c2( b2) r4 \bar "|"
  d4 d c2 c4 c c b2. d4 e2. e4 d4( e d c) b2 c2 d1( c) b \bar "||"
}
tenor = \relative a {
  \global
  % Verse 1
  b4 b c d d d d d e2. d4 r4 \bar "|"
  b4 d d d b c2 b2 r4 \bar "|"
  b4 c d2 d4 e2 d2 r4 \bar "|"
  b4 c d b c2 c2 b2 r4 \bar "||"
  \tenref % Refrain
  % Verse 2
  b4 b c d d d d d d d e2 d2 r4 \bar "|"
  b4 b c d b c2 c4 c4 b2 r4 \bar "||"
  \tenref % Refrain
  % Verse 3
  b4 c d d d d d e2( d2) r4 \bar "|"
  d4 d d d d d d d d b c2 c4 c c b2 r4 \bar "||"
  \tenref % Refrain
}


basref = {
  g2 g4 g g g c,4( e4 g2) r4 \bar "|"
  g4 g d2 d4 d d4 g2( e4) d4 c2. e4 g1 g2 e2 d1( d) g \bar "||"
}
bass = \relative g {
  \global
  % Verse 1
  g4 g g g g g g g c,2( e4) g4 r4 \bar "|"
  g4 g g g g d2 g2 r4 \bar "|"
  g4 g g2 g4 c,4( e) g2 r4 \bar "|"
  g4 g g g d2 d2 g2 r4 \bar "||"
  \basref% Refrain
  % Verse 2
  g4 g g g g g g g g g c,( e) g2 r4 \bar "|"
  g4 g g g e4 d2 d4 d4 g2 r4 \bar "||"
  \basref % Refrain
  % Verse 3
  g4 g g g g g g c,( e4 g2) r4 \bar "|"
  g4 g g g g g g g g e d2 d4 d d g2 r4 \bar "||"
  \basref % Refrain

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
