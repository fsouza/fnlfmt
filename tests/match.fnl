(match [:a :b :c]
  [this pattern is really long! too long fer one line]
  (print (the body is very very long too!)
         (too long to fit on one line of course))
  [a b c] (print "this one can fit on the pattern line"
                 "and it has a couple args in the print line"))

(local x (require :x))

(match (identify-indent-type lines prev-line-num [])
  ;; three kinds of indentation:
  (:table opening)
  opening
  (:body-special prev-indent)
  (+ prev-indent 2)
  (:call prev-indent function-name)
  (+ prev-indent (length function-name) 2))

(fn *macros*.pretty-macrodebug [expr return-string?]
  "Patched version of Fennel's macrodebug that calls fnlfmt on expanded form."
  (let [warn (fn [msg ...]
               (io.stderr:write (.. "Warning: " msg "\n"))
               ...)
        fmt (match (pcall require :fnlfmt)
              (fmt-ok {: fnlfmt}) fnlfmt
              (->> (match (pcall require :fennel)
                     (ok {: view}) view
                     tostring)
                   (warn "Failed to load fnlfmt; try checking package.path")))
        out (fmt (macroexpand expr _SCOPE))]
    (if return-string?
        out
        (print (pick-values 1 (string.gsub out "\n$" ""))))))

(case (type lines)
  :string lines
  :table (concat-lines lines options indent force-multi-line?)
  _ (error "__fennelview metamethod must return a table of lines"))

(match-try (channel.get-or-make state cstate channel-name)
  ch (ch.allowed? cstate.nick (if (= ?key "") nil ?key))
  true (ch.join cstate.nick cstate.conn)
  _ (tset state.channels channel-name ch)
  (catch (_ cmd msg) (state:send cstate cmd msg)))

;; TODO: should be a newline here after catch
