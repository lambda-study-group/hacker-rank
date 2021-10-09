(def n (Integer/parseInt (clojure.string/trim (read-line))))

(doseq [n-itr (range n)]
    (def x (Double/parseDouble (clojure.string/trim (read-line))))
    (println
        (reduce + 
            (map 
                #(/ (reduce * (repeat % x))
                    (reduce * (range 1 (inc %))))
                (range 10)
            )
        )
    )
)