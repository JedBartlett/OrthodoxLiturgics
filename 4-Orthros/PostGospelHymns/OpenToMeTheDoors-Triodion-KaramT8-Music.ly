\version "2.18.2"

onebm=\set Timing.measureLength = #(ly:make-moment 1/4)
twobm=\set Timing.measureLength = #(ly:make-moment 2/4)
fourbm=\set Timing.measureLength = #(ly:make-moment 4/4)
fivebm=\set Timing.measureLength = #(ly:make-moment 5/4)
sixbm= \set Timing.measureLength = #(ly:make-moment 6/4)


global = {
  \time 6/4 % Starts with
  \key f \major
}

lyricText = \lyricmode {
  Glory to the Fa -- ther and to the Son
  and __ to the Ho -- ly __ Spi -- rit.

  O -- pen to me the doors of re -- pen -- tance,
  O __ Life- Giv -- er.
  For my soul go -- eth ear -- ly __
  to the tem -- ple of Thy ho -- li -- ness,
  com -- ing in the tem -- ple of my bod -- y
  whol -- ly pol -- lut -- ed
  But be -- cause Thou art com -- pas -- sion -- ate,
  Pu -- ri -- fy me by the com -- pas -- sion __  of Thy __  mer -- cies

  Both now and ev -- er
  and un -- to a -- ges of a -- ges A -- men.

  Pre -- pare for me the ways of sal -- va -- tion,
  O The -- o -- to -- kos;
  for I have pro -- faned my -- self with coarse __ sins,
  and con -- sumed my __ whole life __
  with pro -- cras -- ti -- na -- tion.
  But by thine __ in -- ter -- ces -- sions
  Pu -- ri -- fy __  Thou __  me
  from all a -- bom -- i -- na -- tion

  Have mer -- cy up -- on me, O God, ac -- cord -- ing to Thy great mer -- cy;
  and ac -- cord -- ing to the  mul -- ti -- tude of Thy com -- pas -- sions
  blot out mine in -- iq -- ui -- ties.

  If I think up -- on the mul -- ti -- tude of my __ e -- vil deeds,
  wretch that I __  am,
  I trem -- ble for the ter -- ri -- ble
  Day of Judg -- ment.
  But trust -- ing the com -- pas -- sion of Thy mer -- cy,
  I shout to Thee __ like Da -- vid:
  Have mer -- cy up -- on me,
  O God, __
  ac -- cord -- ing to __ thy great __ Mer -- cy. __
}

