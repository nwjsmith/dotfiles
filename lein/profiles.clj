{:user {:aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :dependencies [[slamhound "1.5.5"]]
        :plugins [[lein-count "1.0.9"]
                  [lein-ancient "0.6.15"]
                  [lein-nvd "0.6.0" :exclusions [org.slf4j/jcl-over-slf4j
                                                 org.slf4j/clf4j-api
                                                 org.tcrawley/dynapath
                                                 org.slf4j/slf4j-api]]]}
 :repl {:dependencies [[org.clojure/tools.trace "0.7.10"]]}}
