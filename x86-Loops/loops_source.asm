extern printf
global main

section .data:
format_specifier:
	db '', 10, 0

format_specifier_2:
	db '%x ', 0

section .text:
main:

	;5 lines to print
	mov rbx, qword 0

outer_loop:

	cmp rbx, qword 6
	je end
	
	mov rdi, format_specifier
	xor rsi, rsi
	xor rax, rax
	call printf	

	mov rcx, 16
	
inner_loop:

	dec rcx

	push rcx
	mov rdi, format_specifier_2
	mov rsi, rcx
	xor rax, rax
	call printf
	pop rcx

	cmp rcx, qword 0
	je innerEnd
	jmp inner_loop

innerEnd:

	inc rbx
	jmp outer_loop

end:
	mov rax, 60
	syscall
