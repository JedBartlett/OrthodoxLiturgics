\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

\defineBarLine "invisible" #'("" "" "")
global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key c \major
  \set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  On -- ly be -- got -- ten Son and Word of God Who art im -- mor -- tal,
  Who for our sal -- va -- tion willed to be in -- car -- nate
  of the Ho -- ly The -- o -- to -- kos and  E -- ver Vir -- gin Ma -- ry,
  who with -- out change be -- came __ man
  and was cru -- ci -- fied, O Christ __ our God,
  and tram -- pled down __ death by death,
  Who art one of the Ho -- ly Tri -- ni -- ty,
  glo -- ri -- fied to -- ge -- ther with the Fa -- ther and the Ho -- ly Spi -- rit.
  save __ us. __
}

melody = \relative c' {
  % Ritardando spanning several notes
  \override TextSpanner.bound-details.left.text = "rit."
  \global % Leave these here for key to display
  e4( f) g g aes g g g b aes aes g g f f2 e1  \bar "|"
  f4 d e f f( g) g2 g4 g fis g aes( b) \parenthesize b1 \bar "|"
  b4 b c c b aes aes2 g4 g b aes g f f2 e1 \bar "|"
  d4 e f g f e( f) \parenthesize g1 \bar "|"
  f4 g aes g g aes b( c b) aes g1 \bar "|"
  g4 b aes g( f) e2. d4 c1 \bar "|"
  g'4 g aes2 g4 aes b c b aes g1 \bar "|"
  b4 aes g f aes g g aes b c b aes aes g aes2 g1 \bar "|"

  g2.(\startTextSpan e4 f g) aes2 g1\stopTextSpan \bar "|."
}

ison = \relative c' {
  \global % Leave these here for key to display
   c\breve s\breve s1
   c\breve s\breve s2
   r2 c\breve s\breve s2
   d4 c1 c2 s1
   g'\breve s1.
   g4 c,\breve s1
   g'\breve s1.
   g\breve s\breve s1
   c,1. f2 c1
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
