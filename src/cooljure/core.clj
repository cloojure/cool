;   Copyright (c) Alan Thompson. All rights reserved.  ;   The use and distribution terms for this software are covered by the
;   Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
;   which can be found in the file epl-v10.html at the root of this distribution.
;   By using this software in any fashion, you are agreeing to be bound by
;   the terms of this license.
;
;   You must not remove this notice, or any other, from this software.

(ns ^{:doc "Cooljure - Cool stuff you wish was in Clojure"
      :author "Alan Thompson"}
  cooljure.core)

(defn truthy?
  "Returns true if arg is logical true (neither nil nor false);
  otherwise returns false."
  [arg]
  (if arg true false) )  ; Functionally equivalent to clojure.core/boolean

(defn falsey?
  "Returns true if arg is logical false (either nil or false);
  otherwise returns false. Equivalent to (not (truthy? arg))."
  [arg]
  (if arg false true) )  ; Functionally equivalent to clojure.core/not.

(defn any?
  "Returns true if (pred x) is logical true for any x in coll; otherwise returns false.
   Like clojure.core/some, but returns only true or false."
  [pred coll]
  (truthy? (some pred coll)) )

(defn not-empty?
  "Returns false if coll contains no items; otherwise returns true.
  Equivalent to (not (empty? coll))."
  [coll]
  (truthy? (seq coll)) )

(defn conjv 
  "Appends item to collection, always returning a vector."
  ; From Stuart Sierra post 2014-2-10
  [coll item]
  (conj (vec coll) item) )

; comparisons
(defn -main []
  (let [flgs    [true true false] ]
    (println "core: basic way")
    (let [num-true    (count (filter boolean flgs))
          num-false   (count (filter not     flgs)) ]
      (assert (and  (= 2 num-true) 
                    (= 1 num-false) )))
    (println "cool: basic way")
    (let [num-true    (count (filter truthy? flgs))
          num-false   (count (filter falsey? flgs)) ]
      (assert (and  (= 2 num-true)
                    (= 1 num-false) )))
  )
  (let [flgs        [true true false]
        count-if    (comp count filter) ]
    (println "core: improved")
    (let [num-true    (count-if boolean flgs)   ; awkward phrasing
          num-false   (count-if not     flgs) ] ; doesn't feel natural
      (assert (and  (= 2 num-true) 
                    (= 1 num-false) )))
    (println "cool: improved")
    (let [num-true    (count-if truthy? flgs)   ; matches intent much better
          num-false   (count-if falsey? flgs) ]
      (assert (and  (= 2 num-true)
                    (= 1 num-false) )))
  )
  (println "  done.")
)
