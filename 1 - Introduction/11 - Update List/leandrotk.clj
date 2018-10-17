(defn to-absolute
  [n]
  (if (neg? n)
    (+ (* n -2) n)
    n))

(defn update-list-map
  [lst]
  (map to-absolute lst))
