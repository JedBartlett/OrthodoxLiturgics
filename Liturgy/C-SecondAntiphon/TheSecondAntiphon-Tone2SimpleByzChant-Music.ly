\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

\defineBarLine "invisible" #'("" "" "")
global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key c \major
  \set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  Save us, O Son of God, Who art ri -- sen from the dead,
    who sing __ to Thee,
    Al -- le -- lu __ i --  a.
  Glo -- ry \recite"to the Father and to the Son and to the" Ho -- ly Spi -- rit.
  \recite"Both now and ever, and unto ages" of a -- ges. A -- men.
  Save us, O Son of God, Who art ri -- sen from the dead,
    who sing __ to Thee,
    Al -- le -- lu __ i --  a.
}

melody = \relative c'' {
  \global % Leave these here for key to display
  \repeat volta 2 { b4( c) b aes b aes g2 b4 aes g f e8( f e4) f g2 \bar "|"
                    g4 c8( b c d) b4 b2 \bar "|"
                    aes4 g g8( aes b4) aes g2 \bar "|"}
     \alternative {
          { g4 g g\breve  g4 g g2 g2 \bar ":|." }
          { g\breve  g4 g2 g4 g g \bar "|" }
     }
  b4( c) b aes b aes g2 b4 aes g f e8( f e4) f g2 \bar"|"
  g4 c8( b c d) b4 b2 \bar"|"
  aes4 g g8( aes b4) aes g2 \bar "|."
}

ison = \relative c' {
  \global % Leave these here for key to display
  \repeat volta 2 { c\breve s1. s1 s2 g'4 g2 c,1 s2.}
     \alternative {
          { c\breve s\breve  \bar ":|." }
          { c\breve  s1. \bar "||" }
     }
  c\breve s1. s1 s2 g'4 g2 c,1 s2. \bar "|."

}

\score {
  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { M I }
    } <<
      \new Voice = "melody" { \voiceOne \melody }
      \new Voice = "ison" { \voiceTwo \ison }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "melody" \lyricText

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
