; syscall: invokes the operating system's system call mechanism to execute a specific system call with the specified parameters
;
; Inputs:
;   RAX: the system call number
;   RDI: the first parameter for the system call
;   RSI: the second parameter for the system call
;   RDX: the third parameter for the system call
;   R10: the fourth parameter for the system call
;   R8: the fifth parameter for the system call
;   R9: the sixth parameter for the system call
;
; Output:
;   The return value from the system call

syscall:
  syscall       ; transfer control to the operating system's system call handler
