(asdf:oos 'asdf:load-op :cffi)
   
  ;;; Nothing special about the "CFFI-USER" package.  We're just
  ;;; using it as a substitute for your own CL package.
  (defpackage :cffi-user
    (:use :common-lisp :cffi))
   
  (in-package :cffi-user)
   
  (define-foreign-library libcurl
    (:unix (:or "libcurl.so.3" "libcurl.so"))
    (t (:default "libcurl")))
   
  (use-foreign-library libcurl)
