(ns day1.core-test
  (:require [clojure.test :refer :all]
            [day1.core :refer :all]))

(deftest big-test-hello-two
	(testing "(big hello 2) returns true"
		(is (big "hello" 2))))

(deftest big-test-hello-eight
	(testing "(big hello 8) returns true"
  		(is (not (big "hello" 8)))))

(deftest collection-type-map
	(testing "collection-type returns :map for maps"
		(is (= (collection-type {}) :map))))

(deftest collection-type-vector
	(testing "collection-type returns :vector for vectors"
		(is (= (collection-type []) :vector))))

(deftest collection-type-list
	(testing "collection-type returns :list for lists"
		(is (= (collection-type ()) :list))))