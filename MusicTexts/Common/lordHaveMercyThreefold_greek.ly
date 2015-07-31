\version "2.18.0"

Soprano = \relative f'{fis2  fis2  g4(a)  a2   b2    b4  a    cis4  b  a2     b4(a)  a( g) g(fis2.) }
Alto    = \relative d'{d2    d     e4 fis fis2 g2    g4  fis  a4    g  fis2   g4(fis) fis(e) e(d2.) }
                     
English = \lyricmode  {Lord  have  mer -- cy;  Lord  ha- ve   mer -- _ cy;    Lord   have   mercy   }
Arabic  = \lyricmode  {Ya    rub   bur -- ham, Ya    ru- b    bur -- _ ham,   Ya     rub    burham  }
Greek   = \lyricmode  {Kyrie El -- ei --  son, Ky -- rie E -- le -- i -- son, Kyrie  El --  eison   }

Tenor   = \relative d {d2    d     d      d    g     g4  d    g2       d      g4(d)  d(a)   a(d2.)  }
Bass    = \relative d,{d2    d     d      d    g     g4  d    g2       d      g4(d)  d( << a a') >>
                       << a a,( >> d2.) }

EnglishLyrics = \context Lyrics = MelodyAndIsonEnglish \lyricsto Soprano \English
ArabicLyrics  = \context Lyrics = MelodyAndIsonArabic \lyricsto Soprano \Arabic
GreekLyrics   = \context Lyrics = MelodyAndIsonGreek \lyricsto Soprano \Greek

\score { <<
      %Start of Staff
      \new Staff = "Women"  <<
        \clef treble 
        { \key d \major}
        { \time 4/4 }
        \new Voice = "Soprano" { \voiceOne \Soprano }
        \new Voice = "Alto"    { \voiceTwo \Alto }
    >>
    
    \new Lyrics = melody
    \EnglishLyrics
    \ArabicLyrics
    \GreekLyrics
    
      \new Staff = "Men"  <<
        \clef bass 
        { \key d \major}
        { \time 4/4 }
        \new Voice = "Tenor"  { \voiceOne \Tenor }
        \new Voice = "Bass"   { \voiceTwo \Bass} 
    >>
  >>
}




