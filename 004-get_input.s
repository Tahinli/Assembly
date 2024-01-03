.global _start
.intel_syntax noprefix

.data
	buffer:
		.byte 0x00
.text
	_start:
	
		//hello world
		mov rax, 1
		mov rdi, 1
		lea rsi, [hello_world]
		mov rdx, 13
		syscall

		//get intput
		mov rax, 0
		mov rdi, 0
		lea rsi, [buffer]
		mov rdx, 1
		syscall

		//print input
		mov rax, 1
		mov rdi, 1
		lea rsi, [buffer]
		mov rdx, 3
		syscall

		//exit
		mov rax, 60
		syscall

	hello_world:
		.asciz "Hello World\n"
