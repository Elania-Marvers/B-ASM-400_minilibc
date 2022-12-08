; memset: fills a block of memory with a specified value
;
; Inputs:
;   RDI: pointer to the block of memory
;   SIL: the value to fill the block of memory with
;   RDX: the size of the block of memory
;
; Output:
;   RAX: pointer to the block of memory

memset:
  mov RAX, RDI   ; save a copy of the pointer to the block of memory

.loop:
  dec RDX        ; decrement the size of the block of memory
  jl .done       ; if the size is less than zero, we are done
  mov BYTE [RDI], SIL ; store the specified value at the current memory location
  inc RDI        ; move on to the next memory location
  jmp .loop      ; and continue looping

.done:
  mov RAX, RDI   ; return the pointer to the block of memory
  ret            ; and return from the function
