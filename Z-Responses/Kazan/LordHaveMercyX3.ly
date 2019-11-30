\version "2.18.0"
English = \lyricmode {Lord  have  mer -- cy;  Lord  have  mer -- cy;  Lord  have  mer -- cy  }
Arabic  = \lyricmode {Ya    rub   bur -- ham, Ya    rub   bur -- ham, Ya    rub   bur -- ham }
Greek   = \lyricmode {Kyrie El -- ei --  son, Kyrie El -- ei --  son, Kyrie El -- ei --  son }

EnglishLyrics = \context Lyrics = MelodyAndIsonEnglish \lyricsto melody \English
ArabicLyrics  = \context Lyrics = MelodyAndIsonArabic \lyricsto melody \Arabic
GreekLyrics   = \context Lyrics = MelodyAndIsonGreek \lyricsto melody \Greek

melody = \relative g'
                {r2   g4    g     aes    g    aes   aes   bes    g    aes   g     f2     e   }
ison = \relative c' {s2 c\breve}

\score { <<
      %Start of Staff
      \new Staff = "MelodyAndIson"  <<
        \clef treble
        { \key c \major}
        { \time 4/4 }
        \new Voice = "melody"  { \voiceOne \melody }
        \new Voice = "ison"  { \voiceOne \ison }
    >>
    \new Lyrics = melody
    \EnglishLyrics
    \ArabicLyrics
    \GreekLyrics
  >>
}




