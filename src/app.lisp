(defpackage cl-web
  (:use :cl)
  (:import-from :cl-web/tron
                :defroute)
  (:import-from :cl-web/controllers
                :index))

(in-package cl-web)

(defvar *app* (make-instance 'ningle:app))

(defroute *app* "/" #'index)

*app*
