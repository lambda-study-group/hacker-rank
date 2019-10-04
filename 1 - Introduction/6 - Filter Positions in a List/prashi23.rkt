#lang racket

(define (read-even [n 1])
  (let ([x (read)])
     (if (equal? (modulo n 2) 0)
        (if (eof-object? x)
            (list)
            (cons x (read-even (+ n 1))))
        (read-even (+ n 1)))))

(for ([x (read-even)])
  (printf "~a\n" x))
