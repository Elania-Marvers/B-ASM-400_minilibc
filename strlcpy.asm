BITS 64

section .text
    [GLOBAL strlcpy:] ; C function

strlcpy:
    push rbp
    mov rbp, rsp
    xor r11, r11
    xor r12b, r12b

loop:
    cmp r11, rdx
    je end
    mov r12b, byte [rsi + r11]
    mov byte [rdi + r11], r12b
    inc r11
    jmp loop

end:
    mov rax, rdi
    leave
    ret
