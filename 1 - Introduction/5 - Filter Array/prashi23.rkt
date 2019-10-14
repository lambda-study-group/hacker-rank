#lang racket

(define (read-list)
  (let ([e (read)])
    (if (eof-object? e) 
        (list)
        (cons e (read-list)))))
(define x (read))
(define xs (read-list))
(define ys (filter (lambda (y) (> x y)) xs))
(for ([y ys])(printf "~a~n" y))
