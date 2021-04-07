{
  :user {
    :plugins [
      [com.jakemccrary/lein-test-refresh "0.24.1"]
      [jonase/eastwood          "0.4.0"]
      [lein-ancient             "0.7.0"]
      [lein-codox               "0.10.7"]
      [lein-exec                "0.3.7"]]
    :jvm-opts ["-Xms1g" "-Xmx4g" 
;              "-server"
              ] 
  } 
  
  :auth {
    :repository-auth { #"my\.datomic\.com"    { :username "cloojure@gmail.com"
                                                :password "9529a811-7108-4dbc-afc5-2b36608b6e82" }}}
}
