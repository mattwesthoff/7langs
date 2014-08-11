(ns day1.unless)

(defmacro unless [condition & paths] (conj (reverse paths) condition 'if))