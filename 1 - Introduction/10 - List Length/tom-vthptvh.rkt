#lang racket
;; List length

(define list_len 0)

;; Read all input by recursion and increase list_len
(let read_input()
    (let ([inp (read-line (current-input-port) 'any)])
        (when (not(eof-object? inp))
            (set! list_len(add1 list_len)) ;; assign new value to list_len
            (read_input))))

(displayln list_len)