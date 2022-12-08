; rand: generates a pseudo-random integer value
;
; Inputs:
;   None
;
; Output:
;   RAX: the generated pseudo-random integer value

; Constants for the linear congruential generator (LCG) algorithm
LCG_MUL = 1103515245
LCG_ADD = 12345
LCG_MOD = 2147483648

; The current seed value for the LCG algorithm
.data
  seed dq 1

; rand: generates a pseudo-random integer value using a linear congruential generator (LCG) algorithm
rand:
  ; Load the current seed value from memory
  mov RAX, [seed]

  ; Generate the next pseudo-random number in the sequence
  mul LCG_MUL
  add RAX, LCG_ADD
  mov RDX, 0
  div LCG_MOD

  ; Save the updated seed value to memory
  mov [seed], RAX

  ; Return the generated pseudo-random integer value
  ret
