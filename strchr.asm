BITS 64

section .text
    [GLOBAL strchr:] ; C function

strchr:
    push rbp
    mov rbp, rsp
    xor r14, r14

loop:
    cmp byte [rdi], 0
    je end
    inc r14
    inc rdi
    jmp loop

end:
    mov rax, r14
    leave
    ret
