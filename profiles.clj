{ :user {   
    :plugins [ 
      [lein-ancient     "0.6.0"]
      [lein-exec        "0.3.6"] 
      [lein-pprint      "1.1.1"] 
      [lein-codox       "0.9.3"] 
      [jonase/eastwood  "0.2.3"] 
      [com.jakemccrary/lein-test-refresh "0.15.0"]
    ] 
    :dependencies [ 
      [org.clojure/clojure          "1.8.0"]
;     [org.clojure/tools.namespace  "0.2.9"]
;     [org.clojure/tools.nrepl      "0.2.7"]
    ]
    :test-refresh { :notify-command ["terminal-notifier" "-title" "Tests" "-message"]
                    :quiet true
                    :changes-only true }
;   :source-paths [ "/home/odl/.lein" ]
;   :repl-options { :init-ns user }
;   :deploy-repositories {  "snapshots" :clojars
;                           "releases"  :clojars }
;   :jvm-opts ["-Xms1g" "-Xmx4g" ] ;   "-server"
}}
