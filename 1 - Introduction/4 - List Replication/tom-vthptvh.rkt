#lang racket
;; List replication

;; Read an integer from standard input
(define X (string->number (read-line (current-input-port) 'any)))

;; Read all input by recursion
(let replicate_input()
    (let ([inp (read-line (current-input-port) 'any)])
        (when (not(eof-object? inp))
            (for ([i X])
                (begin (displayln inp)))
            (replicate_input))))