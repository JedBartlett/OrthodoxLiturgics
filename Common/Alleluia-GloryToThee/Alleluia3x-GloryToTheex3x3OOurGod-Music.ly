\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1


global = {
  \time 2/4 % Not used, Time_signature_engraver is removed from layout
  \key d \aeolian
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  % Note that inserted text in the melody will go ABOVE the lyrics
  Glo -- ry \recite ""

  a -- ges, A -- men

  Al -- le -- lu -- i -- a,
  Al -- le -- lu -- i -- a,
  Al -- le -- lu -- i -- a,

  Glo -- ry to Thee, O God.
  Glo -- ry to Thee, O God. % Second time for second variant of the repeat.

  O our God and our Hope,
  glo -- ry to Thee!
}

melody = \relative c' {
  \global % Leave these here for key to display
  \textLengthOn
  % Note that inserted text here ABOVE the lyrics noted above
  c4 d d\breve_\markup{\column{
    \line{to the Father, and to the Son,}
    \line {and to the Holy Spirit;}
    \line{both now and ever, and unto ages of}
  }}\bar "|"
  % Ages Amen
  f4( g) \bar "|" e c \bar "|" d2 \bar ".|:" \break

  % Aleluia 3 times
  \repeat volta 3 { c4 d f e d \bar "|"
                    d e f g g \bar "|"
                    f g a g f \bar "|"}
     \alternative {% Glory to Thee, O God - Same 1st 2 times, different last time
          { e f g f2 e4 d2 \bar ":|." }
          { e4 f g f2 e4 d2 \bar "|" }
     }

  % O Our God and our Hope,
  d4 e f( g) a g f2 \bar "|"

  % Glory to Thee
  e4( c) f e d2 \bar "|."
}

ison = \relative c' {
  \global % Leave these here for key to display
  c4 d s\breve \bar "|"
  % Ages Amen
  d2 \bar "|" c4 c4 \bar "|" d2 \bar ".|:"

  % Aleluia 3 times
  \repeat volta 3 { c4 d d\breve \bar "|"
                    s1 s4 \bar "|" }
     \alternative {% Glory to Thee, O God - Same 1st 2 times, different last time
          { s1 s1  \bar ":|." }
          { c1 s4 s4 d2 \bar "|" }
     }

  % O Our God and our Hope,
  d4 d1 s4 s2 \bar "|"

  % Glory to Thee
  c1 d2 \bar "|."
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
  \midi { \tempo 4 = 300
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
