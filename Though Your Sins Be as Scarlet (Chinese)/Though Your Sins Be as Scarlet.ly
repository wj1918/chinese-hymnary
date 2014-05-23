% Generated by NWCTXT2Ly C# version 1.0.1.1 by Phil Holmes
% Based on nwc2ly by Mike Wiering

\version "2.15.26"
\pointAndClickOff
#(set-global-staff-size 20)

\header {
  subtitle = \markup {\fontsize #5 "你 的 罪 雖 像 硃 紅"}
  composer = \markup { \center-column { "作曲: William Howard Doane" \vspace #1 } }
  poet = \markup { \center-column { "作词: Frances Jane (Fanny) Crosby, 1887" \vspace #1 } }
}

\paper{
  top-margin = 15
  bottom-margin = 15
  left-margin = 15
  line-width = 180
}

\new Score \with {
  \override PaperColumn #'keep-inside-line = ##t
  \override NonMusicalPaperColumn #'keep-inside-line = ##t
}
{
  <<
    \new ChoirStaff <<
      \set ChoirStaff.systemStartDelimiterHierarchy = #'(SystemStartBar (SystemStartBracket 0 1 ) )
      \override ChoirStaff.SystemStartBracket #'collapse-height = #1
      \override Score.SystemStartBar #'collapse-height = #1
      \new Staff = "Soprano"
      <<
        \new Voice = "Soprano"  {  << \include "Soprano.ly" >> }
        \new Lyrics \lyricsto "Soprano" {  << \include "SopranoAlyrics.ly" >> }
        \new Lyrics \lyricsto "Soprano" {  << \include "SopranoBlyrics.ly" >> }
        \new Lyrics \lyricsto "Soprano" {  << \include "SopranoClyrics.ly" >> }
        \new Voice = "Alto"  {  << \include "Alto.ly" >> }
      >>
      \new Staff = "Bass/Tenor"
      <<
        \new Voice = "BassTenor"  {  << \include "BassTenor.ly" >> }
        \new Voice = "Bass"  {  << \include "Bass.ly" >> }
	\new Lyrics \lyricsto "Bass" {  << \include "Basslyrics.ly" >> }
      >>
    >>
  >>
}