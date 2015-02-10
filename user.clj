; Default "user" namespace for repl use (re. Stuart Sierra "My Workflow Reloaded")

(ns user
  (:require 
    [clojure.string                 :as str]
    [clojure.java.io                :as io]
    [schema.core                    :as s]
    [clojure.pprint                 :refer (pprint) ]
    [clojure.repl                   :refer :all]
    [clojure.tools.namespace.repl   :refer (refresh refresh-all) ] )
  (:use [
    cooljure.core 
    clojure.test ] )
)

(def system nil)
