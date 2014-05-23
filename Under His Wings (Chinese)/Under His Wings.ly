% Generated by NWCTXT2Ly C# version 1.0.1.1 by Phil Holmes
% Based on nwc2ly by Mike Wiering

\version "2.17.9"
\pointAndClickOff
#(set-global-staff-size 18)


#(define (drop-punctuation-right str)
   (let ((punct-right '("," ";" ":" "﹕" "：" "?" "\"" "'" "”" "!" "。" "］" "）" "？" "，" "；" "！")))
     (let loop ((elt punct-right))
       (if (null? elt)
           #f
           (if (string-suffix? (car elt) str)
               (string-drop-right str (string-length (car elt)))
               (loop (cdr elt)))))))

#(define (drop-all-punctuation-right str)
   (let ((core (drop-punctuation-right str)))
     (if core
         (drop-all-punctuation-right core)
         str)))

#(define (drop-punctuation-left str)
   (let ((punct-left '("\"" "“" "［" "（")))
     (let loop ((elt punct-left))
       (if (null? elt)
           #f
           (if (string-prefix? (car elt) str)
               (string-drop str (string-length (car elt)))
               (loop (cdr elt)))))))

#(define (drop-all-punctuation-left str)
   (let ((core (drop-punctuation-left str)))
     (if core
         (drop-all-punctuation-left core)
         str)))


#(define (align grob)
   (let* ((stil (ly:grob-property grob 'stencil))
          (stil-X (ly:stencil-extent stil X))
          (text (ly:grob-property grob 'text))
          ; determine X-extent of text stencil without punctuation at end
          (text-L (drop-all-punctuation-right text))
          (text-L-stil (grob-interpret-markup grob text-L))
          (text-L-stil-X (ly:stencil-extent text-L-stil X))
          (displacement (/ (- (cdr text-L-stil-X) (cdr stil-X)) 2))
          ; determine X-extent of text stencil without punctuation at start
          (text-R (drop-all-punctuation-left text))
          (text-R-stil (grob-interpret-markup grob text-R))
          (text-R-stil-X (ly:stencil-extent text-R-stil X))
          (displacement (+ displacement
                          (/ (- (cdr stil-X) (cdr text-R-stil-X)) 2))))

     (- (ly:self-alignment-interface::aligned-on-x-parent grob)
       displacement)))


\header {
  subtitle = \markup {\fontsize #5 "在祂翼下"}
  poet = \markup { \center-column { "作词: William Orcutt Cushing, 1896" \vspace #1 } }
  composer = \markup { \vspace #2 "作曲: Ira David Sankey" } 
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
      \new Staff = "S"
      <<
        \new Voice = "S"  { \voiceOne << \include "S.ly" >> }
        \new Lyrics \lyricsto "S" {
          \override LyricText #'X-offset = #align
	  \override LyricText #'font-size = #2
	  << \include "SAlyrics.ly" >> 
	}
        \new Lyrics \lyricsto "S" {  
          \override LyricText #'X-offset = #align
	  \override LyricText #'font-size = #2
	  << \include "SBlyrics.ly" >> }
        \new Lyrics \lyricsto "S" {
          \override LyricText #'X-offset = #align
	  \override LyricText #'font-size = #2
	  << \include "SClyrics.ly" >> }
        \new Voice = "A"  { \voiceTwo << \include "A.ly" >> }
      >> % Staff end
      \new Staff = "T"
      <<
        \new Voice = "T"  { \voiceThree << \include "T.ly" >> }
        \new Voice = "B"  { \voiceFour << \include "B.ly" >> }
      >> % Staff end
    >>  % Pianostaff end
  >> % Music end
}
