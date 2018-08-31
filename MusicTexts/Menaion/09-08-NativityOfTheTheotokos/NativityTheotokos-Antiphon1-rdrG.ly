\version "2.18.2"

\header {
  title = "Nativity of The Theotokos"
  subtitle = "Antiphon"
  subsubtitle = "First"
  copyright = "This arrangement is free to distrubute for Liturgical use"
  tagline = "Arranged using https://oca.org/liturgics/learning-the-tones"
}

#(set-default-paper-size "letter")

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

\defineBarLine "invisible" #'("" "" "")
global = {
  \time 1/1 % Not used, Time_signature_engraver is removed from layout
  \key g \major
  \set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
}

refrain = \lyricmode {
  Through the in -- ter -- cessions of the The -- o -- to -- kos, O Sav -- ior, save us
}
verseOne = \lyricmode {
  % The verses can be broken up further than they are in the Liturgy variable text
  % http://ww1.antiochian.org/sites/default/files/nativity_of_theotokos_series.pdf
  Re -- mem -- ber, O Lord, Dav -- id and all his meek -- ness.
  \refrain
  Lo, we have heard it at Eph -- ra -- tha.
    We have found it in the plains of the wood.
  \refrain
  Glo-- ri -- ous things are spo -- ken of thee,
    O ci -- ty of God.
  \refrain
  God is in the midst of her; she shall not be sha -- ken;
    God shall help her right ear -- ly in the morn -- ing.
  \refrain
  Glo -- ry to the \recite "Father and to the Son and to" the Ho -- ly Spi -- rit,
    both now and \recite "ever, and unto ages" of a -- ges. A -- men.
  \refrain
}

soprefmost = { g g g a b2 b4 b4 a b c2 b4( c) b( a) g2 a2 b1( a) g1 }
sopref = { \soprefmost \bar "||" }
soprano = \relative g' {
  \global
  % Verse 1
  g4 g g a b c2. b4 r4 \bar "|"
  a4 b g a2. g2 \bar "||"
  \sopref % Refrain
  % Verse 2
  g4 g a b a b c2. c4 b2 r4 \bar "|"
  g a b b b g a2 a4 a g2. r4 \bar "||"
  \sopref % Refrain
  % Verse 3
  g g a b b c2. c4 c b2 r4 \bar "|"
  g a2 a4 a g2. r4 \bar "||"
  \sopref % Refrain
  % Verse 4
  g g g a b b b b b a b c2. b4 r4 \bar "|"
  g a b b b b b b g a2. g4 r4 \bar "||"
  \sopref % Refrain
  % GNE
  g g g a b\breve b4 a2 b2 c2. b4 r4 \bar "|"
  g g a b\breve g2 a2. a4 a g2 r4 \bar "||"
  \soprefmost \bar "|." % Refrain
}

alto = \relative c' {
  \global

}

tenor = \relative a {
  \global

}

bass = \relative c {
  \global

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
