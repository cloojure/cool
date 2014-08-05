{ :user {   
    :plugins  [ [lein-ancient "0.5.5"] 
                [lein-pprint  "1.1.1"] ] 
    :dependencies [ [org.clojure/clojure       "1.5.0"]
                    [criterium                 "0.4.3"]
                  ]
    :deploy-repositories {  "snapshots" :clojars
                            "releases"  :clojars }
    :jvm-opts ["-Xms2g" "-Xmx12g" ]
;   :jvm-opts ["-Xms4g" "-Xmx8g" "-server"]
}}
