\version "2.18.2"

threebm= \set Timing.measureLength = #(ly:make-moment 5/4)
fivebm= \set Timing.measureLength = #(ly:make-moment 5/4)
sevenbm= \set Timing.measureLength = #(ly:make-moment 7/4)
ninebm= \set Timing.measureLength = #(ly:make-moment 9/4)

global = {
  \time 5/4 % Starts with
  \key c \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  As by bap -- tis -- m we were bur -- ied with Thee, O Christ our God,
  so by Thy Res -- ur -- rec -- tion we were deemed wor -- thy of im -- mor -- tal life;
  and prais -- ing Thee, we cry:
  Ho -- san -- na in the high -- est;
  bless -- ed is He that com -- eth in the
    Name of the Lord
    Name of the Lord
}

melody = \relative g' { \global % Leave these here for key to display
  \repeat volta 3 { \partial 2 e4^"Thrice" f | g g g f g aes aes aes aes g b( aes) g g2 |
    aes4 b b aes g | aes g e f g |\ninebm aes aes g f g( \acciaccatura {aes8} g4) f e2 |
    \sevenbm e4 e d e f g2 |
    \fivebm aes4 b b aes g |\threebm aes g2 |
    \fivebm aes4 g f g aes b aes g g
  }
  \alternative {
          { aes4 g f f( e2.) \bar ":|." }
          { aes4 g8( f) e4 f4.( g8 aes4~ \acciaccatura{b8} aes4 g2.) \bar "|." }
  }
}

ison = \relative c' { \global \tiny
  \repeat volta 3 {  e4 f \parenthesize g1 s s s s s2
    e4 f g \parenthesize e1 s s2.
    d4 e f \parenthesize g1 s s s s2.
  }
  \alternative {
    {e2. f4 e2.}
    {aes4 g8( f) e4 f1 g2.}
  }
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
      % Setting the accidentalStyle to modern-voice-cautionary results in
      % explicitly printing the cancellation of sharps/flats, even if
      % a bar-line passes.  It prints these cancellations in brackets.
      \accidentalStyle StaffGroup.modern-voice-cautionary
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { M I }
    } <<
      \new Voice = "melody" { \voiceOne \melody }
      \new Voice = "ison" { \voiceTwo \ison }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "melody" \lyricText

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
  \midi { \tempo 4 = 150
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
