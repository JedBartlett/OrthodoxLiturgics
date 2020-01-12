\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

\defineBarLine "invisible" #'("" "" "")
global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key f \major
  %\set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
}

hymnLyrics = \lyricmode {
  Let __ us who mys -- tic -- 'lly
  rep -- re -- sent the cher -- u -- bim
  and who sing the thrice- ho -- ly hymn
  to __ the __ life- cre -- a -- ting,
  life cre -- a -- ting Tri -- ni -- ty
  Now lay a -- side, lay a -- side all earth -- ly -- cares,
  lay -- a -- side
  all -- earth -- ly cares.
}

melody = \relative f' {
  \global % Leave these here for key to display
  f4.( g8) bes4 a a f8( g) g2

  c,8( f) f( e) f4. f8 g4 f8( g) a2

  \set Timing.measureLength = #(ly:make-moment 8/4)
  a4. g8 bes4 a a f8 g g2

  \set Timing.measureLength = #(ly:make-moment 6/4)
  c,8( f) f(e) f4. f8 g4 f8( g)

  \set Timing.measureLength = #(ly:make-moment 4/4)
  a4 bes8( c) d4 c c f,8( g) g2

   \set Timing.measureLength = #(ly:make-moment 10/4)
  f8( a) g8 bes a4  a8 bes c4. c8 c4 f,8( g) g2

  \set Timing.measureLength = #(ly:make-moment 4/4)
  c,8( f) f( e) f2 c8( f) f e f2
}


ison = \relative f' {
  \global % Leave these here for key to display
  \parenthesize f1 d2 c2
  c2 d2 c2 f2
  \parenthesize f1 d2 c2
  c2 d2 c2
  f2 \parenthesize d1 c2
  d4 c4 \parenthesize f1 d2 c2
  c2 d2 c2 f2 \bar "|."
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
    } \lyricsto "melody" \hymnLyrics

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
  \midi { \tempo 4 = 50
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
