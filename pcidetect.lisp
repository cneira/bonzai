(ql:quickload "cffi")
(defpackage :cffi-user
  (:use :common-lisp :cffi))

(in-package :cffi-user)

(define-foreign-library libsys
  (:unix (:or "./libsys.so" "libsys.so" ))
  (t (:default "libsys")))

;There is currently a bug in cffi or sbcl all functions must not contain a _ or they will not
;be found error : alien function ,etc..

(use-foreign-library libsys)
(defcfun "searchpci"  :string )

(defvar a (searchpci))
;transform to list the string with pci devices
(defvar b 
(concatenate 'list  
		(with-input-from-string 
		    (str a) 
		  (loop for x = (read str nil str) 
		     until (eq x str) collect x ))
		)
) 
;get class from 4th element in list 
(getf (getf (nth 4 b) :pci4 ) :class ) 











