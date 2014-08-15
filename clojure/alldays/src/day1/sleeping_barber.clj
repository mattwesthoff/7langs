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

(def running (ref true))
(def available-chairs (ref 3))
(def satisfied-customers (ref 0))
(def barber-working? (ref false))
(def walkouts (ref 0))

; customer behavior
(defn customer-enters []
	(dosync (if (> @available-chairs 0)
		(alter available-chairs dec) 
		(alter walkouts inc))))

; customer generator
(defn marketing []
	(future (while @running 
		(Thread/sleep (+ 10 (rand-int 20)))
		(customer-enters))))

; barber behavior
(defn cut-hair [sleep]
	(dosync 
		(ref-set barber-working? true)
		(alter available-chairs inc))
	(Thread/sleep sleep)
	(dosync 
		(alter satisfied-customers inc)
		(ref-set barber-working? false)))

; barber loop
(defn barber []
	(future (while (or @running (< @available-chairs 3)) (if (not @barber-working?) (cut-hair 20)))))

(defn -main []
	(marketing)
	(barber)
	(Thread/sleep 60000)
	(dosync (ref-set running false))
	(print "haircuts: " @satisfied-customers " walkouts: " @walkouts "\n")
	(shutdown-agents))