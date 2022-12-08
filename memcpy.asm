; memcpy: copies a block of memory from one location to another
;
; Inputs:
;   RDI: pointer to the destination memory location
;   RSI: pointer to the source memory location
;   RDX: the number of bytes to copy
;
; Output:
;   RAX: pointer to the destination memory location

memcpy:
  mov RAX, RDI   ; save a copy of the pointer to the destination memory location

.loop:
  dec RDX        ; decrement the number of bytes to copy
  jl .done       ; if the number of bytes is less than zero, we are done
  mov BYTE [RDI], BYTE [RSI] ; copy a byte of data from the source to the destination
  inc RDI        ; move on to the next memory location in the destination
  inc RSI        ; move on to the next memory location in the source
  jmp .loop      ; and continue looping

.done:
  mov RAX, RDI   ; return the pointer to the destination memory location
  ret            ; and return from the function
