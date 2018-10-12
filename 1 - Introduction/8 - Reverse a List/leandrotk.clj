(fn [lst]
  (loop [original-list lst reversed-list []]
    (if (not-empty original-list)
      (recur (take (dec (count original-list)) original-list) (conj reversed-list (last original-list)))
      reversed-list)))
