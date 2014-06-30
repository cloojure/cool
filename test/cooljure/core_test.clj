(ns cooljure.core-test
  (:require [cooljure.core :refer :all]
            [clojure.contrib.seq :as seq] )
  (:use [clojure.test] ))

(deftest basic
  (let [data [true :a 1 false nil] ]
    (testing "basic usage"
      (let [truthies    (filter boolean data)       ; coerce to primitive type
            falsies     (filter not     data) ]     ; unnatural syntax
        (is (and  (= truthies [true :a 1] )
                  (= falsies  [false nil] ) )))
      (let [truthies    (filter truthy? data)
            falsies     (filter falsey? data) ]
        (is (and  (= truthies [true :a 1] )
                  (= falsies  [false nil] ) ))))

    (testing "improved usage"
      (let [count-if (comp count filter) ]
        (let [num-true    (count-if boolean data)   ; awkward phrasing
              num-false   (count-if not     data) ] ; doesn't feel natural
          (is (and  (= 3 num-true) 
                    (= 2 num-false) )))
        (let [num-true    (count-if truthy? data)   ; matches intent much better
              num-false   (count-if falsey? data) ]
          (is (and  (= 3 num-true)
                    (= 2 num-false) )))))

    (testing "contrib"
      (let [ result (seq/separate boolean data) ]
        (is (= [ [true :a 1] [false nil] ]
               result )))
      (let [ result (seq/separate truthy? data) ]
        (is (= [ [true :a 1] [false nil] ]
               result ))))
  ))
