\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1


global = {
  \time 6/4 % Not used, Time_signature_engraver is removed from layout
  \key d \minor
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyricText = \lyricmode         { Glory to the Fa -- ther  and to the Son and to the Ho -- ly  Spir -- it }
melody = \relative g' { \global  e4   e   e   e8( f g4) g g   f  g   a   g   g  g   g8( f) e4 f8( g f4) e2  \bar "|." }
ison   = \relative c' { \global  \parenthesize e\breve                    s1. s4              <d f>2   e2 }

\score {
  \new ChoirStaff <<
    \new Staff \with {
      \accidentalStyle StaffGroup.modern-voice-cautionary
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
