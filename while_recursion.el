(setq animals '(dog cat lion tiger))

animals

(while animals
  (print (car animals))
  (setq animals (cdr animals)))

;; ###############

(defun triangle-up (number-of-rows)
  "Adds up the number of pebbles in a traingle.
The first row has 1 pebble, the second row 2, the third 3, and so on.
The arg is NUMBER-OF-ROWS."
  (let ((total 0)
        (row-number 1))
    (while (<= row-number number-of-rows)
      (setq total (+ total row-number))
      (setq row-number (1+ row-number)))
    total))

(triangle-up 4)
(triangle-up 7)


(defun triangle-down (number-of-rows)
  "Return the sum of 1 through NUMBER-OF-ROWS inclusive."
  (let ((total 0))
    (while (> number-of-rows 0)
      (setq total (+ total number-of-rows))
      (setq number-of-rows (1- number-of-rows)))
    total))

(triangle-down 4)
(triangle-down 7)

(defun triangle-dotimes (number-of-rows)
  "Using `dotimes', add up the number of pebbles in a triangle."
  (let ((total 0))
    (dotimes (n number-of-rows)
      (setq total (+ total (1+ n))))
    total))

(triangle-dotimes 4)
(triangle-dotimes 7)

(defun triangle-recursive (n)
  "Add up the number of pebbles in the triangle using recursion."
  (if (= n 1)
      1
    (+ n (triangle-recursive (1- n)))))

(triangle-recursive 3)

(defun reverse-while (list)
  "Using while to reverse LIST."
  (let (reversed)
    (while list
      (setq reversed (cons (car list) reversed))
      (setq list (cdr list)))
    reversed))

(defun reverse-dolist (list)
  "Using dolist to reverse LIST."
  (let (reversed)
    (dolist (el list reversed)
      (setq reversed (cons el reversed)))))

(setq animals '(dog cat worm pigeon))
animals

(reverse-while animals)
(reverse-dolist animals)

(defun print-els-recursively (ls)
  "Print each element of LS using recursion."
  (when ls
    (print (car ls))
    (print-els-recursively (cdr ls))))

(print-els-recursively animals)


; ################### RECURSION ####################

; every
(defun square-each (ls)
  "Square each el in LS, use recursion."
  (if ls
      (let ((n (car ls)) (tail (cdr ls)))
        (cons
         (* n n)
         (square-each tail)))
    nil))

(square-each '(1 2 3))

; accumulate
(defun add-els (ls)
  "Add els of LS by recursion."
  (if (not ls)
      0
    (let ((n (car ls))
          (tail (cdr ls)))
      (+ n (add-els tail)))))

(add-els '(1 2 3 4))

; keep
(defun keep-even (ls)
  "Keep even numbers from LS using recursion."
  (if (not ls)
      nil
    (let ((n (car ls))
          (tail (cdr ls)))
      (if (= (% n 2) 0)
          (cons n (keep-even tail))
        (keep-even tail)))))

(keep-even '(1 2 3 4 5 6))

