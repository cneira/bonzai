 ;; This software is part of the mon tools package                      
 ;; Copyright (c) 2008-2013  Bonzai BSD Intellectual Property           
 ;; and is licensed under the                                           
 ;; Common Public License, Version 1.6                                  
 ;; by Bonzai Intellectual Property                                     
 ;; A copy of the License is available at                               
 ;; http://www.opensource.org/licenses/cpl1.0.txt                       
 ;;  cneirabustos@gmail.com                                             

(ql:quickload "cffi")

(defpackage :cffi-user
  (:use :common-lisp :cffi ))

(in-package :cffi-user)


;generate sound drivers pclist 

(defparameter *soundcards* (make-hash-table))

;nvidia ones

;(gethash 'snd_ich *soundcards*)
;(gethash 'snd_hda *soundcards*)
;(gethash '0x00da10de *soundcards*)

(setf (gethash '0x00da10de *soundcards*) 'snd_hda ) 
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
;snd_ich
(setf (gethash '0x01b110de *soundcards*) 'snd_ich)
(setf (gethash '0x006a10de *soundcards*) 'snd_ich)
(setf (gethash '0x008a10de *soundcards*) 'snd_ich)
(setf (gethash '0x00da10de *soundcards*) 'snd_ich)
(setf (gethash '0x026b10de *soundcards*) 'snd_ich)
(setf (gethash '0x00ea10de *soundcards*) 'snd_ich)
(setf (gethash '0x005910de *soundcards*) 'snd_ich)
(setf (gethash '0x74451022 *soundcards*) 'snd_ich)
(setf (gethash '0x746d1022 *soundcards*) 'snd_ich)
(setf (gethash '0x24c58086 *soundcards*) 'snd_ich)
(setf (gethash '0x24d58086 *soundcards*) 'snd_ich)
(setf (gethash '0x24158086 *soundcards*) 'snd_ich)
(setf (gethash '0x266e8086 *soundcards*) 'snd_ich)
(setf (gethash '0x24858086 *soundcards*) 'snd_ich)
(setf (gethash '0x24458086 *soundcards*) 'snd_ich)
(setf (gethash '0x24258086 *soundcards*) 'snd_ich)
(setf (gethash '0x71958086 *soundcards*) 'snd_ich)
(setf (gethash '0x70121039 *soundcards*) 'snd_ich)

;snd_ds1

(setf (gethash '0x000a1073 *soundcards*) 'snd_ds1)
(setf (gethash '0x000c1073 *soundcards*) 'snd_ds1)
(setf (gethash '0x00001073 *soundcards*) 'snd_ds1)
(setf (gethash '0x00101073 *soundcards*) 'snd_ds1)
(setf (gethash '0x000d1073 *soundcards*) 'snd_ds1)

;snd_emu10k1 

(setf (gethash '0x00021102  *soundcards*) 'snd_emu10k1)
(setf (gethash '0x00041102  *soundcards*) 'snd_emu10k1)
(setf (gethash '0x00071102 *soundcards*)  'snd_emu10k1)
(setf (gethash '0x10211102  *soundcards*) 'snd_emu10k1)


(setf (gethash '0x89381102 *soundcards*) 'snd_es137x)
(setf (gethash '0x50001274 *soundcards*) 'snd_es137x)
(setf (gethash '0x13711274 *soundcards*) 'snd_es137x)
(setf (gethash '0x58801274 *soundcards*) 'snd_es137x)


(setf (gethash '0x08011319 *soundcards*) 'snd_fm801)
(setf (gethash '0x08021319 *soundcards*) 'snd_fm801)
(setf (gethash '0x08011319 *soundcards*) 'snd_fm801)
(setf (gethash '0x08021319 *soundcards*) 'snd_fm801)


(setf (gethash '0x01001285 *soundcards*) 'snd_maestro)
(setf (gethash '0x01001285 *soundcards*) 'snd_maestro)
(setf (gethash '0x01001285 *soundcards*) 'snd_maestro)
(setf (gethash '0x1968125d *soundcards*) 'snd_maestro)
(setf (gethash '0x1978125d *soundcards*) 'snd_maestro)
(setf (gethash '0x1988125d *soundcards*) 'snd_maestro)
(setf (gethash '0x1998125d *soundcards*) 'snd_maestro)
(setf (gethash '0x199a125d *soundcards*) 'snd_maestro)
(setf (gethash '0x803c1033 *soundcards*) 'snd_maestro)
(setf (gethash '0x80581033 *soundcards*) 'snd_maestro)


(setf (gethash '0x800510c8 *soundcards*) 'snd_neomagic)
(setf (gethash '0x800610c8 *soundcards*) 'snd_neomagic)

(setf (gethash '0x20001023 *soundcards*) 'snd_t4dwave)
(setf (gethash '0x20011023 *soundcards*) 'snd_t4dwave)
(setf (gethash '0x70181039 *soundcards*) 'snd_t4dwave)
(setf (gethash '0x545110b9 *soundcards*) 'snd_t4dwave)
(setf (gethash '0x546110b9 *soundcards*) 'snd_t4dwave)
(setf (gethash '0x545510b9 *soundcards*) 'snd_t4dwave)


(setf (gethash '0x30591106 *soundcards*) 'snd_via8233)
(setf (gethash '0x30581106 *soundcards*) 'snd_via82c686)
(setf (gethash '0x40004005 *soundcards*) 'snd_als4000)
(setf (gethash '0x000112eb *soundcards*) 'snd_aureal)
(setf (gethash '0x011113f6 *soundcards*) 'snd_cmi)
(setf (gethash '0x60031013 *soundcards*) 'snd_csa)
(setf (gethash '0x60051013 *soundcards*) 'snd_cs4281)



;hardware detection functions 

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


(defparameter allpci (concatenate 'string "(" (searchpci) ")"))
(defparameter *pci_devices* (read-from-string allpci))


;multimedia class : 0x040100,  0x040300  

;example string
(defparameter l   (read-from-string "(  (:class 40100 :vendor 8086 :device da10de)
 (:class 40800 :vendor 8086 :device da11de))
")) 

;check only for multimedia devices
(loop for x in  *pci_devices*  
	 when ( or  (= 40800 (getf x :class)) (= 40100 (getf x :class))    )
	 collect ( getf x :device)   
	 )


(defparameter *scards* 
(loop for x in *pci_devices*  
	 when ( or  (= 40800 (getf x :class)) (= 40100 (getf x :class))    )
	 collect ( getf x :device)   
	 )
) 

(defparameter *kernel_extensions* 
(loop for x in *scards* 
      when ( not (eq NIL (gethash x *soundcards*) ) )  
       collect x)
)
;load kernel extensions
(defun load_sound 
(loop for x in *kernel_extensions* 
     do (loadko (string x)) )
)


