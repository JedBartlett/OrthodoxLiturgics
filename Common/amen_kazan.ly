\version "2.18.0"
Melody = \relative g'
            {g2   g   }
  \addlyrics{A -- men }

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




