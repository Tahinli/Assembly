.global _start
.intel_syntax noprefix
.data
	magic_1:
		.int 0xfee1dead
	magic_2:
		.int 0x28121969
	cmd:
		.int 0x1234567
.text
	_start:
		//hello world
		lea rsi, [hello_world]
		mov rdx, 13
		call printf

		//sync
		mov rax, 162
		syscall

		//reboot
		mov rax, 169
		mov rdi, [magic_1]
		mov rsi, [magic_2]
		mov rdx, [cmd]
		syscall

		//exit
		mov rax, 60
		xor rdi, rdi
		syscall

	hello_world:
		.asciz "Hello World\n"
	printf:
		mov rax, 1
		mov rdi, 1
		syscall
		xor rdi, rdi
		ret
