(in-package :draw)

(defconstant +font-texture-width+ 128)
(defconstant +font-texture-height+ 128)
(defconstant +font-texture-data+
  #(#x87 #x77 #x87 #x77 #x87 #x77 #x87 #x77 #x87 #x77 #x87 #x77 #x87 #x77 #x87 #x7f 
    #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x00 #x81 #x06 #x81 #x00 #x81 #x0b #x81 #x0c 
    #x82 #x05 #x81 #x06 #x81 #x03 #x81 #x31 #x80 #x09 #x81 #x06 #x81 #x00 #x81 #x01 
    #x81 #x00 #x81 #x03 #x84 #x09 #x81 #x00 #x81 #x04 #x81 #x05 #x81 #x05 #x81 #x2f 
    #x81 #x09 #x81 #x05 #x81 #x00 #x81 #x01 #x86 #x01 #x81 #x0e #x82 #x04 #x81 #x06 
    #x81 #x05 #x81 #x2e #x81 #x0a #x81 #x0d #x81 #x00 #x81 #x03 #x83 #x0a #x82 #x0e 
    #x81 #x05 #x81 #x1c #x83 #x0c #x81 #x0b #x81 #x0d #x81 #x00 #x81 #x06 #x81 #x08 
    #x81 #x00 #x81 #x00 #x80 #x0b #x81 #x05 #x81 #x2c #x81 #x1b #x86 #x01 #x84 #x09 
    #x81 #x01 #x81 #x0c #x81 #x05 #x81 #x15 #x81 #x0d #x81 #x03 #x81 #x0d #x81 #x0d 
    #x81 #x00 #x81 #x04 #x81 #x0b #x82 #x00 #x81 #x0c #x81 #x03 #x81 #x16 #x81 #x0d 
    #x81 #x03 #x80 #x67 #x81 #x7f #x1d #x83 #x04 #x81 #x04 #x83 #x03 #x83 #x02 #x81 
    #x00 #x81 #x02 #x85 #x02 #x83 #x02 #x85 #x02 #x83 #x03 #x83 #x13 #x86 #x10 #x83 
    #x02 #x81 #x01 #x81 #x02 #x82 #x03 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x01 #x81 
    #x00 #x81 #x02 #x81 #x05 #x81 #x01 #x81 #x05 #x81 #x01 #x81 #x01 #x81 #x01 #x81 
    #x01 #x81 #x03 #x81 #x0b #x80 #x06 #x80 #x0e #x81 #x01 #x81 #x01 #x81 #x00 #x82 
    #x03 #x81 #x07 #x81 #x05 #x81 #x01 #x81 #x00 #x81 #x02 #x84 #x02 #x81 #x08 #x81 
    #x02 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x03 #x81 #x0a #x80 #x00 #x82 #x00 #x80 
    #x00 #x80 #x00 #x80 #x11 #x81 #x01 #x82 #x00 #x81 #x03 #x81 #x06 #x81 #x04 #x82 
    #x02 #x85 #x01 #x81 #x01 #x81 #x01 #x84 #x05 #x81 #x03 #x83 #x03 #x84 #x10 #x80 
    #x01 #x80 #x01 #x82 #x00 #x80 #x10 #x81 #x02 #x81 #x01 #x81 #x03 #x81 #x05 #x81 
    #x07 #x81 #x04 #x81 #x06 #x81 #x01 #x81 #x01 #x81 #x03 #x81 #x03 #x81 #x01 #x81 
    #x05 #x81 #x03 #x81 #x0a #x80 #x01 #x80 #x01 #x80 #x00 #x80 #x00 #x80 #x0f #x81 
    #x03 #x81 #x01 #x81 #x03 #x81 #x04 #x81 #x04 #x81 #x01 #x81 #x04 #x81 #x02 #x81 
    #x01 #x81 #x01 #x81 #x01 #x81 #x03 #x81 #x03 #x81 #x01 #x81 #x01 #x81 #x01 #x81 
    #x03 #x81 #x0a #x80 #x01 #x80 #x01 #x80 #x00 #x80 #x00 #x80 #x16 #x83 #x03 #x83 
    #x02 #x85 #x02 #x83 #x05 #x81 #x03 #x83 #x03 #x83 #x04 #x81 #x04 #x83 #x03 #x83 
    #x12 #x80 #x06 #x80 #x10 #x81 #x64 #x86 #x17 #x85 #x02 #x83 #x02 #x84 #x03 #x83 
    #x02 #x84 #x02 #x85 #x01 #x85 #x02 #x83 #x02 #x81 #x01 #x81 #x01 #x85 #x03 #x83 
    #x01 #x81 #x01 #x81 #x01 #x81 #x04 #x81 #x02 #x81 #x01 #x81 #x01 #x81 #x02 #x83 
    #x01 #x81 #x03 #x81 #x00 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x01 #x81 
    #x01 #x81 #x00 #x82 #x01 #x81 #x05 #x81 #x05 #x81 #x01 #x81 #x01 #x81 #x01 #x81 
    #x03 #x81 #x06 #x81 #x02 #x81 #x00 #x81 #x02 #x81 #x04 #x82 #x00 #x82 #x01 #x82 
    #x00 #x81 #x01 #x81 #x01 #x81 #x00 #x80 #x01 #x81 #x01 #x80 #x00 #x81 #x01 #x81 
    #x01 #x81 #x01 #x81 #x01 #x81 #x05 #x81 #x01 #x81 #x01 #x81 #x05 #x81 #x05 #x81 
    #x05 #x81 #x01 #x81 #x03 #x81 #x06 #x81 #x02 #x83 #x03 #x81 #x04 #x86 #x01 #x85 
    #x01 #x81 #x01 #x81 #x00 #x80 #x00 #x80 #x03 #x80 #x00 #x85 #x01 #x84 #x02 #x81 
    #x05 #x81 #x01 #x81 #x01 #x84 #x02 #x84 #x02 #x81 #x05 #x85 #x03 #x81 #x06 #x81 
    #x02 #x83 #x03 #x81 #x04 #x86 #x01 #x85 #x01 #x81 #x01 #x81 #x00 #x80 #x00 #x80 
    #x03 #x80 #x00 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x05 #x81 #x01 #x81 
    #x01 #x81 #x05 #x81 #x05 #x81 #x00 #x82 #x01 #x81 #x01 #x81 #x03 #x81 #x06 #x81 
    #x02 #x84 #x02 #x81 #x04 #x81 #x00 #x80 #x00 #x81 #x01 #x81 #x00 #x82 #x01 #x81 
    #x01 #x81 #x00 #x80 #x01 #x81 #x01 #x80 #x00 #x81 #x01 #x81 #x01 #x81 #x01 #x81 
    #x01 #x81 #x01 #x81 #x01 #x81 #x00 #x82 #x01 #x81 #x05 #x81 #x05 #x81 #x01 #x81 
    #x01 #x81 #x01 #x81 #x03 #x81 #x03 #x81 #x00 #x81 #x02 #x81 #x00 #x82 #x01 #x81 
    #x04 #x81 #x02 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x00 #x81 #x03 #x81 
    #x00 #x81 #x01 #x81 #x01 #x84 #x03 #x83 #x02 #x84 #x02 #x85 #x01 #x81 #x06 #x84 
    #x01 #x81 #x01 #x81 #x01 #x85 #x02 #x82 #x03 #x81 #x01 #x81 #x01 #x85 #x00 #x81 
    #x02 #x81 #x01 #x81 #x01 #x81 #x02 #x83 #x02 #x85 #x79 #x84 #x03 #x83 #x02 #x84 
    #x03 #x83 #x02 #x85 #x01 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x00 #x81 #x02 #x81 
    #x01 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x01 #x85 #x29 #x81 #x01 #x81 #x01 #x81 
    #x01 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x03 #x81 #x03 #x81 #x01 #x81 
    #x01 #x81 #x01 #x81 #x00 #x81 #x02 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x01 #x81 
    #x05 #x81 #x29 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x01 #x81 
    #x07 #x81 #x03 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x00 #x81 #x02 #x81 #x02 #x83 
    #x03 #x80 #x01 #x80 #x05 #x81 #x2a #x84 #x02 #x81 #x01 #x81 #x01 #x84 #x03 #x83 
    #x04 #x81 #x03 #x81 #x01 #x81 #x02 #x80 #x01 #x80 #x01 #x81 #x02 #x81 #x03 #x81 
    #x04 #x83 #x04 #x81 #x2b #x81 #x05 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x05 #x81 
    #x03 #x81 #x03 #x81 #x01 #x81 #x02 #x83 #x01 #x81 #x00 #x80 #x00 #x81 #x02 #x83 
    #x04 #x81 #x04 #x81 #x2c #x81 #x05 #x81 #x00 #x81 #x02 #x81 #x01 #x81 #x01 #x81 
    #x01 #x81 #x03 #x81 #x03 #x81 #x01 #x81 #x03 #x81 #x02 #x85 #x02 #x81 #x01 #x81 
    #x03 #x81 #x03 #x81 #x2d #x81 #x06 #x81 #x00 #x81 #x01 #x81 #x01 #x81 #x02 #x83 
    #x04 #x81 #x04 #x83 #x04 #x81 #x03 #x81 #x00 #x81 #x02 #x81 #x01 #x81 #x03 #x81 
    #x03 #x85 #x7f #x39 #x81 #x11 #x81 #x0b #x82 #x0a #x81 #x07 #x81 #x06 #x81 #x02 
    #x81 #x07 #x81 #x2b #x81 #x11 #x81 #x0a #x81 #x0c #x81 #x15 #x81 #x07 #x81 #x24 
    #x82 #x00 #x80 #x01 #x84 #x03 #x83 #x03 #x84 #x02 #x83 #x02 #x84 #x03 #x83 #x02 
    #x84 #x04 #x81 #x06 #x81 #x02 #x81 #x01 #x81 #x03 #x81 #x02 #x80 #x00 #x80 #x00 
    #x81 #x02 #x80 #x00 #x82 #x03 #x83 #x0a #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x01 
    #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x02 #x81 #x04 #x81 #x01 
    #x81 #x01 #x81 #x01 #x81 #x03 #x81 #x06 #x81 #x02 #x81 #x00 #x81 #x04 #x81 #x02 
    #x86 #x01 #x85 #x01 #x81 #x01 #x81 #x09 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x01 
    #x81 #x05 #x81 #x01 #x81 #x01 #x84 #x03 #x81 #x04 #x81 #x01 #x81 #x01 #x81 #x01 
    #x81 #x03 #x81 #x06 #x81 #x02 #x83 #x05 #x81 #x02 #x81 #x00 #x80 #x00 #x81 #x01 
    #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x09 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x01 
    #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x06 #x81 #x05 #x84 #x01 #x81 #x01 
    #x81 #x03 #x81 #x06 #x81 #x02 #x81 #x00 #x82 #x03 #x81 #x02 #x81 #x00 #x80 #x00 
    #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x0a #x82 #x00 #x80 #x01 #x80 #x00 
    #x82 #x03 #x83 #x03 #x82 #x00 #x80 #x02 #x83 #x03 #x81 #x08 #x81 #x01 #x81 #x01 
    #x81 #x03 #x81 #x03 #x81 #x00 #x81 #x02 #x81 #x01 #x81 #x03 #x81 #x02 #x81 #x00 
    #x80 #x00 #x81 #x01 #x81 #x01 #x81 #x02 #x83 #x3a #x84 #x13 #x82 #x4d #x81 #x7d 
    #x81 #x5b #x80 #x00 #x82 #x03 #x82 #x00 #x80 #x01 #x80 #x00 #x82 #x03 #x84 #x01 
    #x85 #x01 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x02 #x81 #x00 #x81 #x01 
    #x81 #x01 #x81 #x01 #x81 #x01 #x85 #x29 #x81 #x01 #x81 #x01 #x81 #x01 #x81 #x01 
    #x81 #x01 #x81 #x01 #x81 #x07 #x81 #x03 #x81 #x01 #x81 #x02 #x80 #x01 #x80 #x02 
    #x81 #x02 #x81 #x01 #x83 #x03 #x80 #x01 #x80 #x05 #x81 #x2a #x81 #x01 #x81 #x01 
    #x81 #x01 #x81 #x01 #x81 #x06 #x83 #x04 #x81 #x03 #x81 #x01 #x81 #x02 #x83 #x02 
    #x81 #x00 #x80 #x00 #x81 #x02 #x81 #x04 #x83 #x04 #x81 #x2b #x84 #x03 #x84 #x01 
    #x81 #x09 #x81 #x03 #x81 #x03 #x81 #x01 #x81 #x03 #x81 #x03 #x86 #x01 #x83 #x04 
    #x81 #x04 #x81 #x2c #x81 #x09 #x81 #x01 #x81 #x05 #x84 #x04 #x81 #x04 #x82 #x00 
    #x80 #x03 #x81 #x04 #x81 #x00 #x81 #x01 #x81 #x01 #x81 #x03 #x81 #x03 #x85 #x29 
    #x81 #x09 #x81 #x3a #x81 #x7f #x32 #x80 #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f 
    #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f 
    #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f 
    #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f #x7f 
    #x7f #x7f #x7f #x7f #x7f #x7f #x7f))

;;
;; this is basically a thin wrapper aroun GL.
;;  there is no beautiful GL code :(
;;

(defparameter *font-surface* nil)
(defparameter *font-list* nil)
(defparameter *draw-height* 0)
(defparameter *draw-width* 0)

(defun -deflate-font ()
  (labels ((decode-rle (num)
	     (values (if (= (logand 128 num) 128) 255 0)
		     (logand 127 num)))
	   (repeat-pixel (thing count)
	     (loop for x from 1 to count
		appending (list thing thing thing thing))))
    
    (make-array (* +font-texture-width+
		   +font-texture-height+
		   4)
		:element-type '(unsigned-byte 8)
		:adjustable nil
		:initial-contents (loop for b across +font-texture-data+
				     appending (multiple-value-bind (color count) (decode-rle b)
						 (repeat-pixel color (1+ count)))))))

(defun -init-font ()

  (setf *font-surface* (first (gl:gen-textures 1))
	*font-list* (gl:gen-lists 128))
  
  (gl:bind-texture :texture-2d *font-surface*)
  (gl:tex-parameter :TEXTURE-2D :TEXTURE-MIN-FILTER :NEAREST )
  (gl:tex-parameter :TEXTURE-2D :TEXTURE-MAG-FILTER :NEAREST )
  (gl:tex-parameter :TEXTURE-2D :TEXTURE-WRAP-S :CLAMP)
  (gl:tex-parameter :TEXTURE-2D :TEXTURE-WRAP-T :CLAMP)

  (gl:tex-image-2d :TEXTURE-2D
		   0
		   :RGBA
		   +font-texture-width+
		   +font-texture-height+
		   0 ;; border
		   :RGBA
		   :UNSIGNED-BYTE
		   (-deflate-font))

  (let ((ix 0.0) (iy 0.0))
    (dotimes (char 128)

      (gl:new-list (+ *font-list* char) :compile)

      (let ((x1 (/ ix (float +font-texture-width+)))
	    (y1 (/ iy (float +font-texture-height+)))
	    (x2 (/ (+ ix 8.0) (float +font-texture-width+)))
	    (y2 (/ (+ iy 8.0) (float +font-texture-height+))))
	  
	  (gl:with-primitives :quads
	    (gl:tex-coord x1 y1) (gl:vertex 0 0)
	    (gl:tex-coord x2 y1) (gl:vertex 8 0)
	    (gl:tex-coord x2 y2) (gl:vertex 8 8)
	    (gl:tex-coord x1 y2) (gl:vertex 0 8))

	  (gl:translate 8 0 0))

      (gl:end-list)
      (incf ix 8)
      (when (>= ix +font-texture-width+)
	(setf ix 0)
	(incf iy 8)))))
  

(defun configure (width height)
  (setf *draw-width*  width
	*draw-height* height)
  
  (gl:viewport 0 0 width height)
  
  (gl:matrix-mode :projection)
  (gl:ortho 0.0 width height 0.0 -1.0 1.0)

  (gl:matrix-Mode :MODELVIEW)
  (gl:load-identity)

  (gl:enable :SCISSOR-TEST)

  (gl:clear-color 0.0 0.0 0.0 0.0)

  (gl:enable :TEXTURE-2D)
  (gl:enable :BLEND)
  (gl:blend-func :SRC-ALPHA :ONE-MINUS-SRC-ALPHA)
  
  (-init-font)

  (gl:list-base *font-list*))

(defun set-clear-color (r g b)
  (gl:clear-color r g b 0.0))
  
(defun set-color (r g b)
  (gl:color r g b))

(defun clear ()
  (gl:clear :color-buffer))

(defun line (x1 y1 x2 y2)
  (gl:with-primitive :lines
    (gl:tex-coord 0 0)
    (gl:vertex x1 y1)
    (gl:vertex x2 y2)))

(defun box (x1 y1 w h)
  (let ((x2 (+ x1 w))
	(y2 (+ y1 h)))
    
    (gl:with-primitive :line-loop
      (gl:tex-coord 0 0)
      (gl:vertex x1 y1)
      (gl:vertex x2 y1)
      (gl:vertex x2 y2)
      (gl:vertex x1 y2))))
  
(defun filled-box  (x1 y1 w h)
  (let ((x2 (+ x1 w))
	(y2 (+ y1 h)))
    
    (gl:with-primitive :quads
      (gl:tex-coord 0 0)
      (gl:vertex x1 y1)
      (gl:vertex x2 y1)
      (gl:vertex x2 y2)
      (gl:vertex x1 y2))))

(defun texture-box  (x1 y1 w h)
  (let ((x2 (+ x1 w))
	(y2 (+ y1 h)))
    
    (gl:with-primitive :quads
      (gl:tex-coord 0 0) (gl:vertex x1 y1)
      (gl:tex-coord 1 0) (gl:vertex x2 y1)
      (gl:tex-coord 1 1) (gl:vertex x2 y2)
      (gl:tex-coord 0 1) (gl:vertex x1 y2))))

(defun circle (cx cy rx ry &optional (steps 10))
  (let ((angle-step (/ (* 2 PI) steps)))
    
    (gl:with-primitive :line-loop
      (gl:tex-coord 0 0)
      (loop for angle from 0 to (* 2 PI) by angle-step
	 do (gl:vertex (+ cx (* rx (cos angle)))
		       (+ cy (* ry (sin angle))))))))

(defun text (x y str)
  (gl:with-pushed-matrix
    (gl:translate x y 0)
    (gl:call-lists (map 'vector #'char-code str))))

(defun sub-region (x y w h function)
  (gl:with-pushed-matrix
    (gl:scissor x (- +YRES+ (+ y h)) w h)
    (gl:translate x y 0)
      
    (funcall function)))
