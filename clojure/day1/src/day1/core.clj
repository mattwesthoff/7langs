(ns day1.core)

(defn big 
    "Returns true if string arg is longer than n chars"
    [st n]
    (> (count st) n))

(defn collection-type
    "return type of passed in arg"
    [col]
    (cond
        (list? col) :list
        (vector? col) :vector
        (map? col) :map))