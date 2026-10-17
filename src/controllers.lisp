(defpackage cl-web/controllers
  (:use :cl)
  (:export #:index))

(in-package cl-web/controllers)

(defun index (params)
  (declare (ignore params))
  "Welcome to Ningle!")
