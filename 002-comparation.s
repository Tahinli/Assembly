.global _start
.intel_syntax noprefix

_start:
	mov rax, 1
	mov rdi, 1
	lea rsi, [hello_world]
	mov rdx, 13
	syscall

	mov ax, 3
	cmp ax, 4
	jb less_goto
	ja great_goto
	je equal_goto
	less_goto:
                mov rax, 1
                mov rdi, 1
                lea rsi, [below]
                mov rdx, 6
                syscall
		jmp continue
	great_goto:
               	mov rax, 1
               	mov rdi, 1
               	lea rsi, [above]
               	mov rdx, 6
		syscall
                jmp continue
	equal_goto:
		mov rax, 1
		mov rdi, 1
		lea rsi, [equal]
		mov rdx, 6
		syscall
	continue:
	//exit
	mov rax, 60
	syscall

hello_world:
	.asciz "Hello World\n"
above:
	.asciz "Above\n"
below:
	.asciz "Below\n"
equal:
	.asciz "Equal\n"
