\version "2.18.2"
#(set-default-paper-size "letter")


\header {
  title = "St Katherine"
  subtitle = ""
  subsubtitle = ""
  composer = "Obikhod"
  arranger = "Rdr. George"
  copyright = "This arrangement is free to distribute for Liturgical use"
  tagline = ""
}

\bookpart {
    \header {
      subtitle = "Troparion"
    }
    \include "Katherine-Trop_Obikhod-Music.ly"
}

\bookpart {
    \header {
      subtitle = "Kontakion"
    }
    \include "Katherine-Kont_Obikhod-Music.ly"
}