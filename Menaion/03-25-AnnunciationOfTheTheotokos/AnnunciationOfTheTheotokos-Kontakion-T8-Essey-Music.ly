\version "2.18.2"

\defineBarLine "invis" #'("" "" "")
global = {
  \time 9/4 % starts with
  \key c \major
  \set Timing.defaultBarType = "invis" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  To thee, the Cham -- pion Lea -- der,
  do I of -- fer thanks of vic -- to -- ry,
  O The -- o to -- kos,
  thou who hast de -- liv -- ered me form ter -- ror;
  but as thou that hast that pow -- er in -- vin -- ci  -- ble.
  O The -- o to -- kos,
  thou a -- lone can set me free:
  from all forms of dan -- ger free me and de -- liv -- er -- me,
  that I may cry un -- to thee:
  Hail, O Bride with -- out Bri -- de -- groom
}

twobm=  \set Timing.measureLength = #(ly:make-moment 2/4)
threebm=\set Timing.measureLength = #(ly:make-moment 3/4)
fourbm= \set Timing.measureLength = #(ly:make-moment 4/4)
fivebm= \set Timing.measureLength = #(ly:make-moment 5/4)
sixbm=  \set Timing.measureLength = #(ly:make-moment 6/4)
sevenbm=\set Timing.measureLength = #(ly:make-moment 7/4)
ninebm= \set Timing.measureLength = #(ly:make-moment 9/4)

melody = \relative c' { \global
  \ninebm  c4 c c c c f( e) d2 | \breathe
  \sixbm   d4 f e c d e |\sevenbm f2( g4) f e2. \breathe
  \sevenbm c4 c c f( e) d2 | \breathe
  \sixbm   d4 f e c d e | f f g( f) e2 | \breathe
  \sixbm   e4 f g g g g |\fourbm g2 d4 f |\fivebm  e d c2. |
  \sevenbm c4 c c f( e) d2 | \breathe
  \fourbm  d4 f e( c) | d( e) f2 |  g4( f) e2 |
  \twobm   e4 f |\fourbm g g g g | g d e f |\fivebm e d c2. |
  \threebm g'4 g g |\fourbm c2 b4 a | g2
  a4 g | g( f) e d | f( e d2. c b2 a4) b c1
\bar"|."}

ison = \relative c' { \global \tiny
  \parenthesize c s2.
  \parenthesize g1 c\breve s
  g1 \parenthesize c s\breve s s s2
  g1 \parenthesize c s\breve s
  g2 c2.
  \parenthesize g'1 s2.
  \parenthesize c,1 s s2
  \parenthesize g1 s s2
  \parenthesize c1
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
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
  \midi { \tempo 4 = 200
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
