;; icollect body is allowed to be on one line if the original was
(local t (doto (icollect [k (pairs t)] k)
           (table.sort sorter)))

;; but not if it pushes it over the column limit
(local looooooong-table (doto (icollect [key-which-is-used (pairs t)]
                                key-which-is-used)
                          (table.sort sorter)))
