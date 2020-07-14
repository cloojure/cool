
(.alert js/window   "It works!")      ; most reliable(?)
(js/alert           "Another way.")

(def d (js/Date.))
;=> #'cljs.user/d
d
;=> #inst "2016-04-03T21:04:29.908-00:00"
(.getFullYear d)
;=> 2016
(.toUpperCase "doh!")
;=> "DOH!"

(def year-field (.getElementById js/document "years"))
;=> #<[object HTMLInputElement]>
(.-value year-field)
;=> "24"
(set! (.-value year-field) "25")
;=> "25"

(def y (dom/getElement "years"))
;=> #'age.core/y
age.core=> (set! (.-value y) "26")
;=> "26"

(dom/setTextContent (dom/getElement "feedback") "This works!")
;=> nil

