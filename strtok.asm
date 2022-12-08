; strtok: returns a pointer to the first token in the input string and modifies the input string to remove the token and the delimiter
;
; Inputs:
;   RDI: pointer to the input string
;   RSI: the delimiter
;
; Output:
;   RAX: pointer to the first token in the input string, or NULL if not found

strtok:
  xor RAX, RAX   ; zero out the RAX register
  mov R8, RDI    ; save a copy of the pointer to the input string

.loop:
  mov AL, BYTE [RDI] ; load the next character from the input string
  cmp AL, RSI    ; compare it to the delimiter
  jne .next      ; if they are not equal, move on to the next character
  mov BYTE [RDI], 0 ; if they are equal, replace the delimiter with a NULL terminator
  mov RAX, R8    ; return the pointer to the start of the token
  ret            ; and return from the function

.next:
  cmp AL, 0      ; check if we have reached the end of the input string
  jne .done      ; if not, move on to the next character
  ret            ; if so, return NULL

.done:
  inc RDI         ; move on to the next character in the input string
  jmp .loop      ; and continue looping
