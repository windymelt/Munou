(use srfi-1)
(define ORIG_TEXT '())
;;;markov:単独単語のみの入力は致命的となるため事前に確認が必要。
(define markov (lambda (text)
		 (cons 
		   
		   (cons
		     (car text)
		     (car (cdr text)))
		   
		   (if (eqv? (cdr (cdr text)) '())
		     (cons (cons (cdr text) '()) '())
		     (markov (cdr text))))))
(define countnumber (lambda (mother child) 
		      (fold + 0 
			    (map (lambda (x) (if (equal? x child) 1 0))
				 mother))
		      ))
(define makehashtable (lambda (args) (makehashtable+ args (delete-duplicates args))))
(define makehashtable+ (lambda (args args-nodup)
			(cons (cons (car args-nodup) (countnumber args args-nodup)) (if (eqv? (cdr args-nodup) '()) '() (makehashtable+ args (cdr args-nodup))))))

(define (main argv)
  (begin
    (load (car (cdr argv)))
    (display (map markov *ORIGINAL*))
  )
  )
