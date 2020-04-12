\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm=\set Timing.measureLength = #(ly:make-moment 6/4)

global = {
  \time 4/4 % Starts with
  \key f \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  In con -- firm -- ing the com -- mon Res -- ur -- rec -- tion, O Christ God,
  Thou didst raise up Laz -- a -- rus from the dead be -- fore Thy Pas -- sion.
  Where -- fore, we al -- so, like the chil -- dren,
  bear -- ing the sym -- bols of vic -- to -- ry, cry to Thee
  the van -- quish -- er of death:
  Ho -- san -- na in the high -- est;
  bless -- ed is He that com -- eth in the Name of the Lord.
      Lord. __
}

melody = \relative g' { \global % Leave these here for key to display
  \repeat volta 3 { d4^"Thrice" d g f g a g g f g f e f( g) g2 \bar "|"
    f4 g a a bes a g2 f4 e g f e d e8( f e4) d2 \bar "|"
    g4 f g a g f e f( g) g2 \bar "|"
    g4( a) a bes c8( d c4) bes a bes a g2 \bar "|" a4 g f
    e4 g g f e d2.
    d4 g f e f f( g) g2
    a4 g f g g a g f e g( f) e d
    }
    \alternative {
      {d2.}
      {d4( c2 d4 ees~ \acciaccatura {f8} ees4 d2.)  }
    } \bar"|."
}

ison = \relative c' { \global \tiny
  \repeat volta 3 { d\breve s s s s s s4
    g\breve d\breve s s s s1
  }
  \alternative {
    {}
    {d4 c2 d4 c2 d2.}
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
  \midi { \tempo 4 =150
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
