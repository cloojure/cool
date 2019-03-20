{
  :user {
    :plugins [
      [com.jakemccrary/lein-test-refresh "0.23.0"]
;     [jonase/eastwood          "0.3.5"]
      [lein-ancient             "0.6.15"]
      [lein-codox               "0.10.3"]
;     [lein-environ             "1.1.0"]
;     [lein-exec                "0.3.7"]
    ]

    :jvm-opts ["-Xms1g" "-Xmx4g" 
;              "-server"
              ] 
  } 

}
