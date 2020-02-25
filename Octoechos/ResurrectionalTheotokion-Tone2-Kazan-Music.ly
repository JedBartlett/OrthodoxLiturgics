\version "2.18.2"

threebm=\set Timing.measureLength = #(ly:make-moment 3/4)
fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
fivebm=\set Timing.measureLength = #(ly:make-moment 5/4)
sixbm=\set Timing.measureLength = #(ly:make-moment 6/4)
sevenbm=\set Timing.measureLength = #(ly:make-moment 7/4)

global = {
  \time 4/4 % Starts with
  \key c \major
}

lyricText = \lyricmode {
  Ex -- ceed -- ing glo -- ri -- ous be -- yond the pow'r of thought
  are Thy mys -- t'ries, O The -- o -- to -- kos.
  For be -- ing sealed in pu -- ri -- ty and pre -- served in vir -- gin -- i -- ty,
  Thou wast ac -- knowl -- edged to be in ver -- y truth,
  the moth -- er who didst bring forth the true God.
  Where -- fore en -- treat Him
  to save our souls. __
}

melody = \relative g' { \global \partial 2.
  g4 g g aes g g aes b aes aes g g2
  g4 aes b( aes) g g g aes g( f) \sixbm e2.
  e4 f g \threebm aes( g) f \fivebm e8( f g4) g g2
  f4 g aes g f e8( f g4) g g2
  \fourbm aes4( b) b aes \sixbm b4( c) b b b aes b aes g2.
  g4 \fourbm b( aes) g f
  g aes aes g g( f) e2
  \sixbm r4 aes g aes b( aes) g2.
  g4 g8( f) e4 f2.( g4 aes2 \fourbm g1) \bar"|."
}

ison = \relative g' { \global \tiny
  g\breve s2.
  s\breve g4 aes g f e2.
  e4 f g aes g f e8 f g4 g g2 f4 g aes g f e8 f g4 g g2
  g\breve s2 \parenthesize g1
  s2 s2. f4 g aes aes g g f e2
  s4 aes g aes g2 g2.
  g4 g8 f e4 f1. g1
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
