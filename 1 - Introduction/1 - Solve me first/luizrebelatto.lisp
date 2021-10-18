(defun solveMeFirst (x y)    
    (+ x y))

(setq a (read-line))
(setq b (read-line))

(write (solveMeFirst (parse-integer a) (parse-integer b)))