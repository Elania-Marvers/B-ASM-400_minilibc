; strcspn: finds the length of the initial portion of the first string that does not contain any characters from the second string
;
; Inputs:
;   RDI: pointer to the first string
;   RSI: pointer to the second string
;
; Output:
;   RAX: the length of the initial portion of the first string that does not contain any characters from the second string

strcspn:
  xor RAX, RAX   ; zero out the RAX register

.loop:
  mov AL, BYTE [RDI] ; load the next character from the first string
  cmp AL, 0      ; check if we have reached the end of the first string
  je .done       ; if so, return the length of the initial portion of the first string
  mov R8, RSI    ; save a copy of the pointer to the second string

.check:
  mov BL, BYTE [R8] ; load the next character from the second string
  cmp AL, BL     ; compare it to the current character from the first string
  je .done       ; if they are equal, return the length of the initial portion of the first string
  inc R8         ; move on to the next character in the second string
  cmp BL, 0      ; check if we have reached the end of the second string
  jne .check     ; if not, continue checking the remaining characters
  inc RDI         ; if so, move on to the next character in the first string
  inc RAX         ; increment the length of the initial portion of the first string
  jmp .loop      ; and continue looping

.done:
  ret            ; return the length of the initial portion of the first string
