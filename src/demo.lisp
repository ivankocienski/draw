(defpackage :draw-demo
  (:use :cl
	:glfw)
  (:export :main))
  
(in-package :draw-demo)

(defconstant +XRES+ 800)
(defconstant +YRES+ 600)


(defun init ()
  (draw:configure +XRES+ +YRES+)
  (draw:set-clear-color 0 0 0.5))

(defun render ()
  (draw:clear)

  (gl:bind-texture :TEXTURE-2D draw::*font-surface*)
  (draw:texture-box 10 10 128 128)

  (draw:text 10 300 "Hello, World!"))


(defun main ()
  (with-init-window (:title "GL Window" :width +XRES+ :height +YRES+)
    
    (init)
    
    (loop until (window-should-close-p)
       do (render)
       do (swap-buffers)
       do (poll-events))))



