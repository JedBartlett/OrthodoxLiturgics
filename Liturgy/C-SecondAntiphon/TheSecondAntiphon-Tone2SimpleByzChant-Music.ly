\version "2.18.2"

twobm=\set Timing.measureLength = #(ly:make-moment 2/4)
fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
fivebm=\set Timing.measureLength = #(ly:make-moment 5/4)
sixbm=\set Timing.measureLength = #(ly:make-moment 6/4)
sevenbm=\set Timing.measureLength = #(ly:make-moment 7/4)
ninebm=\set Timing.measureLength = #(ly:make-moment 9/4)
tenbm=\set Timing.measureLength = #(ly:make-moment 10/4)

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

\defineBarLine "" #'("" "" "")
global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key c \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

AleluiaText=\lyricmode{ Al -- le -- lu __ i -- a. }
AlleluiaMelody={\sevenbm aes4 g g8( aes b4) aes g2 }
AlleluiaBass={ \fixed c' { c1 s2. }}

lyricText = \lyricmode {
  Save us, O Son of God, Who art ri -- sen from the dead,
    who sing __ to Thee,
  \AleluiaText
  \AleluiaText Glo -- ry \recite"" Ho -- ly Spi -- rit.
  \AleluiaText \recite"" of a -- ges. A -- men.

}

melody = \relative c'' { \global \partial 4 \textLengthOn
  \repeat volta 3 { \bar ".|:" b4( c) b aes b aes g2 b4 aes g f e8( f e4) f g2 \bar "|"
                    \fourbm g4 c8[( b c d)] b4 |\twobm b2 \bar "|"
                  }
  \alternative {
      { \AlleluiaMelody | }
      { \AlleluiaMelody |\tenbm g4 g g\breve_\markup{\column{ \line{to the Father and to}
                                                         \line{the Son and to the}}} |\sixbm g4 g g2 g2 \bar ":|."}
      { \AlleluiaMelody |\ninebm g\breve_\markup{\column{ \line{Both now and}
                                                   \line{ever, and unto ages}}}  g4 |\fivebm g2 g4 g g \bar "|."}
  }
}

ison = \relative c' {
  \global % Leave these here for key to display
  \repeat volta 3 { c\breve s1. s1 s2 g'4 g2 }
  \alternative {
      { \AlleluiaBass }
      { \AlleluiaBass c,\breve s\breve}
      { \AlleluiaBass c\breve  s1.}
  }
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
