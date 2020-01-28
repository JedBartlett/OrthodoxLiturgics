\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

global = {
  \time 2/4 % Not used, Time_signature_engraver is removed from layout
  \key d \aeolian
}

English = \lyricmode {Lord, have  mer -- cy,  Lord, have mer -- cy,   Lord, have mer -- cy. }
Arabic  = \lyricmode {Ya    rub   bur -- ham, Ya    rub   bur -- ham, Ya    rub   bur -- ham. }
Greek   = \lyricmode {Kyrie El -- ei --  son, Kyrie El -- ei --  son, Kyrie El -- ei --  son. }

EnglishLyrics = \context Lyrics = MelodyAndIsonEnglish \lyricsto melody \English
ArabicLyrics  = \context Lyrics = MelodyAndIsonArabic \lyricsto melody \Arabic
GreekLyrics   = \context Lyrics = MelodyAndIsonGreek \lyricsto melody \Greek


melody = \relative c' {
  \global % Leave these here for key to display
  c4. d8 f4 f4 g4. f8 a4 a8( g) f4. g8 e4( c) d2 \bar "|."
}

ison = \relative c' {
  \global % Leave these here for key to display
  c4. d1  s8 s2 s2 c2 d2 \bar "|."
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
    \new Lyrics = melody \EnglishLyrics \ArabicLyrics \GreekLyrics

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
