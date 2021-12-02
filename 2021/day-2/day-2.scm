;;; part 1
(define operate-submarine-aux
    (lambda (instructions forward depth)
        (cond
            ((null? instructions) (* forward depth))
            ((equal? (car instructions) 'forward)
                (operate-submarine-aux (cddr instructions) (+ forward (cadr instructions)) depth))
            ((equal? (car instructions) 'up)
                (operate-submarine-aux (cddr instructions) forward (- depth (cadr instructions))))
            (else (operate-submarine-aux (cddr instructions) forward (+ depth (cadr instructions))))
        )))

(define operate-submarine
    (lambda (instructions)
        (operate-submarine-aux instructions 0 0)))

;;; part 2

(define operate-submarine-aim-aux
    (lambda (instructions forward depth aim)
        (cond
            ((null? instructions) (* forward depth))
            ((equal? (car instructions) 'forward)
                (operate-submarine-aim-aux (cddr instructions) (+ forward (cadr instructions)) 
                    (+ depth (* (cadr instructions) aim)) aim))
            ((equal? (car instructions) 'up)
                (operate-submarine-aim-aux (cddr instructions) forward depth (- aim (cadr instructions))))
            (else (operate-submarine-aim-aux (cddr instructions) forward depth (+ aim (cadr instructions)))))))

(define operate-submarine-aim
    (lambda (instructions)
        (operate-submarine-aim-aux instructions 0 0 0)))
