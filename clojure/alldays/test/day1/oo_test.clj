(ns day1.oo-test
  (:require [clojure.test :refer :all]
            [day1.oo :refer :all])
  (:import [day1.oo DocWeirdo]))

(def dw (DocWeirdo.))

(deftest docweirdo-so-crazy
	(testing "doc weirdo hides"
		(is (= (hide dw)) "DocWeirdo hides in a nearby closet!")))

(deftest docweird-so-weird
	(testing "doc weird carries junk around"
		(is (= (smell-bad dw "bat guano") "DocWeirdo reaches in a bag and throws bat guano at you!  It smells awful!"))))