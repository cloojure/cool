(ns cooljure.core-test
  (:require [cooljure.core :refer :all]
            [clojure.contrib.seq :as seq]
  )
  (:use [clojure.test] )
)

(deftest basic
  (testing "basic usage"
    (let [flgs    [true true false] ]
      (println "core: basic way")
      (let [num-true    (count (filter boolean flgs))
            num-false   (count (filter not     flgs)) ]
        (is (and  (= 2 num-true) 
                  (= 1 num-false) )))
      (println "cool: basic way")
      (let [num-true    (count (filter truthy? flgs))
            num-false   (count (filter falsey? flgs)) ]
        (is (and  (= 2 num-true)
                  (= 1 num-false) )))
    ))

  (testing "improved usage"
    (let [flgs        [true true false]
          count-if    (comp count filter) ]
      (println "core: improved")
      (let [num-true    (count-if boolean flgs)   ; awkward phrasing
            num-false   (count-if not     flgs) ] ; doesn't feel natural
        (is (and  (= 2 num-true) 
                  (= 1 num-false) )))
      (println "cool: improved")
      (let [num-true    (count-if truthy? flgs)   ; matches intent much better
            num-false   (count-if falsey? flgs) ]
        (is (and  (= 2 num-true)
                  (= 1 num-false) )))
    ))

  (testing "fancier"
    (let [flgs        [true true false] ]
      (prn (seq/separate odd? (range 5)))
      (println "core: fancy")
      (let [ [num-true num-false] (map count (seq/separate boolean flgs)) ]
        (is (and  (= 2 num-true) 
                  (= 1 num-false) )))
      (println "cool: fancy")
      (let [ [num-true num-false] (map count (seq/separate truthy? flgs)) ]
        (is (and  (= 2 num-true)
                  (= 1 num-false) )))
    ))

  (println "  done.")
)
