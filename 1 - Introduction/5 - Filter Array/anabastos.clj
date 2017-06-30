 (fn[delim lst] 
    (doseq [item lst] 
        (if (< item delim) (println item))
    )
 )
 