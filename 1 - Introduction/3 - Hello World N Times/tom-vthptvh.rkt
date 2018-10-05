#lang racket
; Print "Hello World" n times

(define str (read-line (current-input-port) 'any))
(define n (string->number str)) ; convert from string to number

(for ([i n]) ; => loop n times: i=[0..n-1]
    (printf "Hello World\n")) 