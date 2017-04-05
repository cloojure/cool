(ns tst.clj.core
  (:use clj.core clojure.test tupelo.test)
  (:require
    [tupelo.core :as t]
    [clojure.string :as str]
    ))
(t/refer-tupelo)
(t/print-versions)

(deftest t-global
  (println :global)

)

