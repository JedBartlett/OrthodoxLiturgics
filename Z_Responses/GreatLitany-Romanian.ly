\version "2.18.2"

\header {
  title = "The Great Litany"
  composer = "Romanian"
  copyright = "This arrangement is free to distribute for Liturgical use"
  tagline = "Adapted from https://oca.org/liturgics/music-downloads/divine-liturgy"
}

#(set-default-paper-size "letter")

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
%recite = \once \override LyricText.self-alignment-X = #-1

%\defineBarLine "invisible" #'("" "" "")
global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
  %\set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
}

verseOne = \lyricmode {
  A -- men
  Lord, have mer -- cy
  Lord, have mer -- cy
  Lord, have mer -- cy
  Lord, have mer -- cy
  Lord, have mer -- cy
  To Thee O Lord
  A -- men
}

soprano = \relative g' {
  \global
  a4 a2.
  \repeat volta 3 {
    \mark "1"
    a2( g4) f g( a) f2 \bar "||"
    \mark "2"
    a2( g4) a bes( c) a2 \bar "||"
    \mark "3"
    c4( a bes) c d2 c \bar "||"
    \mark "4"
    d4( c bes) a bes( c) a2
  }
  \once \override Score.RehearsalMark.self-alignment-X = #LEFT
  \mark "5 - Help us, save us.."
  c2( g4) a bes( g) f2 \bar "||"
  % To Thee O Lord, uses anacrusis / pickup bar
  \partial 4 c'4 g( a bes) g f2.\bar "||"
  % Amen
  a4 a2. \bar "|."
}

alto = \relative g' {
  \global
  f4 f2.
  f2. f4 e2 c2
  f2. f4 f2 f2
  a4( f g) a f2 a
  f2( g4) a g2 f
  % Help us save us
  f2. f4 f e c2
  % To Thee O Lord
  f4 g( f g) e c2.
  % Amen
  f4 f2.
}

tenor = \relative c' {
  \global
  c4 c2.
  c2( bes4) a c2 a2
  c2( bes4) c d2 c2
  c2. c4 bes2 c
  d2. d4 d( c) c2
  % Help us save us
  a2( bes4) c d( c) a2
  % To Thee O Lord
  a4 d2. c4 a2.
  % Amen
  c4 c2.
}

bass = \relative c {
  \global
  f4 f2.
  f2. f4 c2 f2
  f2. f4 bes2 f2
  f2. f4 bes2 f2
  bes4( a g) f e2 f
  % Help us save us
  f2( d4) c4 bes( c) f2
  % To Thee O Lord
  f4 bes4( a g) <c c,> f,2.
  % Amen
  f4 f2.
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
  \midi { \tempo 4 = 180
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
