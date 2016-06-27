{ :user {   
    :dependencies [ 
      [org.clojure/clojure          "1.9.0-alpha5"]
      [criterium                    "0.4.4"]
;     [org.clojure/tools.namespace  "0.2.9"]
;     [org.clojure/tools.nrepl      "0.2.7"]
    ]
    :plugins [ 
      [lein-ancient     "0.6.0" :exclusions [org.clojure/clojure]]
      [lein-collisions  "0.1.4"]
      [lein-exec        "0.3.6"] 
      [lein-pprint      "1.1.1"] 
      [lein-codox       "0.9.3"] 
      [jonase/eastwood  "0.2.3"] 
      [com.jakemccrary/lein-test-refresh "0.15.0"]
    ] 
;   :source-paths [ "/home/alan/.lein" ]
;   :repl-options { :init-ns user }
}}
