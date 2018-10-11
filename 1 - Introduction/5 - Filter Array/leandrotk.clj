(defn filter-array
  [n list]
  (if (< (first list) n)
    (println (first list)))
  (if (not (empty? (rest list)))
    (filter-array n (rest list))))
