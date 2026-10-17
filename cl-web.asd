(defsystem "cl-web"
  :version "0.0.1"
  :author "nmunro"
  :license "BSD3-Clause"
  :description ""
  :depends-on (:ningle
               :clack
	       :clack-handler-hunchentoot
	       :hunchentoot)
  :components ((:module "src"
                :serial t
                :components
                ((:file "app"))))
  :in-order-to ((test-op (test-op "cl-web/tests"))))

(defsystem "cl-web/tests"
  :author "nmunro"
  :license "BSD3-Clause"
  :depends-on ("cl-web"
               :rove)
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for cl-web"
  :perform (test-op (op c) (symbol-call :rove :run c)))

