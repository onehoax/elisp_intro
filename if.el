(if (> 3 4)
    (message "5 is greater than 4!"))

(defun type-of-animal (characteristic)
  "Print message in echo area depending on CHARACTERISTIC.
if the CHARACTERISTIC is the string \"fierce\",
then warn of a tiger."
  (if (equal characteristic "fierce")
      (message "it is a tiger!")
    (message "it is NOT fierce!")))

(type-of-animal "fierce")
(type-of-animal "striped")
(type-of-animal)

