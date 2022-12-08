; strfry: shuffles the characters in the input string in a random order
;
; Inputs:
;   RDI: pointer to the input string
;
; Output:
;   None

strfry:
  call srand    ; initialize the random number generator

.loop:
  mov R8, RDI    ; save a copy of the pointer to the input string
  mov RAX, RDX   ; store the length of the input string in RAX
  dec RAX         ; decrement the length of the input string
  jz .done       ; if it is zero, we are done
  call rand      ; generate a random number between 0 and the length of the input string
  xor R9, R9     ; zero out the R9 register
  div R9, RAX    ; divide the random number by the length of the input string
  mov R9, RDX    ; store the remainder in R9
  add R9, R8     ; add the remainder to the pointer to the input string
  mov AL, BYTE [RDI] ; load the current character from the input string
  mov BL, BYTE [R9] ; load the character at the random position in the input string
  xchg AL, BL    ; swap the current character and the random character
  mov BYTE [RDI], AL ; store the swapped character back in the input string
  inc RDI         ; move on to the next character in the input string
  jmp .loop      ; and continue looping

.done:
  ret            ; return from the function
