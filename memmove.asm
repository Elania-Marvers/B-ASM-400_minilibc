; memmove: copies a block of memory from one location to another, even if the source and destination overlap
;
; Inputs:
;   RDI: pointer to the destination memory location
;   RSI: pointer to the source memory location
;   RDX: the number of bytes to copy
;
; Output:
;   RAX: pointer to the destination memory location

memmove:
  mov RAX, RDI   ; save a copy of the pointer to the destination memory location
  cmp RDI, RSI   ; compare the pointers to the source and destination memory locations
  jl .forward    ; if the destination pointer is less than the source pointer, copy the data forward
  jge .backward  ; if the destination pointer is greater than or equal to the source pointer, copy the data backward

.forward:
  ; copy the data forward from the source to the destination
  xor R8, R8     ; zero out the R8 register

.loop_forward:
  cmp R8, RDX    ; check if we have copied the specified number of bytes
  je .done       ; if so, we are done
  mov BYTE [RDI+R8], BYTE [RSI+R8] ; copy a byte of data from the source to the destination
  inc R8         ; increment the index of the current memory location
  jmp .loop_forward ; and continue looping

.backward:
  ; copy the data backward from the source to the destination
  dec RDX        ; decrement the number of bytes to copy
  mov R8, RDX    ; set the index of the current memory location to the last byte to be copied

.loop_backward:
  cmp R8, -1     ; check if we have copied the specified number of bytes
  je .done       ; if so, we are done
  mov BYTE [RDI+R8], BYTE [RSI+R8] ; copy a byte of data from the source to the destination
  dec R8         ; decrement the index of the current memory location
  jmp .loop_backward ; and continue looping

.done:
  mov RAX, RDI   ; return the pointer to the destination memory location
  ret            ; and return from the function
