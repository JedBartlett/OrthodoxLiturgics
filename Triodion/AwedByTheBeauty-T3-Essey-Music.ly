\version "2.18.2"

\defineBarLine "i" #'("" "" "")
global = {
  \time 1/4 %no distinguishable regular rhythm
  \key g \major
  \set Timing.defaultBarType = "i" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  Awed by the beau -- ty
  of thy vir -- gin -- i -- ty,
  and the ex -- ceed -- ing ra -- diance
  of thy pu -- ri -- ty,
  Ga -- bri -- el stood a -- mazed
  and cried to thee, O Moth -- er of God:
  'what praise may I of -- fer thee
  that is wor -- thy of thy beau -- ty?
  By what name shall I call thee?
  I am lost and be -- wil -- dered;
  but I shall greet thee as I was com -- mand -- ed:
  Hail, thou that art full of grace'
}

melody = \relative c' { \global
  d4 g a b2( a4 g8 a g4 a) b2
  c4 b a gis8( a b4) gis a2 \breathe
  d,4 g a b2 a4 g8( a g4 a) b2
  c4( b) a gis8( a b4) gis a2 \breathe
  g4 g a g8 a b2
  g4 g g c b a g fis e2. \breathe r4
  g4 d g8 a b2 a4 g8( a g4 a b2)
  a4 b c b a gis8( a) b4( gis) a2. \breathe r4
  b4 a b4( c) d e d8([ c b a]) b2 \breathe
  a4 a a2 e8( fis) g4 fis( e) d2 \breathe r4 r8
  d8 g4 g g g a g fis g a( b) b2 \breathe
  d4.( c16 d b2.) c4 c b8( c b a g2) g4 b a4.( g8 fis4 e8 fis g1)

\bar"|."}

ison = \relative c' { \global \tiny
  d4 \parenthesize g1 s1.
  \parenthesize a1 s1
  d,4 \parenthesize g1 s1.
  \parenthesize a1 s1
  \parenthesize g1 s1 s4
  \parenthesize e1 s s4
  g4 d \parenthesize g1 s1. s4
  \parenthesize a1 s1 s2
  \parenthesize g1 s1.
  a4 a a2 e8( fis) g4 fis( e) d2 s4.
  d4 \parenthesize g1 s8 s\breve s s1
  d1 g1

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
  \midi { \tempo 4 = 120
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
