(defn factorial [n]
    (reduce * (range 1 (+ n 1))))

(defn gen-term [n order]
    (/ (reduce * (repeat order n))
    (factorial order)))

(defn result [n]
    (reduce + 1 (map (partial gen-term n) (range 1 10))))
