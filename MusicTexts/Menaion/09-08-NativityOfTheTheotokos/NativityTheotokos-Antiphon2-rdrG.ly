\version "2.18.2"

\header {
  title = "Nativity of the Theotokos"
  subtitle = "Antiphon"
  subsubtitle = "Second"
  copyright = "This arrangement is free to distribute for Liturgical use"
  tagline = "Arranged using https://oca.org/liturgics/learning-the-tones"
}

#(set-default-paper-size "letter")

% Provide an easy way to group a bunch of text together on a breve
% http://lilypond.org/doc/v2.18/Documentation/notation/working-with-ancient-music_002d_002dscenarios-and-solutions
recite = \once \override LyricText.self-alignment-X = #-1

\defineBarLine "invisible" #'("" "" "")
global = {
  \time 1/1 % Not used, Time_signature_engraver is removed from layout
  \key g \major
  \set Timing.defaultBarType = "invisible" %% Only put bar lines where I say
}

refrain = \lyricmode {
  Save us, O Son of God,
    Who art won -- drous in the Saints;
    who sing to Thee. __ Al -- le -- lu -- ia.
}
verseOne = \lyricmode {
  The Lord hath sworn in truth un -- to Da -- vid;
    and He will not an -- nul it.
    Of the fruit of thy loins
    will I set up -- on thy throne.
  \refrain
  There will I make to spring forth a horn for Dav -- id.
    I have pre -- pared a lamp for my Christ. 
  \refrain
  For the Lord hath e -- lect -- ed Zion;
    He hath cho -- sen her to be a hab -- i -- ta -- tion for Him -- self. 
  \refrain
}

soprefmost = {
  b4 b b a b c2( b2) r4 \bar "|"
  b4 g a2 a4 a a g2( a4) b4 c2. c4 b4( c b a) g2 a2 b1( a) g
}
sopref = { \soprefmost \bar "||" }
soprano = \relative g' {
  \global
  % Verse 1
  g4 g a b b b a b c2. b4 r4 \bar "|"
  g4 b b b g a2 g2 r4 \bar "|"
  g4 a b( a) b c2 b2 r4 \bar "|"
  g4 a b g a2 a2 g2 r4 \bar "||"
  \sopref % Refrain
  % Verse 2
  g4 g a b b b b b a b c2 b2 r4 \bar "|"
  g4 g a b g a2 a4 a4 g2 r4 \bar "||"
  \sopref % Refrain
  % Verse 3
  g4 a b b b a b c2( b2) r4 \bar "|"
  g4 a b b b b b b b g a2 a4 a a g2 r4 \bar "||"
  \sopref % Refrain
}

alto = \relative c' {
  \global

}

tenor = \relative a {
  \global

}

bass = \relative c {
  \global

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
    } \lyricsto "soprano" \verseOne

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
  \midi { \tempo 4 = 300
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
