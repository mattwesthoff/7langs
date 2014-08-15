(ns day1.sleeping-barber-test
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