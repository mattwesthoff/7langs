(ns day1.sleeping-barber)

(def available-chairs (ref 3))

(defn customer-enters []
	(if (> @available-chairs 0)
		(dosync (alter available-chairs dec)) ))