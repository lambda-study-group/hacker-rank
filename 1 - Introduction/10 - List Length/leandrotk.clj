(defn list-length
  [lst]
  (reduce + (map (constantly 1) lst)))
