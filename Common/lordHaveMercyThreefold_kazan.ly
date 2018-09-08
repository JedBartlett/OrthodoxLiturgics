\version "2.18.0"
Melody = \relative g'
                {r2   g4    g     aes    g    aes   aes   bes    g    aes   g     f2     e   }
English = \lyricmode {Lord  have  mer -- cy;  Lord  have  mer -- cy;  Lord  have  mer -- cy  }
Arabic  = \lyricmode {Ya    rub   bur -- ham, Ya    rub   bur -- ham, Ya    rub   bur -- ham }
Greek   = \lyricmode {Kyrie El -- ei --  son, Kyrie El -- ei --  son, Kyrie El -- ei --  son }

EnglishLyrics = \context Lyrics = MelodyAndIsonEnglish \lyricsto Melody \English
ArabicLyrics  = \context Lyrics = MelodyAndIsonArabic \lyricsto Melody \Arabic
GreekLyrics   = \context Lyrics = MelodyAndIsonGreek \lyricsto Melody \Greek

\score { <<
      %Start of Staff
      \new Staff = "MelodyAndIson"  <<
        \clef treble 
        { \key c \major}
        { \time 4/4 }
        \new Voice = "Melody"  { \voiceOne \Melody }       
    >>
    \new Lyrics = melody
    \EnglishLyrics
    \ArabicLyrics
    \GreekLyrics
  >>
}




