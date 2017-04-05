{
  :user {
    :plugins [ 
      [com.jakemccrary/lein-test-refresh "0.19.0"]
      [jonase/eastwood          "0.2.3"] 
      [lein-ancient             "0.6.0"]
;     [lein-autoexpect          "1.9.0"]
      [lein-codox               "0.9.3"] 
      [lein-exec                "0.3.6"] 
;     [lein-expectations        "0.0.8"]
;     [lein-midje               "3.2.1"]
;     [lein-pprint              "1.1.2"] 
    ] 
    :dependencies [ 
    ; [org.clojure/clojure          "1.9.0-alpha14"]
    ; [org.clojure/clojure          "1.8.0"]
    ; [org.clojure/clojure          "1.7.0"]
    ]
;   :jvm-opts ["-Xms1g" "-Xmx4g" ] ;   "-server"
  }

  :auth {
    :repository-auth { #"my\.datomic\.com"    { :username "cloojure@gmail.com"
                                                :password "9529a811-7108-4dbc-afc5-2b36608b6e82" }}
  }
}
