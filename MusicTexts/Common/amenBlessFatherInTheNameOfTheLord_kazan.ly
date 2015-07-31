\version "2.18.0"
Melody = \relative g'
            {g2   g2   g8 aes4.    g2    bes4 g   aes2 g4 f   e2    }
  \addlyrics{A -- men. Bless Fa -- ther, in   the name of the Lord. }

\score { <<
      %Start of Staff
      \new Staff = "MelodyAndIson"  <<
        \clef treble 
        { \key c \major}
        { \time 4/4 }
        \new Voice = "Melody"  { \voiceOne \Melody }       
    >>
  >>
}




