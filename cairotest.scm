#!/usr/bin/guile -s
!#

(use-modules (cairo))
(load "vec.scm")
(load "rand.scm")

(define surf (cairo-image-surface-create 'argb32 1000 1000))
(define cr (cairo-create surf))

(cairo-set-source-rgba cr 0 0 0 0.4)

(define draw
  (lambda (n m d)
    (let ((v (normvector m d)))
    (cond ((= 0 n)
	   (cairo-stroke cr))
      (else
	(cairo-move-to cr (x v) (y v))
	(cairo-line-to cr (+ 1 (x v)) (+ 1 (y v)))
	(draw (- n 1) m d))))))

(draw 100000 500 200)
(draw 5000 400 50)
(cairo-surface-write-to-png surf "guile-cairo.png")
