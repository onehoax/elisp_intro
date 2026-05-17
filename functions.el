(defun multiply-by-seven (number)
  "Multiply NUMBER by 7."
  (* 7 number))

(defun multiply-by-seven-interactive (number)
  "Multiply NUMBER by 7 interactively."
  (interactive "p")
  (message "The result is %d" (* 7 number)))

;Write an interactive function with an optional argument that tests
;whether its argument, a number, is greater than or equal to, or else,
;less than the value of ‘fill-column’, and tells you which, in a message.
;However, if you do not pass an argument to the function, use 56 as a
;default value.

(defun my-optional-func (&optional num)
  "Compare NUM to `fill-column'.

If NUM is nil, use 56."
  (interactive "P")
  (let ((n (or num 56)))
    (if (>= n fill-column)
        (message "%d is >= fill-column (%d)"
                 n fill-column)
      (message "%d is < fill-column (%d)"
               n fill-column))))

;Write a function that will display the first 60 characters of the
;current buffer, even if you have narrowed the buffer to its latter half
;so that the first line is inaccessible.  Restore point, mark, and
;narrowing.  For this exercise, you need to use a whole potpourri of
;functions, including ‘save-restriction’, ‘widen’, ‘goto-char’,
;‘point-min’, ‘message’, and ‘buffer-substring’.

(defun my-narrow-1 ()
  "Display the first 60 characters of the current buffer.

Works even if you have narrowed the buffer to its latter half so that
the first line is inaccessible."
  (interactive)
  (save-excursion
    (save-restriction
      (widen)
      (message "%s"
               (buffer-substring (point-min)
                                 (+ (point-min) 60))))))

(defun my-narrow-2 ()
  "Display the first 60 characters of the current buffer.

Works even if you have narrowed the buffer to its latter half so that
the first line is inaccessible."
  (interactive)
  (save-excursion
    (save-restriction
      (widen)
      (narrow-to-region 1 61)
      (message "%s"
               (buffer-string)))))



;Construct a list of four birds by evaluating several expressions with
;‘cons’.  Find out what happens when you ‘cons’ a list onto itself.
;Replace the first element of the list of four birds with a fish.
;Replace the rest of that list with a list of other fish.

(setq colors (cons 'red (cons 'blue (cons 'yellow ()))))

colors

(cons colors colors)

(length colors)

(nth 0 colors)

(nth 2 colors)

(nthcdr 0 colors)

(nthcdr 2 colors)

(setcar colors 'grey)

colors

(setcdr colors (list 'black 'purple 'pink 'green))

colors

(length colors)

;Write an interactive function that searches for a string.  If the
;search finds the string, leave point after it and display a message
;that says "Found!".  (Do not use ‘search-forward’ for the name of
;this function; if you do, you will overwrite the existing version
;of ‘search-forward’ that comes with Emacs.  Use a name such as
;‘test-search’ instead.)

(defun test-search (string)
  "Search for STRING forward."
  (interactive "sInput: ")
  (if (search-forward string)
      (message "Found!")))

;Write a function that prints the third element of the kill ring in
;the echo area, if any; if the kill ring does not contain a third
;element, print an appropriate message.


(defun third-element-killring ()
  "Print the 3rd element of the kill ring."
  (let ((el (car (nthcdr 2 kill-ring))))
    (if (not el)
        (message "Kill ring does not contain a 3rd element.")
      (message el))))

(setq kill-ring nil)
(car (nthcdr 2 kill-ring))
(nth 5 kill-ring)
(nth (1- (length kill-ring)) kill-ring)

(third-element-killring)

kill-ring-max

;Set ‘flowers’ to ‘violet’ and ‘buttercup’.  Cons two more flowers on to
;this list and set this new list to ‘more-flowers’.  Set the CAR of
;‘flowers’ to a fish.  What does the ‘more-flowers’ list now contain?

(setq flowers (list 'violet 'buttercup))

(setq more-flowers (cons 'rose (cons 'orchid flowers)))

flowers
more-flowers

(setcar flowers 'trout)

flowers
more-flowers

;Using ‘nthcdr’ and ‘car’, construct a series of expressions to
;return the first, second, third, and fourth elements of a list.

(setq colors (list 'red 'blue 'yellow 'green 'gray))

colors

(car colors)
(car (nthcdr 1 colors))
(car (nthcdr 2 colors))

