{ :user {   
    :plugins [ 
      [lein-ancient     "0.5.5"] 
      [lein-exec        "0.3.6"] 
      [lein-pprint      "1.1.1"] 
      [lein-codox       "0.9.3"] 
    ] 
    :dependencies [ 
      [criterium                    "0.4.3"] 
      [org.clojure/clojure          "1.8.0"]
      [org.clojure/tools.namespace  "0.2.9"]
;     [org.clojure/tools.nrepl      "0.2.7"]
    ]
    :source-paths [ "==user.home==/.lein" ]
    :repl-options { :init-ns user }

    :deploy-repositories {  "snapshots" :clojars
                            "releases"  :clojars }
    :jvm-opts ["-Xms1g" "-Xmx4g" ]
;   :jvm-opts ["-Xms4g" "-Xmx8g" "-server"]
}}
