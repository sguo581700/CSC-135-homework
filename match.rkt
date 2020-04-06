;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname match) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|0782|#
#|match method|#

(define (match toks tok)
   (cond
    [(not (list? toks)) false]
    [(empty? toks) #f]
    [(equal? (first toks) tok) (rest toks)]
    [else #f]
    )
)