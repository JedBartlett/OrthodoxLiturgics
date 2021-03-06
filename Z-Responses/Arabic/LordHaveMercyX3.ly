\version "2.18.0"
Melody = {
         f'4( e' d') d'
         g' a' a'2
         a'8( bes' a' g') a'( g') f'4
         g'8( a') g'4 a'2
         g'4( f' e') f'
         g'( a') d'2 
}
Ison = {
         f'4( e' d') d'
         d'1
         d'1
         d'1
         c'1
         c'2 d'
}

% Lyrics in 3 languages
English = \lyricmode { 
Lord, have mer _ -- cy; Lord have _ mer -- _ cy; Lord, have mer -- cy 
}
Arabic = \lyricmode { 
Ya rub bur -- _ ham, Ya rub _ bur -- _ ham, Ya rub bur -- ham 
}
Greek = \lyricmode { 
Kyri-e El -- e -- i -- son,  Kyri -- e E -- le -- i -- son,  Kyri-e El -- e-i- son 
}


EnglishLyrics = \context Lyrics = MelodyAndIsonEnglish \lyricsto Melody \English
ArabicLyrics  = \context Lyrics = MelodyAndIsonArabic \lyricsto Melody \Arabic
GreekLyrics   = \context Lyrics = MelodyAndIsonGreek \lyricsto Melody \Greek

\score { <<
      %Start of Staff
      \new Staff = "MelodyAndIson"  <<
        \clef treble 
        { \key f \major}
        { \time 4/4 }
        \new Voice = "Melody"  { \voiceOne \Melody } 
        \new Voice = "Ison"    { \voiceTwo \Ison }         
    >>
    \new Lyrics = melody
    \EnglishLyrics
    \ArabicLyrics
    \GreekLyrics
  >>
}




