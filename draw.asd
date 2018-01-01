
(asdf:defsystem #:draw
  :description "Simple (GL based) drawing abstraction layer"
  :author "Ivan Kocienski"
  :license "MIT"
  :serial t
  :dependencies '(:cl-opengl)
  :components ((:module "src"
			:components ((:file "package")
				     (:file "draw")
				     (:file "demo")))))

(asdf:defsystem #:draw
  :description "Simple (GL based) drawing abstraction layer"
  :author "Ivan Kocienski"
  :license "MIT"
  :serial t
  :dependencies '(:cl-opengl)
  :components ((:module "src"
			:components ((:file "package")
				     (:file "draw")
				     (:file "demo")))))
(asdf:defsystem #:draw-demo
  :description "Demo of draw system"
  :author "Ivan Kocienski"
  :license "MIT"
  :serial t
  :dependencies '(:cl-opengl)
  :components ((:file "src/demo.lisp")))
