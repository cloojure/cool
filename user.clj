; Default "user" namespace for repl use (re. Stuart Sierra "My Workflow Reloaded")

(ns user
  (:use tupelo.core))

;;; #_(do
;;; 
;;;   (ns user
;;;     (:require 
;;;       [clojure.string                 :as str]
;;;       [clojure.java.io                :as io]
;;;       [clojure.pprint                 :refer [pprint] ]
;;;       [clojure.repl                   :refer :all]
;;;       [clojure.tools.namespace.repl   :refer [refresh refresh-all] ] )
;;;     (:use 
;;;       clojure.test )
;;;   )
;;; 
;;;   (def system nil)
;;; 
;;;   (defn dotest 
;;;     "Runs all tests found in the specified (quoted) namespaces. Defaults to the current namespace if none specified."
;;;     [& ns-names]
;;;     (time
;;;       (do
;;;         (refresh)
;;;         (apply run-tests ns-names))))
;;; 
;;;   (defn dotests
;;;     "[] [ns-regex]
;;;     Runs all tests in namespaces that match the ns-regex regular expression. Defaults to
;;;     namespaces matching the patterns 'tst.*', '*-tst', or '*.tst.*', and the equivalent
;;;     'test' patterns.  "
;;;     ( []
;;;       (dotests #"te?st..*|te?st\..*|.*-te?st" ))
;;;     ( [ns-regex]
;;;       (time
;;;         (do
;;;           (refresh)
;;;           (run-all-tests ns-regex )))))
;;; 
;;; )
