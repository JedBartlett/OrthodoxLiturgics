\version "2.18.2"
% This was set using the music score in PDF form from:
% http://ww1.antiochian.org/sites/default/files/prokeimenon-saturday-village-rassem.pdf
% Byzantine Chant Tone 6
% Antiochian Village version
% Adapted by Rassem El Massih

global = {
  \time 4/4
  \key c \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

melodyRef = \relative g' {
  \global % Leave these here for key to display
  \partial 4 \parenthesize g4 \bar "|" e4.( f8 g4) g \bar "|" aes2 g4 aes \bar "|" b aes g g \bar "|" g8( aes g4) f e2 \bar "|."
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
  \partial 4 \parenthesize g4 \bar "|" e4.( f8 g4) aes8( b) \bar "|" b2  g4 g \bar "|" b aes g g \bar "|" g8( aes g f) e4 \parenthesize f2( \bar "|" g4 aes2 \parenthesize g1) \bar "|."
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