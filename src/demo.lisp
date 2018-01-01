(defpackage :draw-demo
  (:use :cl
	:glfw)
  (:export :main))
  
(in-package :draw-demo)

(defconstant +XRES+ 800)
(defconstant +YRES+ 600)

(defparameter *things* nil)

(defstruct thing
  xpos
  ypos
  xdir
  ydir
  r g b
  width
  height)

(defun make-random-thing (max-x max-y)
  (let ((angle (random (* 2 PI))))
    (make-thing :xpos (random max-x)
		:ypos (random max-y)
		:xdir (cos angle)
		:ydir (sin angle)
		:r (random 1.0)
		:g (random 1.0)
		:b (random 1.0)
		:width (+ 5 (random 10.0))
		:height (+ 5 (random 10.0)))))

(defun move-thing (this max-x max-y)
  (incf (thing-xpos this) (thing-xdir this))
  (incf (thing-ypos this) (thing-ydir this))

  (unless (< 0 (thing-xpos this) max-x)
    (setf (thing-xdir this) (- (thing-xdir this))))

  (unless (< 0 (thing-ypos this) max-y)
    (setf (thing-ydir this) (- (thing-ydir this)))))

(defun draw-thing (this)
  (draw:set-color (thing-r this)
		  (thing-g this)
		  (thing-b this))

  (let ((w (thing-width this))
	(h (thing-height this)))
    
    (draw:box (- (thing-xpos this) w)
	      (- (thing-ypos this) h)
	      (* 2 w)
	      (* 2 h))))


(defun init ()
  (draw:configure +XRES+ +YRES+)
  (draw:set-clear-color 0 0 0)

  (setf *things* (make-array 100
			     :initial-contents (loop for x from 0 to 99
						  collect (make-random-thing +XRES+ +YRES+)))))


(defun render ()
  (draw:clear)

  (loop for thing across *things*
     do (move-thing thing +XRES+ +YRES+)
     do (draw-thing thing))

  (draw:set-color 1 1 1)
  (draw:text 10 300 "Hello, World!"))


(defun main ()
  (with-init-window (:title "GL Window" :width +XRES+ :height +YRES+)
    
    (init)
    
    (loop until (window-should-close-p)
       do (render)
       do (swap-buffers)
       do (poll-events))))



