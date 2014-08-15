; find a queue impl that blocks when the queue is empty and waits for a new item
; user refs to create a vector of accounts in memory. create debit and credit funcs to change the balance of an accounts
; sleeping barber - write a multithreaded program to determine how many haircuts a barber can give in ten seconds
	; a barber shop takes customers
	; customers arrive at random intervals, from 10 - 30 ms
	; barber shop has three chairs in the waiting room
	; one barber and one barber chair
	; when the barber's chair is empty a customer sits in the chair, wakes up the barber and gets a haircut
	; if the chairs are fill all new customers turn away
	; haircuts take 20 ms
	; after a customer receives a haircut he gets up a leaves

(ns day1.day3-test
  (:require [clojure.test :refer :all]
            [day1.sleeping-barber :refer :all]))

(deftest new-customer-fills-seat-if-available
	(testing "a customer walking in the door occupies a seat if one is available"
		(is (= 1 (dosync (ref-set available-chairs 1))))
		(customer-enters)
		(is (= 0 @available-chairs))))

(deftest new-customer-walks-out-if-no-seats
	(testing "no seats means no customer"
		(is (= 0 (dosync (ref-set available-chairs 0))))
		(is (= 0 (dosync (ref-set walkouts 0))))
		(customer-enters)
		(is (= 1 @walkouts))
		(is (= 0 @available-chairs))))