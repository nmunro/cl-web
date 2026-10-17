(defpackage cl-web/tron
  (:use :cl)
  (:export defroute))

(in-package cl-web/tron)

(defmacro defroute (app path &rest args)
  (unless args
    (error "DEFROUTE requires at least a controller/handler."))

  (let* ((raw-handler (car (last args)))
         (requirements (butlast args)))
    (when (oddp (length requirements))
      (error "DEFROUTE requirements must be keyword/value pairs, got: ~S" requirements))

    (let ((handler-form
            (cond
              ;; If user wrote 'pkg:fn, strip the QUOTE and then quote the symbol
              ((and (consp raw-handler) (eq (car raw-handler) 'quote))
               `',(cadr raw-handler))

              ;; If user wrote pkg:fn, quote it
              ((symbolp raw-handler)
               `',raw-handler)

              ;; Otherwise assume it's already a function designator (e.g. #'fn or (lambda ...))
              (t
               raw-handler))))

      `(setf (ningle:route ,app ,path ,@requirements)
             (lambda (params)
               (funcall ,handler-form params))))))
