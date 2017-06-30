 (fn[num lst]
    (doseq [item lst]
        (dotimes [_ num] (println item))
    )
 )
