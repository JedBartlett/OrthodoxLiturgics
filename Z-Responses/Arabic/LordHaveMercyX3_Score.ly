\version "2.18.2"
\header {
  title = "Litany of Fervent Supplication - Arabic"
  subtitle = "Sung during Vespers"
  subsubtitle = "Three languages - English, Arabic, Greek"
}
\markup{\vspace #2 }
LordHaveMercy = \lyricmode {Lord have mer -- cy }

LordHaveMercyOne = \relative { d'4 d d2 d }
                   \addlyrics { \LordHaveMercy }

LordHaveMercyTwo = \relative { d'4 d c2 d }
                   \addlyrics { \LordHaveMercy }


%\markup { \abs-fontsize #20 {+}}

\markup{\smallCaps{Deacon:}\override #'(line-width . 90)
        Let us say with all our soul and with all our mind, let us say:
}


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

\markup{\smallCaps{Deacon:}\override #'(line-width . 90)
        O Lord Almighty, the God of our fathers, we pray Thee, hearken and have mercy.
}

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

\markup{\smallCaps{Deacon:}\override #'(line-width . 90)
        Have mercy on us, O God, according to Thy great mercy, we pray Thee, hearken and have mercy.
}
\include "./LordHaveMercyX3.ly"

