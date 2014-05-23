% Generated by NWCTXT2Ly C# version 1.0.1.1 by Phil Holmes
% Based on nwc2ly by Mike Wiering

\version "2.17.9"
\pointAndClickOff
#(set-global-staff-size 18)

\header {
  subtitle = \markup {\fontsize #5 "How Sweet the Hour of Praise and Prayer"}
  composer = \markup { \center-column { "Music: Frances Jane (Fanny) Crosby (1820-1915)" \vspace #1 } }
  copyright = \markup { \vspace #2 "Traditional Scottish tune (Auld Lang Syne)" } 
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
    <<
      \new Staff = "Unnamed-000"
      <<
        \new Voice = "Unnamed-000"  {  << \include "Unnamed-000.ly" >> }
        \new Lyrics \lyricsto "Unnamed-000" {  << \include "Unnamed-000Alyrics.ly" >> }
        \new Lyrics \lyricsto "Unnamed-000" {  << \include "Unnamed-000Blyrics.ly" >> }
        \new Lyrics \lyricsto "Unnamed-000" {  << \include "Unnamed-000Clyrics.ly" >> }
      >> % Staff end
      \new Dynamics  \with { alignAboveContext = "Unnamed-000" } { \include "Unnamed-000Dyn.ly" }
      \new Staff = "AuldLangSyne"
      <<
        \new Voice = "AuldLangSyne"  {  << \include "AuldLangSyne.ly" >> }
        \new Lyrics \lyricsto "AuldLangSyne" {  << \include "AuldLangSyneDlyrics.ly" >> }
      >> % Staff end
      \new Dynamics  \with { alignAboveContext = "AuldLangSyne" } { \include "AuldLangSyneDyn.ly" }
    >>  % Pianostaff end
  >> % Music end
}
