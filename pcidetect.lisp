 ;; This software is part of the mon tools package                      
 ;; Copyright (c) 2008-2013  Bonzai BSD Intellectual Property           
 ;; and is licensed under the                                           
 ;; Common Public License, Version 1.6                                  
 ;; by Bonzai Intellectual Property                                     
 ;; A copy of the License is available at                               
 ;; http://www.opensource.org/licenses/cpl1.0.txt                       
 ;;  cneirabustos@gmail.com                                             

(ql:quickload "cffi")
;(ql:quickload "clawk")
(defpackage :cffi-user
  (:use :common-lisp :cffi :clawk))

(in-package :cffi-user)

(define-foreign-library libsys
  (:unix (:or "./libsys.so" "libsys.so" ))
  (t (:default "libsys")))

;There is currently a bug in cffi or sbcl all functions must not contain a _ or they will not
;be found error : alien function ,etc..

(use-foreign-library libsys)

;function prototype definitions
(defcfun "searchpci"  :string )
(defcfun "loadko"  :int ( ko :string ))
;end prototype 

;(loadko "sound")
;create plist with all pci devices connected

(defparameter allpci (concatenate 'string "(" (searchpci) ")"))
(defparameter *pci_devices* (read-from-string allpci))

;example get class from pci element 0 element in list 

(getf (getf z :pci0 ) :device )


;generate sound drivers pclist 


(defparameter *soundcards* (make-hash-table))
;nvidia ones


(gethash 'snd_ich *soundcards*)
(gethash 'snd_hda *soundcards*)
(gethash '0x00da10de *soundcards*)


(setf (gethash '0x00da10de  *soundcards*) 'snd_hda ) 
(setf (gethash '0x03f010de *soundcards*) 'snd_hda ) 
(setf (gethash '0x037110de *soundcards*) 'snd_hda ) 
(setf (gethash '0x026c10de *soundcards*) 'snd_hda ) 
(setf (gethash '0x03e410de *soundcards*) 'snd_hda ) 
(setf (gethash '0x044a10de *soundcards*) 'snd_hda ) 
(setf (gethash '0x044b10de *soundcards*) 'snd_hda ) 
(setf (gethash '0x055c10de *soundcards*) 'snd_hda ) 
(setf (gethash '0x055d10de *soundcards*) 'snd_hda ) 
(setf (gethash '0xffff10de *soundcards*) 'snd_hda ) 
(setf (gethash '0x293e8086 *soundcards*) 'snd_hda ) 
(setf (gethash '0x27d88086 *soundcards*) 'snd_hda ) 
(setf (gethash '0x26688086 *soundcards*) 'snd_hda ) 
(setf (gethash '0x284b8086 *soundcards*) 'snd_hda ) 
(setf (gethash '0x269a8086 *soundcards*) 'snd_hda ) 
(setf (gethash '0xd6008086 *soundcards*) 'snd_hda ) 
(setf (gethash '0xffff8086 *soundcards*) 'snd_hda ) 
(setf (gethash '0x75021039 *soundcards*) 'snd_hda ) 
(setf (gethash '0xffff1039 *soundcards*) 'snd_hda ) 
(setf (gethash '0x32881106 *soundcards*) 'snd_hda ) 
(setf (gethash '0xffff1106 *soundcards*) 'snd_hda ) 
(setf (gethash '0x437b1002 *soundcards*) 'snd_hda ) 
(setf (gethash '0x43831002 *soundcards*) 'snd_hda ) 
(setf (gethash '0xffff1002 *soundcards*) 'snd_hda ) 
(setf (gethash '0x30b5103c *soundcards*) 'snd_hda ) 
(setf (gethash '0x30a2103c *soundcards*) 'snd_hda ) 
(setf (gethash '0x30aa103c *soundcards*) 'snd_hda ) 
(setf (gethash '0x30b0103c *soundcards*) 'snd_hda ) 
(setf (gethash '0x3013103c *soundcards*) 'snd_hda ) 
(setf (gethash '0x3010103c *soundcards*) 'snd_hda ) 
(setf (gethash '0x30a5103c *soundcards*) 'snd_hda ) 
(setf (gethash '0x2801103c *soundcards*) 'snd_hda ) 
(setf (gethash '0x2802103c *soundcards*) 'snd_hda ) 
(setf (gethash '0xffff103c *soundcards*) 'snd_hda ) 
(setf (gethash '0x01cc1028 *soundcards*) 'snd_hda ) 
(setf (gethash '0x01c91028 *soundcards*) 'snd_hda ) 
(setf (gethash '0x01d71028 *soundcards*) 'snd_hda ) 
(setf (gethash '0x01da1028 *soundcards*) 'snd_hda ) 
(setf (gethash '0xffff1028 *soundcards*) 'snd_hda ) 
(setf (gethash '0x09001558 *soundcards*) 'snd_hda ) 
(setf (gethash '0xffff1558 *soundcards*) 'snd_hda ) 
(setf (gethash '0x010f1025 *soundcards*) 'snd_hda ) 
(setf (gethash '0x01271025 *soundcards*) 'snd_hda ) 
(setf (gethash '0x012f1025 *soundcards*) 'snd_hda ) 
(setf (gethash '0x01101025 *soundcards*) 'snd_hda ) 
(setf (gethash '0xffff1025 *soundcards*) 'snd_hda ) 
(setf (gethash '0x19931043 *soundcards*) 'snd_hda ) 
(setf (gethash '0x12631043 *soundcards*) 'snd_hda ) 
(setf (gethash '0x11531043 *soundcards*) 'snd_hda ) 
(setf (gethash '0x81cb1043 *soundcards*) 'snd_hda ) 
(setf (gethash '0x13231043 *soundcards*) 'snd_hda ) 
(setf (gethash '0x13c21043 *soundcards*) 'snd_hda ) 
(setf (gethash '0x12631043 *soundcards*) 'snd_hda ) 
(setf (gethash '0x19711043 *soundcards*) 'snd_hda ) 
(setf (gethash '0x13381043 *soundcards*) 'snd_hda ) 
(setf (gethash '0x81e71043 *soundcards*) 'snd_hda ) 
(setf (gethash '0x82341043 *soundcards*) 'snd_hda ) 
(setf (gethash '0x81cb1043 *soundcards*) 'snd_hda ) 
(setf (gethash '0x81ec1043 *soundcards*) 'snd_hda ) 
(setf (gethash '0xcb841043 *soundcards*) 'snd_hda ) 
(setf (gethash '0xffff1043 *soundcards*) 'snd_hda ) 
(setf (gethash '0x02f61014 *soundcards*) 'snd_hda ) 
(setf (gethash '0xffff1014 *soundcards*) 'snd_hda ) 
(setf (gethash '0x206617aa *soundcards*) 'snd_hda ) 
(setf (gethash '0x101517aa *soundcards*) 'snd_hda ) 
(setf (gethash '0xffff17aa *soundcards*) 'snd_hda ) 







