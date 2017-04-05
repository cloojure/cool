(defproject clj "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [
    [tupelo "0.9.30"]
    [org.clojure/clojure "1.8.0"]
   ;[org.clojure/clojure "1.9.0-alpha14"]
    [org.clojure/test.check "0.9.0"]  ; #todo needed by bug in test-refresh
  ]
  :main ^:skip-aot clj.core
  :target-path "target/%s"
  :profiles {:dev     {}
             :uberjar {:aot :all}}
  jvm-opts ["-Xms100m" "-Xmx100m" "-server" ] ;
)
