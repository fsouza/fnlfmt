(each [_ key (ipairs (icollect [k v (pairs form) &until v]
                       (when (shorthand-pair? k v)
                         k)))]
  (tset form (fennel.sym ":") (. form key)))

(collect [k v ;; what
          (pairs [])]
  (print k v))

(fn compile-binary [lua-c-path
                    executable-name
                    static-lua
                    lua-include-dir
                    native-thingy]
  (let [cc (or (os.getenv :CC) :cc)]
    nil))

(fn completer [env scope text]
  (let [max-items 2000 ; to stop explosion on too many items
        ]
    (icollect [k is-mangled (utils.allpairs (if scope-first? scope t))
               :into matches :until (<= max-items (length matches))]
      k)))
