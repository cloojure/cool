
(defmacro spy-term
  "Evaluates expr and outputs the form and its result to the debug log; returns 
  the result of expr."
  [expr]
  `(let [a# ~expr] (println (str '~expr " => " a#)) a#))

