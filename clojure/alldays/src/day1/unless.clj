(ns day1.unless)

(defmacro unless [test body] (list 'if (list 'not test) body))