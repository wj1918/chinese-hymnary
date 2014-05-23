%%%%%%%%%%%%%%%%%%%%%%%%%
\version "2.16"

#(define (drop-punctuation-right str)
  (let ((punct-right '("," ";" ":" "?" "\"" "'" "!" "。" "］" "）" "？")))
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

\paper {
  ragged-right = ##f
}

\relative c' {
  \time 3/4 e4 e4. e8
  d4 e d c2.
}

\addlyrics {
  \override LyricText #'X-offset = #align
  "\"I" am so lone -- "ly,\"" said she
}
\addlyrics {
  \override LyricText #'X-offset = #align
  ［樂  極］ （寶  名） 貝？  名。 啊?
}
\addlyrics {
  \override LyricText #'X-offset = #align
  a b c d e f g
}