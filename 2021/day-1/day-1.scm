;;; part 1
(define sonar-sweep-aux
    (lambda (sweep previous count)
        (cond
            ((null? sweep) count)
            ((> (car sweep) previous) 
                (sonar-sweep-aux (cdr sweep) (car sweep) (+ count 1)))
            (else (sonar-sweep-aux (cdr sweep) (car sweep) count)))))

(define sonar-sweep
    (lambda (sweep)
        (sonar-sweep-aux sweep -1 -1)))

;;; part 2
(define sum
    (lambda (sweep-3 sum-up)
        (cond
            ((null? sweep-3) sum-up)
            (else (sum (cdr sweep-3) (+ sum-up (car sweep-3)))))))

(define sonar-sweep-aux-3
    (lambda (sweep previous count)
        (cond
            ((< (length sweep) 3) count)
            ((> (sum (list (car sweep) (cadr sweep) (caddr sweep)) 0) previous) 
                    (sonar-sweep-aux-3 (cdr sweep) (sum (list (car sweep) (cadr sweep) (caddr sweep)) 0) (+ count 1)))
            (else 
                    (sonar-sweep-aux-3 (cdr sweep) (sum (list (car sweep) (cadr sweep) (caddr sweep)) 0) count)))))


(define sonar-sweep-3
    (lambda (sweep)
        (sonar-sweep-aux-3 sweep -1 -1)))
