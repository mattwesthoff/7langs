(ns day1.sleeping-barber-test
  (:require [clojure.test :refer :all]
            [day1.sleeping-barber :refer :all]))

(deftest new-customer-fills-seat-if-available
	(testing "a customer walking in the door occupies a seat if one is available"
		(dosync (ref-set available-chairs 1))
		(customer-enters)
		(is (= 0 @available-chairs))))

(deftest new-customer-walks-out-if-no-seats
	(testing "no seats means no customer"
		(dosync (ref-set available-chairs 0))
		(dosync (ref-set walkouts 0))
		(customer-enters)
		(is (= 1 @walkouts))
		(is (= 0 @available-chairs))))

(deftest hair-cut-incs-available-chairs-and-satisfied-customers
	(testing "cutting hair frees up a waiting spot and satisfies"
		(dosync (ref-set available-chairs 0))
		(dosync (ref-set satisfied-customers 0))
		(cut-hair 0)
		(is (= 1 @available-chairs))
		(is (= 1 @satisfied-customers))))