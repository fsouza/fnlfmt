(when true
  (print "you can't handle the truth!")
  (os.exit 1))

;; what

(do
  (fn abc []
    "this docstring
has a newline in it"
    (do
      (set fail (+ fail 1))
      (print :FAIL)
      ;; hey
      (print "Expected:")
      (print after)
      (print "Got:")
      (print actual))))

(if (. {:fn true :lambda true "λ" true} callee)
    (view-fn-args t view inspector (+ indent (length second)) out callee)
    3)

(fn pp-string [str options indent]
  (let [escape? (and options.escape-newlines?
                     (< (length str) (- options.line-length indent)))
        escs (setmetatable {"\a" "\\a"
                            "\b" "\\b"
                            "\f" "\\f"
                            "\v" "\\v"
                            "\r" "\\r"
                            "\t" "\\t"
                            "\\" "\\\\"
                            "\"" "\\\""
                            "\n" (if escape? "\\n" "\n")}
                           {:__index #(: "\\%03d" :format ($2:byte))})]
    (.. "\"" (str:gsub "[%c\\\"]" escs) "\"")))

(deftest ensure-blobbo
  (t.is (= 33 b.lob)))

(m.with-connection [socket-connection "https://fennel-lang.org/see?abc=foo"]
  (socket-connection:read-all))
