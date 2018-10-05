#lang racket
;; Sum of 2 integers

(define (sum-of-two-integers a b)
  (+ a b))

(let ([a (read)]
      [b (read)])
  (printf "~a~%" (sum-of-two-integers a b)))