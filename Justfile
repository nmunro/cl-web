# Prints this message
default:
    @just --list

install:
    @qlot install

run:
    @echo "Starting..."
    @exec qlot exec ros run \
      --eval "(push #P\"/cl-web/\" asdf:*central-registry*)" \
      --eval "(ql:quickload '(:cl-web :slynk :clack :slynk/mrepl))" \
      --eval "(setf (symbol-value (find-symbol \"*USE-DEDICATED-OUTPUT-STREAM*\" :slynk-mrepl)) nil)" \
      --eval "(slynk:create-server :port 4005 :dont-close t :interface \"0.0.0.0\")" \
      --eval "(clack:clackup #P\"src/app.lisp\" :server :hunchentoot :address \"0.0.0.0\" :port 8000 :use-thread nil)"
