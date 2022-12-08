; strncmp: compares the first n characters of two strings and returns an integer indicating their lexicographical order
;
; Inputs:
;   RDI: pointer to the first string
;   RSI: pointer to the second string
;   RDX: the number of characters to compare
;
; Output:
;   RAX: -1 if the first string is lexicographically less than the second
;         0 if the two strings are lexicographically equal for the first n characters
;         1 if the first string is lexicographically greater than the second

strncmp:
  xor EAX, EAX   ; zero out the EAX register

.loop:
  mov AL, BYTE [RDI] ; load the next character from the first string
  cmp AL, BYTE [RSI] ; compare it to the next character from the second string
  je .next        ; if they are equal, move on to the next character
  jl .less        ; if the first string is less than the second, return -1
  jg .greater     ; if the first string is greater than the second, return 1

.next:
  inc RDI         ; move on to the next character in the first string
  inc RSI         ; move on to the next character in the second string
  dec RDX         ; decrement the number of characters left to compare
  jz .done        ; if we have compared the specified number of characters, we are done
  jmp .loop       ; and continue looping

.less:
  dec EAX         ; set EAX to -1 to indicate that the first string is lexicographically less than the second
  jmp .done       ; and continue

.greater:
  inc EAX         ; set EAX to 1 to indicate that the first string is lexicographically greater than the second
  jmp .done       ; and continue

.done:
  ret             ; return the result of the comparison
