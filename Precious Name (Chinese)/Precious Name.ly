% Generated by NWCTXT2Ly C# version 1.0.1.1 by Phil Holmes
% Based on nwc2ly by Mike Wiering

\version "2.15.26"
\pointAndClickOff
#(set-global-staff-size 18)

#(define (drop-punctuation-right str)
   (let ((punct-right '("," ";" ":" "?" "\"" "'" "!" "。" "］" "）" "？" "，" "；" "！")))
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
  subtitle = \markup {\fontsize #5 "時常攜帶耶穌聖名"}
  poet= \markup { \center-column { "作词: Lydia Odell Baxter, 1870" \vspace #1 } }
  composer = \markup { \vspace #2 "作曲: William Howard Doane, 1871" }

  %title = \markup \fill-line { \line {} \line { Source: Gospel Hymns Nos. 1 to 6 Complete (Chicago, Illinois: The Biglow & Main Company, 1894), # 47.} }
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
      \override ChoirStaff.SystemStartBracket #'collapse-height = #1
      \override Score.SystemStartBar #'collapse-height = #1
      \new Staff = "SA"
      <<
        \new Voice = "SA"  {  << \include "SA.ly" >> }
        \new Lyrics \lyricsto "SA" {
          \override LyricText #'X-offset = #align
          << \include "SAAlyrics.ly" >>
        }
        \new Lyrics \lyricsto "SA" {
          \override LyricText #'X-offset = #align
          << \include "SABlyrics.ly" >>
        }
        \new Lyrics \lyricsto "SA" {
          \override LyricText #'X-offset = #align
          << \include "SAClyrics.ly" >>
        }
        \new Lyrics \lyricsto "SA" {
          \override LyricText #'X-offset = #align
          << \include "SADlyrics.ly" >>
        }
      >>
      \new Staff = "TB"
      <<
        \new Voice = "TB"  {  << \include "TB.ly" >> }
        \new Lyrics  \with { alignAboveContext = #"TB" }
        \lyricsto "TB" {
          %\override LyricText #'X-offset = #align
          << \include "TBAlyrics.ly" >>
        }
      >>
    >>
  >>
}
