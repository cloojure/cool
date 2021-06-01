  :dependencies [ 
    [aprint                           "0.1.3"]    ; (aprint obj)  (ap obj)
    [cheshire                         "5.5.0"]
    [clj-time                         "0.11.0"]
    [clojure-csv/clojure-csv          "2.0.2"]
    [com.datomic/datomic-pro          "0.9.5350" :exclusions [joda-time]]
    [com.mchange/c3p0                 "0.9.5.2"]
    [criterium                        "0.4.3"]
    [honeysql                         "0.6.2"]
    [java-jdbc/dsl                    "0.1.3"]
    [org.clojure/clojure              "1.7.0"]
    [org.clojure/core.async           "0.2.374"]
    [org.clojure/core.incubator       "0.1.3"]
    [org.clojure/core.match           "0.3.0-alpha4"]
    [org.clojure/java.jdbc            "0.4.2"] 
    [org.clojure/test.check           "0.9.0"]
    [org.postgresql/postgresql        "9.4-1206-jdbc42"]
    [prismatic/schema                 "1.0.4"]
    [ring/ring-codec                  "1.0.0"]
    [tupelo                           "0.1.70"]
  ]
  :update :always; :daily  

  :plugins  [ [lein-codox "0.9.4"] ]
  :codox {:src-dir-uri "http://github.com/cloojure/tupelo/blob/master/"
          :src-linenum-anchor-prefix "L"}

  :main ^:skip-aot clj.core
  :global-vars { *warn-on-reflection* false }

  ; "lein test"         will not  run tests marked with the ":slow" metadata
  ; "lein test :slow"   will only run tests marked with the ":slow" metadata
  ; "lein test :all"    will run all  tests (built-in)
  :test-selectors { :default    (complement :slow)
                    :slow       :slow }

  :jvm-opts ^:replace ["-Xms1g" "-Xmx4g" ] ; ["-Xms4g" "-Xmx8g" "-server"]

