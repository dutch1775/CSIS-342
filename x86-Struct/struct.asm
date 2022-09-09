extern printf
global main

section .data

format_specifier_string:
    db '%s', 10, 0

format_specifier_int:
    db '%d', 10, 0

format_specifier_float:
    db '%f', 10, 0

update:
    db '***********updating**********', 0

new_id:
    dd 987654321

struc Book
    b_id resb 10
    b_price resb 10
    b_title resb 25
    b_author resb 30
    b_page_count resb 20
endstruc

hobbit istruc Book
    at b_id, dd 123456789
    at b_price, dq 20.00
    at b_title, db 'The Hobbit',
    at b_author, db 'J.R.R. Tolkien',
    at b_page_count, dd 100, 200, 250, 300, 310
iend

section .text

main:

	mov rdi, format_specifier_int
	mov rsi, [hobbit + b_id]
	xor rax, rax
	call printf

	mov rdi, format_specifier_string
	mov rsi, hobbit + b_title
	xor rax, rax
	call printf


	push rbp
	movsd xmm0, [hobbit + b_price]
	mov rdi, format_specifier_float
	mov rax, 1
	call printf
	pop rbp

	mov rdi, format_specifier_string
        mov rsi, hobbit + b_author
        xor rax, rax
        call printf

	mov rcx, 0
	mov rbx, 0

	jmp print_array

print_array:
	push rbx
	push rcx
	mov rdi, format_specifier_int
	mov rsi, [hobbit + b_page_count + rbx]
	xor rax, rax
	call printf
	pop rcx
	pop rbx
	
	inc rbx
	inc rbx
	inc rbx
	inc rbx
	inc rcx

	cmp rcx, 5
	jne print_array

	jmp print_update

print_update:
	mov rdi, format_specifier_string
	mov rsi, update
	xor rax, rax
	call printf

	xor rbx, rbx
	mov rbx, [new_id]
	mov [hobbit + b_id], rbx

	mov rdi, format_specifier_int
        mov rsi, [hobbit + b_id]
        xor rax, rax
        call printf

end:
