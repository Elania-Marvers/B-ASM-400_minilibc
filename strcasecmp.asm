; strcasecmp: compares two strings without considering the case of the characters and returns an integer indicating their lexicographical order
;
; Inputs:
;   RDI: pointer to the first string
;   RSI: pointer to the second string
;
; Output:
;   RAX: -1 if the first string is lexicographically less than the second
;         0 if the two strings are lexicographically equal
;         1 if the first string is lexicographically greater than the second

strcasecmp:
  xor EAX, EAX   ; zero out the EAX register

.loop:
  mov AL, BYTE [RDI] ; load the next character from the first string
  cmp AL, 'A'    ; check if the character is uppercase
  jl .not_upper  ; if not, move on to the next step
  cmp AL, 'Z'    ; check if the character is uppercase
  jg .not_upper  ; if not, move on to the next step
  add AL, 'a'-'A' ; convert the character to lowercase

.not_upper:
  mov BL, BYTE [RSI] ; load the next character from the second string
  cmp BL, 'A'    ; check if the character is uppercase
  jl .not_upper2 ; if not, move on to the next step
  cmp BL, 'Z'    ; check if the character is upperc