melody = \relative g' {
  % Glory to the Father and to the Son
  d8(^\markup{\small{Byzantine Chant Tone 8}} e d4 c2) c4 d |
    \fourbm e8( d16 e f4) e d | e2 f8( g f4) |\sixbm g2
  % And to the Holy Spirit.
  e8( d16 e f4 e d) |\fourbm c4.( d8 e4) f | g2 e16([ f8.~ \acciaccatura{g8} f8 e]) |
     e4.( d8 c d c4) |\twobm c2 \bar"||"

  % Open to me the doors of repentance,
  \sixbm r4 f4 e f g g | a8( bes a4) g2 f8( g f e ) |\fourbm g4( f8 e) e2 |
  % O Life-Giver.
  d4( e) f( e8 f) | e8(f e d c d c4) | c2
  % For my soul goeth early
  c4 c |\sixbm e8( f g4) g2 aes |\fourbm b16( c8.~ c4 b aes) |\sixbm aes8(b g2)
  % to the temple of Thy holiness,
  r4 f4 g | a g g2 f8( e f4) | g8( f16 g a4) g4( f8 e) e2 |
  % coming in the temple of my body
  \fourbm e4 d e f |\sixbm g f e2 dis4( e) |\fourbm e16( f8.~ \acciaccatura{g8} f8 e) e2 |
  % wholly polluted
  g4( f8 g f4 e) | d4.( e8) c4( d) |\sixbm ees( d c b) c2 |
  % But because Thou art compassionate,
  e2 f8( g f4) g2 | g4( a8 bes) a4( g) f( e) |\fourbm f( g a b8 c) |\sixbm b( c bes a g a g4) g2 |
  % Purify me by the compassion of Thy mercies
  \fourbm c8( d c b) b( a b c) | b( c bes a  g a g4) | g4. g8 g4 g | a4( g f2) |
     f8( e~ \acciaccatura{dis8} e f) d2 | d4( e f8 g f e) |\sixbm e4.( d8 c d c4) c2 \bar "||"

  % Both now and ever
  \twobm r4 c |\fourbm d4( e) c2 | d4( e4~ e16 f8.~ \acciaccatura{g8} f8 e) | e4.
  % and unto ages of ages Amen.
  e8 e4 d |\sixbm e8( f e d) c2 d8( e d4) |\fourbm d4( e4~ e16 f8.~ \acciaccatura{g8} f8 e) |
     \sixbm e( f e d) c( d c4) c2 \bar"||"

  % Prepare for me the ways of salvation,
  \twobm r4 c4 |\sixbm e2 f8( g f4) g g | a8( bes a4) g2 f8( g f e) |\fourbm g4( f8 e) e2 |
  % O Theotokos;
  d( e) f2 e16( f8.~ \acciaccatura{g8} f8 e) | e4.( d8 c d c4) | c2
  % for I have profaned myself with coarse sins,
  e4 f | g2 aes |\sixbm c4( b) g16( aes8.~ \acciaccatura{b} aes8 g) g4. a8 |
     \fourbm bes16([ c bes c] bes8 a g4 f) | f8( e4.)
  % and consumed my whole life
  e4 f |\sixbm g8( a g4) f8( g f e) g4( f8 e) |\fourbm e8( dis16 e f4 e d) |
  % with procrastination.
  c4.( d8 e4) f | g2 e16( f8.~ \acciaccatura{g8} f8 e) | | e( f e d c d c4) | c2
  % But by thine intercessions
  e4 f | g4.( a4 g8 fis4) | g2 a8( bes a4) | b8( c d c bes4 a) | a4( g2) r4 |
  % Purify Thou me
  c8( d c b) b8( a b4) |\sixbm b8( c bes a) g8( a g4) g2 |
  % from all abomination
  \twobm f4( e) |\fourbm d2 e4( f) | g2 e16( f8.~ \acciaccatura{g8} f8 e) | e( f e d c d c4) | c1 \bar"||"

  \break \key d \major
  % Have mercy upon me, O God, according to Thy great mercy;
  \onebm r8^\markup{\small{Tone 6 - Quickly!}} d8 |\set Timing.measureLength = #(ly:make-moment 9/4)
     g8 g g g g g g4 g8 a g fis ees fis fis( g) g4 |
  % and according to the multitude of Thy compassions
  \set Timing.measureLength = #(ly:make-moment 9/4)
    d8 d g g g g g g g fis g a bes16( a) g8 r4
  % blot out mine iniquities.
    \override BreathingSign.text = \markup { \musicglyph #"scripts.caesura.curved" } \breathe
    a8(^\markup{\small{slower}} bes) |\set Timing.measureLength = #(ly:make-moment 10/4)
             a4( g) fis g fis8( g fis ees) d( ees d4) d2 \bar"||"

  % If I think upon the multitude of my evil deeds,
  \twobm fis4 g |\fourbm a r8 g g4 a | c8( bes) a4 g fis g8.( fis16 g8 a g4 fis) |
    \sixbm fis8( f4.) fis8( g fis4) g2 |
  % wretch that I am,
  \fourbm a4( g8 fis) fis4( g) | fis8( g fis ees d ees d4) | d2
  % I tremble for the terrible
  d4( ees) | g16( fis g a g8 fis ees4 d) | c2 g'4 g |\sixbm a8([ bes c bes]) a([ bes a g]) g2 |
  % Day of Judgment.
  \fourbm a4( g8 fis) fis4( g) | fis8( g fis ees d ees d4) | d2
  % But trusting the compassion of Thy mercy,
  r4 d4 |\sixbm g8( fis16 g a4) a2 g4 a |\fourbm bes8( a) g4 a bes | cis16( d8.~ d4  cis bes) | bes( a2)
  % I shout to Thee like David:
  a4 | bes2 g8( fis g4) |\sixbm a4( bes a g) fis( g) |\fourbm g16( a8.~ \acciaccatura{bes8} a8 g) g4.
  % Have mercy upon me,
  fis8 |\sixbm g4( a a16 bes8. \acciaccatura{c8} bes8 a) a4 a8( bes) | d8.( cis16 bes8 a) g2
  % O God
  fis8( g fis ees) |\fourbm g2( a | bes cis8[ d cis bes] |
     \sixbm d4~ d16. ees32 d8 cis2 bes4 a |\fourbm bes8 cis bes4 a4.)
  % According to thy great mercy.
  a8 |\sixbm bes4 a g8.( a16 g8 fis ees4) d |\fourbm d8( cis4. d8 ees g4) | fis8( g fis ees d4 g) |
     g4~( \tuplet3/2 {g8 fis ees} fis4. g8 |\fivebm a4 \acciaccatura{bes8} a4 g2.) \bar"|."
}

ison = \relative c' { \global \tiny
  \parenthesize c1 s1. s1 s\breve s s1 s4
  \parenthesize c1 s\breve s\breve s s4
  g'2 f \parenthesize g1 s1
  \parenthesize c,1 s\breve s s s s s s2
  f4 g \parenthesize g1 s\breve s
  \parenthesize d1 s1 s4
  \parenthesize c1 s1 s2
  \parenthesize c1 s\breve s1 s4
  \parenthesize g1^G
  \parenthesize c1 s1 s4
  \parenthesize c1 s\breve s s s2. s2
  \parenthesize g'2 f
  \parenthesize g1 s4.
  \parenthesize c,1 s\breve s s s1. s8
  \parenthesize g'4. a4 g8 fis4 \parenthesize g1 s\breve s
  c,2 \parenthesize d1 s
  \parenthesize c1 s1.

  % Tone 6
  \parenthesize d1 s\breve s s s4
  \parenthesize d2. s8 \parenthesize g1 s8
  \parenthesize d1 s\breve s s1
  \parenthesize cis1 s2
  \parenthesize g'1 s1
  \parenthesize d1 s\breve s1
  g4 a bes8 a g4 \parenthesize a1 s1.
  \parenthesize g1 s1
  \parenthesize d1 s1.
  \parenthesize a'4 a8 a g2 d1 g2 a g \parenthesize a1 s1
  \parenthesize g2 \parenthesize d1 s1
  d8 cis4. \parenthesize d1
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
  \midi { \tempo 4 = 100
          \context {
            \Voice
            \remove "Dynamic_performer"
    }
  }
}
