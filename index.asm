; index: returns a pointer to the first occurrence of the character in the input string
;
; Inputs:
;   RDI: pointer to the input string
;   RSI: the character to search for
;
; Output:
;   RAX: pointer to the first occurrence of the character in the input string, or NULL if not found

index:
  xor RAX, RAX   ; zero out the RAX register

.loop:
  mov AL, BYTE [RDI] ; load the next character from the input string
  cmp AL, RSI    ; compare it to the input character
  je .done       ; if they are equal, return the pointer to the current character
  cmp AL, 0      ; check if we have reached the end of the input string
  jne .next      ; if not, move on to the next character
  ret            ; if so, return NULL

.next:
  inc RDI         ; move on to the next character in the input string
  jmp .loop      ; and continue looping

.done:
  mov RAX, RDI   ; return the pointer to the current character
  ret            ; and return from the function
