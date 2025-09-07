.global _start
.intel_syntax noprefix
.data
	count:
		.byte 0x00
	input:
		.byte 0x00
	small:
		.byte 0xFF
	new_line_collector:
		.byte 0x00
.text
	_start:
		//hello World
		lea rsi, [hello_world]
		mov rdx, 13
		call printf

		lea rsi, [text_how_many_input]
		mov rdx, 40
		call printf

		lea rsi, [count]
		mov rdx, 1
		call scanf

		loop:
			mov al, '0'
			cmp al, [count]
			jl get_input
			jae conclusion

		get_input:
			mov al, count
			dec al
			mov count, al
			lea rsi, [text_give_input]
			mov rdx, 14
			call printf
			lea rsi, [input]
			mov rdx, 1
			call scanf
			jmp find_smaller
		find_smaller:
			mov al, small
			mov bl, input
			cmp al, bl
			ja switch
			jle loop
		switch:
			mov al, input
			mov small, al
			jmp loop 
		conclusion:
			lea rsi, [text_conclusion]
			mov rdx, 19
			call printf
			lea rsi, [small]
			mov rdx, 1
			call printf
		//exit
		lea rsi, [text_goodbye]
		mov rdx, 9
		call printf
		mov rax, 60
		xor rdi, rdi
		syscall
	hello_world:
		.asciz "Hello World\n"
	text_how_many_input:
		.asciz "How Many Number Do You Want to Insert = "
	text_give_input:
		.asciz "\nGive Input = "
	text_conclusion:
		.asciz "\nThe Smallest is = "
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
