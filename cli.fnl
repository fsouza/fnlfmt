(local fmt (require :fnlfmt))

(fn format [filename]
  (let [f (match filename
            :- io.stdin
            _ (assert (io.open filename :r) "File not found."))
        contents (f:read :*all)]
    (f:close)
    (print (fmt.fmt contents))))

(fn help []
  (print "Usage: fnlfmt FILENAME")
  (print "Prints the reformatted file to standard out."))

(if (or (not= (# arg) 1)
        (. {"--help" "-h" "-?" "help"} (. arg 1)))
    (help)
    (format (. arg 1)))
