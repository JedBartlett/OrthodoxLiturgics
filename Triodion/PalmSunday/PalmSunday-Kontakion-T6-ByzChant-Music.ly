\version "2.18.2"

fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)
sevenbm=\set Timing.measureLength = #(ly:make-moment 7/4)
eightbm= \set Timing.measureLength = #(ly:make-moment 8/4)
ninebm= \set Timing.measureLength = #(ly:make-moment 9/4)

global = {
  \time 6/4 % Starts with
  \key c \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  Be -- ing borne up -- on a throne in Heav -- en,
  and up -- on a colt on the earth,
  O christ God,
  Thou didst ac -- cept the praise of the an -- gels
  and the laud -- a -- tion of the chil -- dren as they cried to Thee:
  Bless -- ed art Thou Who com -- est to re -- call Ad -- am. __
}

melody = \relative g' { \global % Leave these here for key to display
  \partial 2 e4 e | aes g g f e dis |\fourbm e8( f g4) g2 \bar "|"
  f4 f g aes |\ninebm b aes g g4.( f8) e4 f e2 \bar "|"
  \fourbm r4 f4 e e | e4.( f8 g4) g |\sevenbm aes aes g b( aes8 g) g2 \bar "|"
  \ninebm f4 g aes b aes g g aes g |\sixbm f8( g) aes4 g f e2 \bar "|"
  \fourbm b'4( c) b aes | g g b aes | g g g4.( f8) | e4( f g aes) f2(~f8 g aes~ \acciaccatura {b8} aes g2.) \bar "|."
}

ison = \relative c' { \global \tiny
  e4 e aes g g f e dis e8( f g4) g2
  f4 f \parenthesize g1 s4 \parenthesize e1 s2
  s4 f4 e e e4.( f8 g4) g aes aes \parenthesize g1 s\breve s2
  \parenthesize e1 s2
  \parenthesize g1 s1.
  g4.( f8) | e4( f g aes) f2(~f8 g aes~ aes g2.)
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
