\version "2.18.2"
% This was set using the music score in PDF form from:
% http://ww1.antiochian.org/sites/default/files/prokeimenon-saturday-village-rassem.pdf
% Byzantine Chant Tone 6
% Antiochian Village version
% Adapted by Rassem El Massih
global = {
  \time 4/4
  \key c \major
}

melodyRef = \relative g' {
  \global % Leave these here for key to display
  r2. \parenthesize g4 e4.( f8 g4) g aes2 g4 aes b aes g g g8( aes g4) f e2
}
\addlyrics{The Lord __ is King, and hath clothed Him -- self with maj -- es -- ty}


\score {
    \new Staff = MelodyAndIson <<
      \clef treble
      \new Voice = "melodyRef" { \voiceOne \melodyRef }
  >>
  \layout {
    \context {
      \Staff
      \remove "Time_signature_engraver"
    }
    \context {
      \Score
      \omit BarNumber
    }
  }
}

\markup{\smallCaps{Verse:} \italic{The Lord is robed; He is girded with strength.}  \tiny{\bold{Repeat Above}}}
\markup{\smallCaps{Verse:} \italic{For He has established the world so that it shall never be moved. }  \tiny{\bold{Final Below}}}

melodyFinal = \relative g' {
  \global % Leave these here for key to display
  r2. \parenthesize g4 e4.( f8 g4) aes8( b) b2 g4 g b aes g g g8( aes g f) e4 \parenthesize f2( g4 aes2 f1)
}
\addlyrics{The Lord __ is King, and hath clothed Him -- self with maj -- es -- ty __}


\score {
    \new Staff = MelodyAndIsonFinal <<
      \clef treble
      \new Voice = "melodyFinal" { \voiceOne \melodyFinal }
  >>
  \layout {
    \context {
      \Staff
      \remove "Time_signature_engraver"
    }
    \context {
      \Score
      \omit BarNumber
    }
  }
}