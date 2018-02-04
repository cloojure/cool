#!/usr/bin/env lein-exec
;--------------------------------------------------------------------------------
; Place all dependencies here (like with ":dependencies" keyword in project.clj file)
;
(leiningen.exec/deps '[ 
  [cooljure "0.1.18"] 
] )

;--------------------------------------------------------------------------------
; Place all "require" and "use" statements here, inside quoted vectors (like in repl).
;
(require '[clojure.string           :as str]
         '[cooljure.explicit        :as x] )
(use '[cooljure.core])

;--------------------------------------------------------------------------------
; Place all other code here.

(defn incr [val]        ; define a local function
  (inc val))

(println (str/upper-case "hello clojure!"))
(spyx (incr 1))         ;  <- cooljure.core/spyx
(spyx (truthy? 1))      ;  <- cooljure.core/truthy?

(println (str "The value of *command-line-args* is:  " *command-line-args* ))

