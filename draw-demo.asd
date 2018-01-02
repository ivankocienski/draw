(asdf:defsystem #:draw-demo
  :description "Demo of draw system"
  :author "Ivan Kocienski"
  :license "MIT"
  :serial t
  :depends-on (:cl-opengl :cl-glfw3 :draw)
  :components ((:file "src/demo.lisp")))
