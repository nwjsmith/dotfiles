{:user {:aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :dependencies [[slamhound "1.5.5"]]
        :plugins [[com.jakemccrary/lein-test-refresh "0.20.0"]
                  [jonase/eastwood "0.2.3"]
                  [lein-ancient "0.6.10"]
                  [lein-cloverage "1.0.9" :exclusions [org.clojure/clojure]]
                  [lein-kibit "0.1.5" :exclusions [org.clojure/clojure]]
                  [lein-pprint "1.1.2"]]}
 :repl {:plugins [[cider/cider-nrepl "0.15.0"]]
        :dependencies [[org.clojure/tools.trace "0.7.9"]]}}
