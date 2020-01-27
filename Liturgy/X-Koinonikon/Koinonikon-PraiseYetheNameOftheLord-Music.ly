\version "2.18.2"

#(set-global-staff-size 18)
barlineMarkup = \markup {
  \whiteout
  \pad-around #0.5
  \vcenter
  \teeny \column { " "
                   "A" \vspace#-0.5
                   "L" \vspace#-0.5
                   "L" \vspace#-0.5
                   "E" \vspace#-0.5
                   "L" \vspace#-0.5
                   "U" \vspace#-0.5
                   "I" \vspace#-0.5
                   "A" }
}

customBarLine = {
  \once \override Staff.BarLine #'stencil =
  #(lambda (grob)
     (ly:stencil-combine-at-edge
       (ly:bar-line::print grob)
       X RIGHT
       (grob-interpret-markup grob barlineMarkup)
       0
     )
   )
}

barlineMarkupBass = \markup {
  \whiteout
  \pad-around #0.5
  \vcenter
  \teeny \column { "   " "   " "   " }
}

customBarLineBass = {
  \once \override Staff.BarLine #'stencil =
  #(lambda (grob)
     (ly:stencil-combine-at-edge
       (ly:bar-line::print grob)
       X RIGHT
       (grob-interpret-markup grob barlineMarkupBass)
       0
     )
   )
}


global = {
  \time 4/4 % Not used, Time_signature_engraver is removed from layout
  \key g \major
}

lyrictxt = \lyricmode {
  Praise ye the name    of the Lord, O ye ser -- vants, ye ser -- vants of   the Lord.
  Al -- le -- lu -- ia,      Al -- le -- lu -- ia,  Al --   le -- lu -- ia.
  Praise be the Lord out of Zi -- on, who dwell -- eth, who dwell -- eth at Je -- ru -- sa -- lem.
  O give thanks un -- to the Lord, for He is gra -- cious, for His mer -- cy en -- dur -- eth for e -- ver.
  O give thanks un -- to the God of hea -- ven, for His mer -- cy en -- dur -- eth for e -- ver. }
soprano = \relative g' { \global \override Score.BarLine.layer = 1 \partial 2.
  fis4^"Not fast - [1]"  fis\< fis g(\! fis) g a b2 b4 b a2 a4 b c( b a\>) g fis2\! fis \set Timing.measureLength = #(ly:make-moment 2/4)
                                                                                 g\fermata \bar"||" \break
  fis4^"[ALLELUIA]" fis \set Timing.measureLength = #(ly:make-moment 4/4)
                        g2\< fis4 r4\! b a g fis g( b a) g\> fis1 g1\! \bar"||" \break
  \set Timing.measureLength = #(ly:make-moment 3/4)
  fis4^"[2]"  fis fis\< \set Timing.measureLength = #(ly:make-moment 4/4)
                      g( fis)\! g a b2 b4 b a2 a4 b c\> b a\! g fis2 fis \set Timing.measureLength = #(ly:make-moment 2/4)
                                                                    g\fermata  \bar"||" \customBarLine \break
  \set Timing.measureLength = #(ly:make-moment 2/4)
  a4^"[3]" a \set Timing.measureLength = #(ly:make-moment 4/4)
             b\< a b\! c d d c b a2 a a4 b c( b) a g fis2\> fis4 fis\! g2 \set Timing.measureLength = #(ly:make-moment 2/4)
                                                                  g\fermata \bar"||" \customBarLine  \break
  \set Timing.measureLength = #(ly:make-moment 2/4)
  a4^"[4]" a \set Timing.measureLength = #(ly:make-moment 4/4)
             b a\< b c d\! d c( b) a2 a4 b c( b) a g fis2 fis4\> fis g2\! \set Timing.measureLength = #(ly:make-moment 2/4)
                                                                  g\fermata  \bar "||" \customBarLine
}
alto = \relative c' { \global
  dis4 dis dis e( dis) e fis g2 g4 g fis2 fis4 g a( g fis) e dis2 dis e
  dis4 dis e2 dis4 r4 g fis e dis e( g fis) e dis1 e
  dis4 dis dis e( dis) e fis g2 g4 g fis2 fis4 g a  g fis e dis2 dis e
  fis4 fis g fis g a b b a g fis2 fis fis4 g a( g) fis e dis2 dis4 dis e2 e
  fis4 fis g fis g a b b a( g) fis2 fis4 g a( g) fis e dis2 dis4 dis e2 e
}
tenor = \relative c' { \global
  b4 b b b2 b4 d d2 d4 d d2 d4 d d2. b4 b2 b b
  b4 b b2 b4 r4 d4 d b b b2. b4 b1 b1
  b4 b b b2 b4 d d2 d4 d d2 d4 d d d d b b2 b b
  d4 d d d d d d d d d d2 d d4 d d2 d4 b b2 b4 b b2 b
  d4 d d d d d d d d2 d d4 d d2 d4 b b2 b4 b b2 b
}
bass= \relative c { \global
  b4 b b e( b) e d g2 g,4 b d2 d4 g fis( g d) e b2 b e\fermata
  b4 b e2 b4( a) g d' e b e2( dis4) e b1 e
  b4 b b e( b) e d g2 g,4 b d2 d4 g fis g d e b2 b e\fermata \customBarLineBass
  d4 d g d b d g g fis g d2 d d4 g fis( g) d e b2 b4 b e2 e\fermata \customBarLineBass
  d4 d g d b d g g fis( g) d2 d4 g fis( g) d e b2 b4 b e2 e\fermata \customBarLineBass
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
    } \lyricsto "soprano" { \lyrictxt}

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
  \midi { \tempo 4 = 200
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
