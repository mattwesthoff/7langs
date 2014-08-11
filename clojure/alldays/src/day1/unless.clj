(ns day1.unless)

(defmacro unless [condition & paths] (conj paths (list 'not condition) 'if))