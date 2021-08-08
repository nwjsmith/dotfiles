(ns hooks.checking
  (:require [clj-kondo.hooks-api :as api]))

(defn checking
  [{:keys [node]}]
  (let [[name & body] (rest (:children node))
        [options bindings & prop] (if (api/vector-node? (first body))
                                    (list* (api/map-node {}) body)
                                    body)
        new-node (api/list-node
                  (list* (api/token-node 'doseq)
                         bindings
                         name
                         options
                         prop))]
    {:node new-node}))
