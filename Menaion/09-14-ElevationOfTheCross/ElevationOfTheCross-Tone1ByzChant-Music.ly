\version "2.18.2"

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1


global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key c \major
  \set Timing.defaultBarType = "" %% Only put bar lines where I say
}

lyricText = \lyricmode {
  % Note that inserted text in the melody will go ABOVE the lyrics
  O Lord, save Thy peo -- ple and bless Thine in -- her -- i -- tance,
  grant -- ing to Thy peo -- ple vic -- to -- ry
  o -- ver all their en -- e -- mies;
  and by the pow -- er of Thy Cross,
  pre -- serv -- ing Thy com -- mon -- wealth.
  com -- mon -- wealth. __
}

melody = \relative c' {
  % Ritardando spanning several notes
  \override TextSpanner.bound-details.left.text = "rit."
  \global % Leave these here for key to display
  \repeat volta 3 { d4 g2 f4 g a g f g f e f g g2 \bar "|"
                    f4 e f g a g bes a g2 \bar"|"
                    g8( f) e4 f g g f8( e) d2 \bar "|"
                    d4 e f g f e f g2 \bar"|"
                    f4 g f e  }

     \alternative {
          { g4( f) e( \acciaccatura {f16} e8 d) d2 \bar ":|." }
          { g4( f) e( d) d( c2 d4 e \acciaccatura{f8} e4 d2.) \bar "|." }
     }
}

ison = \relative c' {
  \global % Leave these here for key to display
  \repeat volta 2 { d\breve s s s s s1.}
     \alternative {
          { c1 d2}
          { \parenthesize d1 s4 c1 s4 d2. }
     }
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
  \midi { \tempo 4 = 150
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
