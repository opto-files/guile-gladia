#!/usr/bin/guile -s
!#

(define sq
  (lambda (n)
    (expt n 2)))

(define pi (* 4 (atan 1.0)))

(define deg-to-rad
  (lambda (t)	                
    (/ (* t pi) 180)))

(define rad-to-deg
  (lambda (t)		
    (/ (* t 180) pi)))
