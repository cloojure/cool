{ :user {   
    :plugins  [ [lein-ancient "0.5.5"] 
                [lein-pprint  "1.1.1"] ] 
    :dependencies [ [criterium                 "0.4.3"]
                  ]
    :deploy-repositories {  "snapshots" :clojars
                            "releases"  :clojars }
    :jvm-opts ["-Xms2g" "-Xmx12g" ]
;   :jvm-opts ["-Xms4g" "-Xmx8g" "-server"]
}}
