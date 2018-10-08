(defn filterList [lst]
    (doseq [el (take-nth 2 (rest lst))]
        (prn (Integer/parseInt el))
    )
)