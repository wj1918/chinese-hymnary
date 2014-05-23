\version "2.16"

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

\paper {
  ragged-right = ##f
}

\relative c' {
  \time 3/4 e4 e4. e8
  d4 e d c2.
}

\addlyrics {
  \override LyricText #'X-offset = #align
  "\"\"\"I!!!!!!!!!!!!" am,,,,,,,,,, so
  lone -- "ly!!!!!,\"" said "she    !!!!!!!!!!!!!!!\""
}
