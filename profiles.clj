{:user
  {:plugins 
    [
    ;[jonase/eastwood          "0.3.5"]
     [lein-ancient             "0.6.15"]
    ;[lein-environ             "1.1.0"]
     [lein-exec                "0.3.7"]
    ;[lein-pprint              "1.2.0"] 
     [com.jakemccrary/lein-test-refresh "0.23.0"]
    ]
   :jvm-opts ["-Xms1g" "-Xmx4g" 
            ; "-server"
             ] } 
  
; :auth {
;   :repository-auth { #"my\.datomic\.com"    { :username "cloojure@gmail.com"
;                                               :password "9529a811-7108-4dbc-afc5-2b36608b6e82" }}}

}
