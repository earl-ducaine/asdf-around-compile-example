

;; This file was written by Earl Ducaine and is released under the
;; MIT license.

;; Misc. ASDF stuff that's hard for me to remember.

;; Bad practice muddying up asdf package namespace.

(defpackage :around-compile-example
  (:export :*base-directory*
	   :*base-directory-synonym*))

(defparameter around-compile-example:*base-directory*
  (make-pathname :name nil :type nil :defaults *load-truename*))

(defparameter around-compile-example:*base-directory-synonym*
  around-compile-example:*base-directory*)

(asdf:defsystem :around-compile-example
  :depends-on ()
  :license "MIT-ish (also public domain, see LICENSE)"
  :author "CMU Garnet Team (plus various others, see LICENSE)"
  :description " GUI toolkit (c. 1990 look/feel)"
  :around-compile (lambda (compile-function)
		    (format t "before compile-function called~%")
		    (funcall compile-function)
		    (format t "after compile-function called~%")
  		    t)
  :components
   ((:module src
	    :pathname ""
	    ;; Needed to keep from system level :around-compile to the
	    ;; module.
	    :components
	    ((:file "around-compile-example")))))
