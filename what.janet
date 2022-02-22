(def dotfile-loc
  (string
    (or (os/getenv "XDG_CONFIG_HOME") "/home/dot/.config")
    "/what"))

# maybe record hostname?
# A logfile of unix timestamps and messages
(def whatfile (string dotfile-loc "/whatfile.log"))

(def what-peg '()) #digits followed by '>' followed by the log

(defn- prepend-timestamp [& str] (string (os/time) ">" (string/join str " ") "\n"))

(defn main [& args]
  ``
  If the given arg is a string, then store the string into the whatfile with a timestamp
  If the given arg is a flag, run that flag's command
  If there is no arg, print out contents of shell-histories and the whatfile
  ``
  (let [argc (length args)
        first-arg (when (> argc 1) (1 args))
        rem-args (drop 1 args)]
    (case first-arg
      nil (os/execute ["cat" whatfile] :p)
      "--clean" (spit whatfile "")
      (spit whatfile (prepend-timestamp ;rem-args) :a))))
