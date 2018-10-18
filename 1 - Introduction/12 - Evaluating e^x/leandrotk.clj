(ns eval-ex
  (:use [clojure.test]))

(defn exp
  [x n]
  (reduce * (repeat n x)))

(defn factorial
  [n]
  (reduce * (range 1 (inc n))))

(defn expansion
  [x]
  (fn [n]
    (/ (exp x n) (factorial n))))

(defn series-expansion
  [x]
  (read-string
    (format "%.4f"
      (reduce + (map (expansion x) (range 10))))))
