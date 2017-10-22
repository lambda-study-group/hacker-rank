;; A Brainfuck Interpreter written in Common Lisp
;; Author: Manoel Vilela
;; Date: 10/07/2017 02:24:40
;; upstream: https://github.com/ryukinix/lisp-scripts

;; constants
(defparameter *max-operations* 100000)
(defparameter *valid-operations* "<>+-.,[]")

;; global variables
(defparameter *memory* (make-array 100000 :initial-element 0))
(defparameter *source* (make-array 5000 :initial-element #\0))
(defparameter *source-pointer* 0)
(defparameter *source-pointer-end* 0)
(defparameter *operations* 0)
(defparameter *data-pointer* 0)
(defparameter *open-loop-stack* nil)
(defparameter *input* nil)
(defparameter *input-pointer* 0)

;; == I/O primitives ==

(defun valid-operation-p (char)
  (not (null (position char *valid-operations*))))

(defun read-source (source-length)
  (let ((source-pointer 0))
    (loop repeat source-length
          for line = (read-line)
          do (loop for char across line
                   when (valid-operation-p char)
                     do (progn (setf (aref *source* source-pointer) char)
                               (incf source-pointer))))
    (setf *source-pointer-end* source-pointer)))

(defun get-user-input (input-length)
  (setf *input* (subseq (read-line) 0 input-length)))

(defun print-source ()
  (loop for x from 0 below *source-pointer-end*
        collect (princ (aref *source* x))))

(defun read-input ()
  (prog1 (aref *input* *input-pointer*)
         (incf *input-pointer*)))

;; == BRAINFUCK OPERATORS ==

;; .
(defun print-data ()
  (princ (code-char (aref *memory* *data-pointer*)))
  (incf *source-pointer*))

;; ,
(defun read-data ()
  (setf (aref *memory* *data-pointer*)
        (char-code (read-input)))
  (incf *source-pointer*))

(defun closed-loop-p ()
  (eql (aref *source* *source-pointer*) #\]))

(defun opened-loop-p ()
  (eql (aref *source* *source-pointer*) #\[))

(defun goto-end-of-loop ()
  (let ((loops 0))
    (loop when (opened-loop-p)
            do (incf loops)
          when (closed-loop-p)
             do (decf loops)
          when (and (closed-loop-p)
                    (= loops 0))
            return nil
          do (incf *source-pointer*))))

(defun goto-start-of-loop ()
  (setf *source-pointer* (pop *open-loop-stack*)))

;; [
(defun open-loop ()
  (push *source-pointer* *open-loop-stack*)
  (if (plusp (aref *memory* *data-pointer*))
      (incf *source-pointer*)
      (goto-end-of-loop)))

;; ]
(defun close-loop ()
  (if (plusp (aref *memory* *data-pointer*))
      (goto-start-of-loop)
      (progn (pop *open-loop-stack*)
             (incf *source-pointer*))))

;; >
(defun increment-data-pointer ()
  (incf *data-pointer*)
  (incf *source-pointer*))

;; <
(defun decrement-data-pointer ()
  (unless (= 0 *data-pointer*)
    (decf *data-pointer*))
  (incf *source-pointer*))

;; +
(defun increment-data ()
  (if (= (aref *memory* *data-pointer*) 255)
      (setf (aref *memory* *data-pointer*) 0)
      (incf (aref *memory* *data-pointer*)))
  (incf *source-pointer*))

;; -
(defun decrement-data ()
  (if (= (aref *memory* *data-pointer*) 0)
      (setf (aref *memory* *data-pointer*) 255)
      (decf (aref *memory* *data-pointer*)))
  (incf *source-pointer*))


(defun execute-step ()
  (case (aref *source* *source-pointer*)
    (#\+ (increment-data))
    (#\- (decrement-data))
    (#\> (increment-data-pointer))
    (#\< (decrement-data-pointer))
    (#\. (print-data))
    (#\, (read-data))
    (#\[ (open-loop))
    (#\] (close-loop)))
  (incf *operations*))

;; == PARSING & EXECUTION ==
(defun interpret-program ()
  (loop while (< *source-pointer* *source-pointer-end*)
        when (>= *operations* *max-operations*)
          return (format t "~%PROCESS TIME OUT. KILLED!!!")
        do (execute-step)))

(defun show-memory ()
  (loop for x across *memory*
        collect x
        while (> x 0)))

(defun main ()
  (let ((input-length (read))
        (source-length (read)))
    (get-user-input input-length)
    (read-source source-length)
    (interpret-program)))

(main)
