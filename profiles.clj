{ :user {   
    :plugins [ 
      [com.jakemccrary/lein-test-refresh "0.16.0"]
      [jonase/eastwood  "0.2.3"] 
      [lein-ancient     "0.6.0"]
      [lein-codox       "0.9.3"] 
      [lein-exec        "0.3.6"] 
      [lein-pprint      "1.1.1"] 
    ] 
    :dependencies [ 
      [org.clojure/clojure "1.9.0-alpha14"]
    ]
    :test-refresh { :quiet        true
                    :changes-only true }
  ; :repositories           [ ["clojars" {:url "https://repo.clojars.org"} ] ]
  ; :plugin-repositories    [ ["clojars" {:url "https://repo.clojars.org"} ] ]
  ; :jvm-opts ["-Xms1g" "-Xmx4g" ] ;   "-server"
  }
}
