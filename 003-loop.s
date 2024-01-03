.global _start
.intel_syntax noprefix

_start:
	//hello world
	mov rax, 1
	mov rdi, 1
	lea rsi, [hello_world]
	mov rdx, 13
	syscall

	mov rbx, 5
	loop:
		cmp rbx, 0
		jle continue
		mov rax, 1
		mov rdi, 1
		lea rsi, [content]
		mov rdx, 1
		syscall
		sub rbx, 1
		jmp loop
	continue:
		mov rax, 1
		mov rdi, 1
		lea rsi, [finish]
		mov rdx, 10
		syscall

	//exit
	mov rax, 60
	syscall

hello_world:
	.asciz "Hello World\n"
finish:
	.asciz "\nFinished\n"
content:
	.asciz "*"
