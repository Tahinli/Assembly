.global _start
.intel_syntax noprefix
.data
	first:
		.byte 0x00
	second:
		.byte 0x00
	conclusion:
		.byte 0x00
	new_line_consumer:
		.byte 0x00
.text
	_start:
		//hello world
		lea rsi, [hello_world]
		mov rdx, 13
		call printf

		lea rsi, [first_input_text]
		mov rdx, 18
		call printf

		lea rsi, [first]
		mov rdx, 1
		call scanf

		lea rsi, [second_input_text]
		mov rdx, 19
		call printf

		lea rsi, [second]
		mov rdx, 1
		call scanf

		lea rsi, [first_input_given_text]
		mov rdx, 18
		call printf

		lea rsi, [first]
		mov rdx, 1
		call printf

		lea rsi, [second_input_given_text]
                mov rdx, 19
               	call printf

		lea rsi, [second]
		mov rdx, 1
		call printf

		lea rsi, [total_text]
		mov rdx, 12
		call printf

		mov bl, [first]
		sub bl, '0'
		mov cl, [second]
		sub cl, '0'
		add bl, cl
		add bl, '0'
		mov [conclusion], bl
		lea rsi, [conclusion]
		mov rdx, 10
		call printf

		//exit
		mov rax, 60
		xor rdi, rdi
		syscall

	hello_world:
		.asciz "Hello World\n"
	first_input_text:
		.asciz "Give first number\n"
	second_input_text:
		.asciz "Give second number\n"
	total_text:
		.asciz "\nTotal is = "
	first_input_given_text:
		.asciz "First Value is = "
	second_input_given_text:
		.asciz "\nSecond Value is = "
	printf:
		mov rax, 1
		mov rdi, 1
		syscall
		ret
	scanf:
		mov rax, 0
		mov rdi, 0
		syscall
		mov rax, 0
		mov rdi, 0
		lea rsi, [new_line_consumer]
		mov rdx, 1
		syscall
		ret
