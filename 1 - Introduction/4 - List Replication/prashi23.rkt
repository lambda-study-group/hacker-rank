#lang racket

(define (read-list)
  (let ([x (read)]) 
    (if (eof-object? x)
        (list)
        (cons (number->string x) (read-list)))))
(define (replicate n s)
  (string-append* (make-list n (string-append s "\n"))))
(define t (read))
(define xs (read-list))
(define ys (map (lambda (x) (replicate t x)) xs))
(for ([x ys])
     (printf "~a" x))
