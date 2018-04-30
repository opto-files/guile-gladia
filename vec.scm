#!/usr/bin/guile -s
!#

(load "util.scm")
; Since we have a great constructor in Guile already i.e. (vector )
; we only need to get on with the selectors

(define x 
  (lambda (v)
    (vector-ref v 0)))

(define y 
  (lambda (v)
    (vector-ref v 1)))

; Now to get on with the methods we might like to carry out on these vectors

(define invert
  (lambda (v)
    (vector
      (* -1 (x v))
      (* -1 (y v)))))

(define vector-add
  (lambda (v1 v2)
    (vector
      (+ (x v1) (x v2))
      (+ (y v1) (y v2)))))

(define vector-sub
  (lambda (v1 v2)
    (vector
      (+ (x v1) (* -1 (x v2)))
      (+ (y v1) (* -1 (y v2))))))

(define vector-scale
  (lambda (v s)
    (vector
      (* (x v) s)
      (* (y v) s))))

(define dot-product
  (lambda (v1 v2)
    (+
      (* (x v1) (x v2))
      (* (y v1) (y v2)))))

(define mag
  (lambda (v)
    (sqrt 
      (+
	(sq (x v))
	(sq (y v))))))

(define magsq
  (lambda (v)
    (sq (mag v))))

(define normalize
  (lambda (v)
    (let ((m (mag v)))

    (vector
      (/ (x v) m)
      (/ (y v) m)))))

(define withmag
  (lambda (v s)
    (vector-scale (normalize v) s)))

(define limit
  (lambda (v s)
    (if (> (mag v) s)
	(withmag v s)
	v)))

(define rotate
  (lambda (v t c)
    (let ((xnew (- (x v) (x c)))
	  (ynew (- (y v) (y c)))
	  (d (deg-to-rad t)))

      (vector-add
	(vector
	(-
	  (* xnew (cos d))
	  (* ynew (sin d)))

	(+
	  (* ynew (cos d))
	  (* xnew (sin d))))
	c))))

(define find-vector
  (lambda (v1 v2)
    (vector 
      (- (x v1) (x v2))
      (- (y v1) (y v2)))))

(define ang
  (lambda (v1 v2 v3)
    (let ((a (mag (find-vector v2 v3)))
	  (b (mag (find-vector v1 v2)))
	  (c (mag (find-vector v1 v3))))

      (rad-to-deg 
	(acos
	  (/ 
	    (- (+ (sq a) (sq b)) (sq c))
	    (* 2 a b)))))))





