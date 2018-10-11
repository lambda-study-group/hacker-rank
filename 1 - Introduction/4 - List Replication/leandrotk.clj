(defn list-replication
  [n list]
  (doseq [item list]
    (dotimes [_ n] (println item))))
