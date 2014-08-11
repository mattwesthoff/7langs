(ns day1.unless-test
  (:require [clojure.test :refer :all]
            [day1.unless :refer :all]))

(deftest unless-works-without-else-if-false
	(testing "(unless false :tacos) is :tacos"
		(is (= (unless false :tacos) :tacos))))

(deftest unless-works-without-else-if-true
	(testing "(unless true :tacos) is nil"
		(is (= (unless true :tacos) nil))))

(deftest unless-works-with-else-if-true
	(testing "(unless false :tacos) is :tacos"
		(is (= (unless false :tacos) :tacos))))
