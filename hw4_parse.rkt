;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname hw4_parse) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


#|0782|#
#|The assignment is about parsing string containing "[],.+-<>"|#
(define (match toks tok)
   (cond
    [(not (list? toks)) false]
    [(empty? toks) #f]
    [(equal? (first toks) tok) (rest toks)]
    [else #f]
    )
)

(define (parseC toks)
  (cond
    [(not (list? toks)) false]
    [(empty? toks) toks]
    [(equal? (first toks) ">") (parseS (match toks ">"))]
    [(equal? (first toks) "<") (parseS (match toks "<"))]
    [(equal? (first toks) "+") (parseS (match toks "+"))]
    [(equal? (first toks) "-") (parseS (match toks "-"))]
    [(equal? (first toks) ",") (parseS (match toks ","))]
    [(equal? (first toks) ".") (parseS (match toks "."))]
    [else #f]
    )
  )
(define (parseS toks)
  (cond
    [(not (list? toks)) false]
    [(empty? toks) toks]
    [(equal? (first toks) ">") (parseC toks)]
    [(equal? (first toks) "<") (parseC toks)]
    [(equal? (first toks) "+") (parseC toks)]
    [(equal? (first toks) "-") (parseC toks)]
    [(equal? (first toks) ",") (parseC toks)]
    [(equal? (first toks) ".") (parseC toks)]
    [(equal? (first toks) "[") (parseL toks)]
    [(equal? (first toks) "]") (parseL toks)]
    [else #f]
    )
  )
(define (parseL toks)
  (cond
    [(not (list? toks)) false]
    [(empty? toks) toks]
    [(equal? (first toks) "[") (parseS (match toks "["))]
    [(equal? (first toks) "]") (parseS (match toks "]"))]
    [else #f]
    )
)