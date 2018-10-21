(defn list-replication
  [n list]
  (sort
    (flatten
      (repeat n list))))
