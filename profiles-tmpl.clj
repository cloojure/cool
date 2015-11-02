{ :user {   
    :plugins [ 
      [lein-ancient     "0.5.5"] 
      [lein-exec        "0.3.4"] 
      [lein-pprint      "1.1.1"] 
;     [cider/cider-nrepl "0.8.2"]
    ] 
    :dependencies [ 
      [criterium                    "0.4.3"] 
      [org.clojure/clojure          "1.8.0-beta1"]
      [org.clojure/tools.namespace  "0.2.9"]
;     [org.clojure/tools.nrepl      "0.2.7"]
    ]
    :source-paths [ "==user.home==/.lein" ]
    :repl-options { :init-ns user }

    :deploy-repositories {  "snapshots" :clojars
                            "releases"  :clojars }
    :jvm-opts ["-Xms2g" "-Xmx12g" ]
;   :jvm-opts ["-Xms4g" "-Xmx8g" "-server"]
}}
