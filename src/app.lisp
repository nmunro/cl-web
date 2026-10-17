(defvar *app* (make-instance 'ningle:app))

(setf (ningle:route *app* "/")
      "Welcome to ningle!")

(clack:clackup *app* :server :hunchentoot :address "0.0.0.0" :port 5000)
