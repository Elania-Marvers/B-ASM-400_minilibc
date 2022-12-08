; strstr: finds the first occurrence of the second string in the first string and returns a pointer to it
;
; Inputs:
;   RDI: pointer to the first string
;   RSI: pointer to the second string
;
; Output:
;   RAX: pointer to the first occurrence of the second string in the first string, or NULL if not found

strstr:
  xor RAX, RAX   ; zero out the RAX register
  or RDX, -1     ; set RDX to -1
  jmp .loop      ; and jump to the main loop

.next:
  inc RDI         ; move on to the next character in the first string

.loop:
  mov AL, BYTE [RDI] ; load the next character from the first string
  cmp AL, 0      ; check if we have reached the end of the first string
  je .not_found  ; if so, return NULL
  cmp AL, BYTE [RSI] ; compare it to the first character of the second string
  jne .next      ; if they are not equal, move on to the next character in the first string
  mov QWORD [RSP+8], RDI ; save a copy of the current position in the first string
  inc RDI         ; move on to the next character in the first string
  inc RSI         ; move on to the next character in the second string

.compare:
  mov AL, BYTE [RSI] ; load the next character from the second string
  cmp AL, 0      ; check if we have reached the end of the second string
  je .found      ; if so, the strings match, so return the current position in the first string
  cmp AL, BYTE [RDI] ; compare it to the next character in the first
