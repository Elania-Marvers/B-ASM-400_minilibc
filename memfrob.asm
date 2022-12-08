; memfrob: modifies the contents of the input memory region by XORing each byte with the value 0x2A
;
; Inputs:
;   RDI: pointer to the input memory region
;   RSI: the length of the memory region
;
; Output:
;   RAX: pointer to the input memory region

memfrob:
  xor RAX, RAX   ; zero out the RAX register
  mov RAX, RDI   ; save a copy of the pointer to the input memory region

.loop:
  cmp RSI, 0     ; check if we have reached the end of the input memory region
  jz .done       ; if so, return the pointer to the input memory region
  xor BYTE [RDI], 0x2A ; XOR the current byte with 0x2A
  inc RDI         ; move on to the next byte in the input memory region
  dec RSI         ; and decrease the length by one
  jmp .loop      ; and continue looping

.done:
  mov RAX, RDI   ; return the pointer to the input memory region
  ret            ; and return from the function
