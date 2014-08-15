(ns day1.sleeping-barber)

; sleeping barber - write a multithreaded program to determine how many haircuts a barber can give in ten seconds
	; a barber shop takes customers
	; customers arrive at random intervals, from 10 - 30 ms
	; barber shop has three chairs in the waiting room
	; one barber and one barber chair
	; when the barber's chair is empty a customer sits in the chair, wakes up the barber and gets a haircut
	; if the chairs are fill all new customers turn away
	; haircuts take 20 ms
	; after a customer receives a haircut he gets up a leaves
	
(def available-chairs (ref 3))
(def walkouts (ref 0))

(defn customer-enters []
	(if (> @available-chairs 0)
		(dosync (alter available-chairs dec)) (dosync (alter walkouts inc))))