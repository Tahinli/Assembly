.global _start
.intel_syntax noprefix
.data
	count:
		.byte 0x00
	number:
		.byte 0x00
	new_line_collector:
		.byte 0x00
.text
	_start:
		//hello world
		lea rsi, [text_hello_world]
		mov rdx, 13
		call printf

		lea rsi, [text_how_far_do_you_want_to_go]
		mov rdx, 28
		call printf

		lea rsi, [count]
		mov rdx, 1
		call scanf
		mov r8, 1
		mov r9, 0
		push bx
		loop:
		mov bl, 0x30
		cmp bl, count
		jae exit
		dec byte ptr count
		add r8, r9
		push r9
		mov r10, r9
		add r10, '0'
		mov number, r10
		lea rsi, [number]
		mov rdx, 1
		call printf
		xchg r8, r9
		jmp loop
		//exit
		exit:
			lea rsi, [text_goodbye]
			mov rdx, 9
			call printf
			mov rax, 60
			xor rdi, rdi
			syscall

	text_hello_world:
		.asciz "Hello World\n"
	text_how_far_do_you_want_to_go:
		.asciz "How Far Do You Want to Go = "
	text_goodbye:
		.asciz "\nGoodbye\n"
	printf:
		mov rax, 1
		mov rdi, 1
		syscall
		xor rdi, rdi
		ret
	scanf:
		mov rax, 0
		mov rdi, 0
		syscall
		mov rax, 0
		mov rdi, 0
		mov rsi, [new_line_collector]
		mov rdx, 1
		syscall
		xor rdi, rdi
		ret
