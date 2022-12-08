; ffs: finds the position of the least significant bit that is set to 1 in the input value
;
; Inputs:
;   RDI: the input value
;
; Output:
;   RAX: the position of the least significant bit that is set to 1 in the input value

ffs:
  xor RAX, RAX   ; zero out the RAX register
  or RDX, -1     ; set RDX to -1
  jmp .loop      ; and jump to the main loop

.next:
  inc RAX         ; increment the position of the current bit

.loop:
  and RDI, RDX   ; check if the current bit is set to 1
  jz .next       ; if not, move on to the next bit
  inc RAX         ; if so, increment the position of the current bit
  ret            ; and return from the function
