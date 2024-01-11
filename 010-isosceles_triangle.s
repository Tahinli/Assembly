.global _start
.intel_syntax noprefix
.data
	input:
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

		lea rsi, [input]
		mov rdx, 1
		call scanf
		sub input, byte ptr '0'
		mov r8b, input
		mov r12b, input
		dec r12b
		xor r9b, r9b
				
		upper:
			cmp r9b, r8b
			jae exit
			mov r10b, r9b
			add r10b, r10b
			add r10b, 1
			mov r13b, r12b
			call print_spaces_of_the_line
			call print_stars_of_the_line
			call print_new_line
			inc r9b
			dec r12b
			jmp upper
						
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
	text_star:
		.asciz "*"
	text_space:
		.asciz " "
	text_new_line:
		.asciz "\n"
	text_goodbye:
		.asciz "\nGoodbye\n"
	print_spaces_of_the_line:
		mov r11b, 0
		cmp r11b, r13b
		jae returner
		call print_space
		dec r13b
		jmp print_spaces_of_the_line
	
	print_stars_of_the_line:
		mov r11b, 0
		cmp r11b, r10b
		jae returner
		call print_star
		dec r10b
		jmp print_stars_of_the_line
		 
	returner:
		xor rdi, rdi
		ret
	print_star:
		lea rsi, [text_star]
		mov rdx, 1
		call printf
		xor rdi, rdi
		ret
	print_space:
		lea rsi, [text_space]
		mov rdx, 1
		call printf
		xor rdi, rdi
		ret
	print_new_line:
		lea rsi, [text_new_line]
		mov rdx, 1
		call printf
		xor rdi, rdi
		ret
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
