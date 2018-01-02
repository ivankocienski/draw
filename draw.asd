
(asdf:defsystem #:draw
  :description "Simple (GL based) drawing abstraction layer"
  :author "Ivan Kocienski"
  :license "MIT"
  :serial t
  :depends-on (:cl-opengl)
  :components ((:module "src"
			:components ((:file "package")
				     (:file "draw")))))
