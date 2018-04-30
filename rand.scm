(define randrange
  (lambda (l h)
    (let ((x (random:uniform)))
      (+ (* x (- h l)) l))))

(define randvector
  (lambda (l h)
    (vector
      (randrange l h)
      (randrange l h))))

(define randnorm
  (lambda (m d)
    (+
      (* (random:normal) d)
      m)))

(define normvector
  (lambda (m d)
    (vector
      (randnorm m d)
      (randnorm m d))))
