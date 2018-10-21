(defn sum-of-odd-elements
  [lst]
  (reduce
    +
    (filter
      (odd? n)
      lst)))
