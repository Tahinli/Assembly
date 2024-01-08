.global _start
.intel_syntax noprefix

// first 5 series of fibonnacci using stack

_start:
    mov ax, 1
    mov bx, 0
    push bx
    cmp cx, 00H
    je son

    dongu:
        add bx, ax
        push ax
        xchg ax, bx
        loop dongu:
    //exit
    syscall