(local M {})

(lambda M.spec [url ?spec]
  (assert (= :string (type url)) "expected string for url")
  (assert (or (= ?spec nil) (= :table (type ?spec)) "expected table or nil for spec"))
  (doto
    (or ?spec {})
    (tset 1 url)))

M
