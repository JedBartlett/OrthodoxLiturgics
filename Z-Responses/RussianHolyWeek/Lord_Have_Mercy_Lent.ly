\version "2.16.2"

\header {
  title = "The Litany of Fervent Supplication"
  composer = "Sung During Holy Week"
  poet = "Russian"
}

\paper {
  #(set-paper-size "letter")
  top-margin = 1\in
  right-margin = 1.5\in
  bottom-margin = 1\in
  left-margin = 1.5\in
}

\layout {
  \context {
    \Voice
    \consists "Melody_engraver"
    \override Stem #'neutral-direction = #'()
  }
}

global = {
  \key f \major
  \numericTimeSignature
  \time 4/4
  %\tempo 4=152
}

voice = {\global
    % Trebel clef, suprano and alto
    <<  \relative g'{
        g4 a g2 f2 e1
      } \\ \relative e'{
        e4 e e2 c2 c1
      }
    % Bass clef, tenor and bass
    \new Staff {\global \clef "bass" c4 c c1    c1}
    >>
%    g4 g g a g f g a bes( c) bes2~ bes4
%    bes4 a g a bes a8( g f4) g2
%    bes4( a) g a bes( c) bes2
%    bes4 a c8( bes) a( c) bes2
%    g4 g g a bes( c) bes a bes a g a c( bes8 a bes2)
%    bes4 c d c bes c bes( a) bes
%    bes4 bes8( c bes a) g( f g a)
%    bes4 g a a a bes a8( g f4) g2~ g4
%    f4 g a bes c d( c) bes a g a c8( bes a c bes4.)
%    a8 g4( a) bes c d( ees8 f) d4( c) bes( a c) bes8( a) bes4.
%    bes8 bes4( c) bes a g8(f g4 a8 bes a4 c bes8 a bes2)
%    bes4 bes a g f g c bes a2 g
}

verse = \lyricmode {
  % Lyrics follow here.
  Lord, Have Mer -- -- cy
}

\score {
  \voice \addlyrics { \verse }
  \layout { }
  \midi {
    \tempo 4=152
  }
}
