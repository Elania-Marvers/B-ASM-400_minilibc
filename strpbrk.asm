; strpbrk: finds the first occurrence of any character from the second string in the first string and returns a pointer to it
;
; Inputs:
;   RDI: pointer to the first string
;   RSI: pointer to the second string
;
; Output:
;   RAX: pointer to the first occurrence of any character from the second string in the first string, or NULL if not found

strpbrk:
  xor RAX, RAX   ; zero out the RAX register

.loop:
  mov AL, BYTE [RDI] ; load the next character from the first string
  cmp AL, 0      ; check if we have reached the end of the first string
  je .not_found  ; if so, return NULL
  mov R8, RSI    ; save a copy of the pointer to the second string

.check:
  mov BL, BYTE [R8] ; load the next character from the second string
  cmp AL, BL     ; compare it to the current character from the first string
  je .found      ; if they are equal, return the current position in the first string
  inc R8         ; move on to the next character in the second string
  cmp BL, 0      ; check if we have reached the end of the second string
  jne .check     ; if not, continue checking the remaining characters
  inc RDI         ; if so, move on to the next character in the first string
  jmp .loop      ; and continue looping

.found:
  mov RAX, RDI   ; return the current position in the first string
  ret            ; and return from the function

.not_found:
  xor RAX, RAX   ; return NULL
  ret            ; and return from the function
