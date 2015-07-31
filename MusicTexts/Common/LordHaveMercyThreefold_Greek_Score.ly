\version "2.18.2"
\header {
  title = "Litany of Fervent Supplication - Greek"
  subtitle = "Sung during Liturgy"
  subsubtitle = "Three languages - English, Arabic, Greek"
}
\markup{\vspace #2 }
LordHaveMercy = \lyricmode {Lord have mer -- cy }

LordHaveMercyOneSoprano = \relative f'  { f4. g8 a4( g)   f2 }  
LordHaveMercyOneAlto    = \relative c'  { c4. e8 f4( e)   c2 } 
LordHaveMercyOneTenor   = \relative c'  { a4. c8 c4( bes) a2 } 
LordHaveMercyOneBass    = \relative c   { f4. c8 f4( c) <<f2 f,>> } 
                   
LordHaveMercyTwoSoprano = \relative c'' { c4. bes8 a4( g)   f2  }
LordHaveMercyTwoAlto    = \relative g'  { f4. e8   f4( e)   c2  }
LordHaveMercyTwoTenor   = \relative c'  { a4. c8   c4( bes) a2  }
LordHaveMercyTwoBass    = \relative f   { f4. c8   f4( c)   f2  }

LordHaveMercyOneLyrics = \context Lyrics = LordHaveMercy \lyricsto SopranoOne \LordHaveMercy
LordHaveMercyTwoLyrics = \context Lyrics = LordHaveMercy \lyricsto SopranoTwo \LordHaveMercy

\markup{\smallCaps{Deacon:}\override #'(line-width . 90)
        Let us say with all our soul and with all our mind, let us say:
}


\score { <<
      %Start of Treble
      \new Staff = "LordHaveMercyOneWomen"  <<
        \clef treble { \key f \major}
         % Cheating with the time signurature here to remove auto measures
        { \once \override Staff.TimeSignature #'stencil = ##f  \time 6/4 }
        \new Voice = "SopranoOne"  { \voiceOne \LordHaveMercyOneSoprano } 
        \new Voice = "AltoOne"     { \voiceTwo \LordHaveMercyOneAlto } 
    >>
      \new Lyrics = Lyrics \LordHaveMercyOneLyrics
      %Start of Bass
      \new Staff = "LordHaveMercyOneMen"  <<
        \clef bass { \key f \major}
         % Cheating with the time signurature here to remove auto measures
        { \once \override Staff.TimeSignature #'stencil = ##f  \time 6/4 }
        \new Voice = "TenorOne"  { \voiceOne \LordHaveMercyOneTenor } 
        \new Voice = "BassOne"   { \voiceTwo \LordHaveMercyOneBass } 
    >>
  >>
}

\markup{\smallCaps{Deacon:}\override #'(line-width . 90)
        O Lord Almighty, the God of our fathers, we pray Thee, hearken and have mercy.
}

\score { <<
      %Start of Treble
      \new Staff = "LordHaveMercyTwo" << 
        \clef treble { \key f \major}
         % Cheating with the time signurature here to remove auto measures
        { \once \override Staff.TimeSignature #'stencil = ##f  \time 6/4 }
        \new Voice = "SopranoTwo"  { \voiceOne \LordHaveMercyTwoSoprano } 
        \new Voice = "MelodyTwo"  { \voiceTwo \LordHaveMercyTwoSoprano } 
      \new Lyrics = Lyrics \LordHaveMercyTwoLyrics
      %Start of Bass
      \new Staff = "LordHaveMercyOneMen"  <<
        \clef bass { \key f \major}
         % Cheating with the time signurature here to remove auto measures
        { \once \override Staff.TimeSignature #'stencil = ##f  \time 6/4 }
        \new Voice = "TenorTwo"  { \voiceOne \LordHaveMercyTwoTenor } 
        \new Voice = "BassTwo"   { \voiceTwo \LordHaveMercyTwoBass } 
    >>
    >>
  >>
}

\markup{\smallCaps{Deacon:}\override #'(line-width . 90)
        Have mercy on us, O God, according to Thy great mercy, we pray Thee, hearken and have mercy.
}
\include "./lordHaveMercyThreefold_greek.ly"

