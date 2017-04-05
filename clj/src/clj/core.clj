(ns clj.core
  (:require
    [tupelo.core :as t]
    [clojure.string :as str] ))
(t/refer-tupelo)

(defn -main [& args] (println :main))
