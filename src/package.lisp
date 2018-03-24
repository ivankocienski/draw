(defpackage :draw
  (:use :cl )
  (:export :configure
	   :set-clear-color
	   :set-color
	   :clear
	   :line
	   :box
	   :filled-box
	   :texture-box
	   :circle
	   :text
	   :sub-region
     :with-sub-region))
