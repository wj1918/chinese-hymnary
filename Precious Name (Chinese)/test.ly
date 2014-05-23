\version "2.16.2"

#(define (align grob)
  (let* ((stil (ly:grob-property grob 'stencil))
         (stil-X (ly:stencil-extent stil X))
         (text (ly:grob-property grob 'text))
         (punct-R (char-set #\, #\" #\; #\! #\. #\space))
         (punct-L (char-set #\"))
         ; determine X-extent of text stencil without punctuation at end
         (text-L (string-trim-right text punct-R))
         (text-L-stil (grob-interpret-markup grob text-L))
         (text-L-stil-X (ly:stencil-extent text-L-stil X))
         (displacement (/ (- (cdr text-L-stil-X) (cdr stil-X)) 2))
         ; determine X-extent of text stencil without punctuation at start
         (text-R (string-trim text punct-L))
         (text-R-stil (grob-interpret-markup grob text-R))
         (text-R-stil-X (ly:stencil-extent text-R-stil X))
         (displacement (+ displacement
                          (/ (- (cdr stil-X) (cdr text-R-stil-X)) 2))))

     (- (ly:self-alignment-interface::aligned-on-x-parent grob)
        displacement)))

<<
{
  c' d' e' 
}
\addlyrics 
{
  \override LyricText #'X-offset = #align
    One Two!!!!!!!!! Three
}
>>