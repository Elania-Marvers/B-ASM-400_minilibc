; strrchr: determines the last occurrence of a character in a string
;
; Inputs:
;   RDI: pointer to the string
;   SIL: the character to search for
;
; Output:
;   RAX: pointer to the last occurrence of the character in the string, or NULL if not found

strrchr:
  mov RAX, RDI   ; save a copy of the pointer to the string

.loop:
  cmp BYTE [RDI], 0 ; check if we have reached the end of the string
  je .done         ; if so, we are done
  inc RDI          ; if not, move on to the next character
  jmp .loop        ; and continue looping

.done:
  cmp BYTE [RDI-1], SIL ; check if the current character is the one we are looking for
  jne .not_found   ; if not, the character was not found in the string
  dec RAX          ; if so, move back one character to get the pointer to the last occurrence
  jmp .found       ; and continue

.not_found:
  xor RAX, RAX     ; zero out RAX to indicate that the character was not found
  jmp .found       ; and continue

.found:
  ret              ; return the result of the search
