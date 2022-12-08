; rindex: returns a pointer to the last occurrence of the character in the input string
;
; Inputs:
;   RDI: pointer to the input string
;   RSI: the character to search for
;
; Output:
;   RAX: pointer to the last occurrence of the character in the input string, or NULL if not found

rindex:
  xor RAX, RAX   ; zero out the RAX register
  mov R8, RDI    ; save a copy of the pointer to the input string

.loop:
  mov AL, BYTE [RDI] ; load the next character from the input string
  cmp AL, RSI    ; compare it to the input character
  jne .next      ; if they are not equal, move on to the next character
  mov RAX, RDI   ; if they are equal, save the pointer to the current character

.next:
  cmp AL, 0      ; check if we have reached the end of the input string
  jne .done      ; if not, move on to the next character
  ret            ; if so, return NULL

.done:
  dec RDI         ; move on to the next character in the input string
  jmp .loop      ; and continue looping

.done:
  mov RAX, R8    ; return the pointer to the last occurrence of the character
  ret            ; and return from the function
