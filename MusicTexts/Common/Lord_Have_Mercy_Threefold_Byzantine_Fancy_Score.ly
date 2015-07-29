\version "2.18.2"
\header {
  title = "Litany of Fervent Supplication - Byzantine"
  subtitle = "Fancy version, sung during Vespers"
  subsubtitle = "Three languages, English, Arabic, Greek"
  composer = "+"
}
LordHaveMercy = \lyricmode {Lord have mer -- cy }

LordHaveMercyOne = \relative { d'4 d d2 d }  
                   \addlyrics { \LordHaveMercy }
                   
LordHaveMercyTwo = \relative { d'4 d c2 d }
                   \addlyrics { \LordHaveMercy }


%\markup { \abs-fontsize #20 {+}}

\markup{Deacon: Let us say with all our soul and with all our mind, let us say:}


\score { <<
      %Start of Staff
      \new Staff = "LordHaveMercyOne"  <<
        \clef treble { \key f \major}
         % Cheating with the time signurature here to remove auto measures
        { \once \override Staff.TimeSignature #'stencil = ##f  \time 6/4 }
        \new Voice = "Melody"  { \voiceOne \LordHaveMercyOne } 
    >>
  >>
}

\markup{Deacon: O Lord Almighty, the God of our fathers, we pray Thee, hearken and have mercy.}

\score { <<
      %Start of Staff
      \new Staff = "LordHaveMercyTwo" << 
        \clef treble { \key f \major}
         % Cheating with the time signurature here to remove auto measures
        { \once \override Staff.TimeSignature #'stencil = ##f  \time 6/4 }
        \new Voice = "Melody"  { \voiceOne \LordHaveMercyTwo } 
    >>
  >>
}

\markup{Deacon: Have mercy on us, O God, according to Thy great mercy, we pray Thee, hearken and have mercy.}
\include "./lord_have_mercy_threefold_byzantine_fancy.ly"

