\version "2.18.2"
#(set-default-paper-size "letter")

\header {
  title = "Cherubic Hymn"
  subtitle = ""
  subsubtitle = ""
  piece = ""
  composer = "Gallatin"
  arranger = ""
  copyright = "This arrangement is free to distribute for Liturgical use"
  tagline = ""
}

\markup{Tone 3 }
\include "CherubicHymn_Gallatin-TwoPart-Music.ly"

\markup{Harmonized Verse }
\include "CherubicHymn_Gallatin-Harmonized-Music.ly"

\markuplist{\wordwrap-lines{Deacon: All of you, the Lord God remember in His kingdom;
  always, now and ever, and unto ages of ages.}}

\include "../../Z-Responses/Obikhod/Amen.ly"

\markuplist{\wordwrap-lines{Priest: Our (Metropolitan or Archbishop or Bishop,) N.,
  and all our brotherhood in Christ, the Lord God remember in His Kingdom,
  always, now and ever, and unto ages of ages.}}
\include "../../Z-Responses/Obikhod/Amen.ly"

\markuplist{\wordwrap-lines{Priest: Our president, civil authorities and armed forces,
  the Lord God remember in his kingdom, always, now and ever, and unto ages of ages.}}
\include "../../Z-Responses/Obikhod/Amen.ly"

\markuplist{\wordwrap-lines{Priest: The Orthodox servant(s) of God, NN., that he(she, they) may have mercy,
  life, peace, salvation and visitation, pardon and forgiveness of sins,
  the Lord God remember in His kingdom, always, now and ever and unto ages of ages.}}
\include "../../Z-Responses/Obikhod/Amen.ly"

\markuplist{\wordwrap-lines{Priest: The Orthodox servant(s) of God departed this life in the hope of the
  resurrection and life eternal, NN., the Lord God remember in His kingdom,
  always, now and ever, and unto ages of ages.}}
\include "ThatWeMayReceive_Gallatin-Harmonized-Music.ly"
