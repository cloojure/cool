(ns xxx.core
  (:use tupelo.core)
; (:use clojure.test)
; (:refer-clojure :exclude [update partition find] )
  (:require 
    [cheshire.core                          :as cc]
    [clojure.core                           :as clj]
    [clojure.core.async                     :as async 
        :refer [ go go-loop chan buffer close! thread alts! alts!! timeout close! ]]
    [clojure.core.match                     :as ccm ]
    [clojure.java.io                        :as io]
    [clojure.java.jdbc                      :as jdbc]
    [clojure.pprint                         :as cpp ]
    [clojure.set                            :as cs]
    [clojure.string                         :as str]
    [clojure.test.check                     :as tc]
    [clojure.test.check.clojure-test        :as tct]
    [clojure.test.check.generators          :as gen]
    [clojure.test.check.properties          :as prop]
    [criterium.core                         :as crit]
    [datomic.api                            :as d]
    [honeysql.core                          :as hsql] 
    [honeysql.helpers                       :refer :all]
    [java-jdbc.ddl                          :as ddl]
    [java-jdbc.sql                          :as sql]
    [schema.core                            :as s]
    [tupelo-datomic.core                    :as td]
    [tupelo-datomic.schema                  :as tds]
    [tupelo.async                           :as tas]
    [tupelo.base64                          :as b64]
    [tupelo.base64url                       :as b64url]
    [tupelo.misc                            :as misc] 
    [tupelo.schema                          :as ts]
    [tupelo.sql                             :as tsql]
    [tupelo.types                           :as types] 
    [tupelo.y64                             :as y64]
  )
; (:import 
;   [java.io    Reader BufferedReader StringReader]
;   [java.lang  Math]
;   [java.util  HashSet]
; )
  (:gen-class)
)
