; fork: creates a new execution context for a child process and sets up the stack and registers for the child process
;
; Inputs:
;   None
;
; Output:
;   RAX: the process ID of the newly created child process

; fork: creates a new execution context for a child process and sets up the stack and registers for the child process
fork:
  ; Allocate space on the stack for the child process's stack frame
  sub RSP, 0x100

  ; Set up the stack pointer and base pointer for the child process
  mov RBP, RSP   ; set the base pointer to the stack pointer
  mov RSP, RSP + 0x100 ; move the stack pointer to the allocated stack frame

  ; Create a new execution context for the child process using the fork system call
  mov RAX, 57    ; set the system call number for fork
  syscall         ; make the fork system call

  ; Check the return value of the fork system call
  cmp RAX, 0     ; if the return value is non-zero, we are in the child process
  jne .done      ; in that case, return from the function

  ; If the return value is zero, we are in the parent process
  ; In that case, we need to restore the stack pointer and base pointer for the parent process
  mov RSP, RBP   ; restore the stack pointer to the previous value
  mov RBP, [RBP] ; restore the base pointer to the previous value

  ; And return the process ID of the newly created child process
.done:
  ret            ; return from the function
