.global _start
.intel_syntax noprefix

_start:
	mov rax, 1
	mov rdi, 1
	lea rsi, [hello_world]
	mov rdx, 13
	syscall

	//exit
	mov rax, 60
	syscall

hello_world:
	.asciz "Hello World\n"
