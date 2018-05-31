{
  :user {
    :plugins [
      [com.jakemccrary/lein-test-refresh "0.22.0"]
      [jonase/eastwood          "0.2.5"]
      [lein-ancient             "0.6.15"]
      [lein-codox               "0.10.3"]
      [lein-exec                "0.3.7"]]
    :jvm-opts ["-Xms1g" "-Xmx4g" 
;              "-server"
              ] 
  } 
  
  :auth {
    :repository-auth { #"my\.datomic\.com"    { :username "cloojure@gmail.com"
                                                :password "9529a811-7108-4dbc-afc5-2b36608b6e82" }}}
}
