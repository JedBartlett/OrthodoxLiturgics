\version "2.18.2"

global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
}

lyrtxt = \lyricmode {
  Re -- ceive __ the bo -- dy of Christ;
  Taste the foun -- tain of im -- mor -- tal -- i -- ty.

  Al -- le -- lu -- ia!
  Al -- le -- lu -- ia!
  Al -- le -- lu -- ia!
}

soprano = \relative g' {
  \global % Leave these here for key to display
  \repeat volta 3 { \partial 4 a8^\markup{Thrice}( bes) c4. bes8 a4 d8 d c4.( bes8 a4)
                    a8 c bes4 bes8 a g4 f8( g) a4. a8 a4 }
  \partial 4 a8 bes c4.( bes8) a4 \breathe
             d8 d c4.( bes8) a4 \breathe
             a8 c bes4( bes8 a g4 f8 g) a2. \bar"|."
}

alto = \relative g' {
  \global % Leave these here for key to display
  \repeat volta 3 { \partial 4 f8( g) a4. g8 f4 bes8 bes a4.( g8 f4)
                    f8 a g4 g8 f e4 d8( e) f4. f8 f4 }
   \partial 4 f8 g a4.( g8) f4
              bes8 bes a4.( g8) f4
              f8 a g4( g8 f e4 d8 e) f2.
}

tenor = \relative c' {
  \global % Leave these here for key to display
  \repeat volta 3 { \partial 4 c4 c4. c8 c4 f8 f c2.
                    c8 c c4 c8 c c4 c c4. c8 c4 }
   \partial 4 c4 c4. c8 c4
              f8 f c2.
              c8 c c1 c2.
}


bass = \relative c {
  \global % Leave these here for key to display
  \repeat volta 3 { \partial 4 f4 f4. f8 f4 bes,8 d f2.
                    f8 f c4 c8 c c4 c f4. f8 f4 }
   \partial 4 f4 f4. f8 f4 \breathe
              bes,8 d f2. \breathe
              f8 f c1 f2.

}

\score {
  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { S A }
    } <<
      \new Voice = "soprano" { \voiceOne \soprano }
      \new Voice = "alto" { \voiceTwo \alto }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "soprano" \lyrtxt

    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { T B }
    } <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
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
  \midi { \tempo 4 = 100
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
