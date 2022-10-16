	.intel_syntax noprefix
	.text
	.local	ARRAY1
	.comm	ARRAY1,40000,32
	.local	ARRAY2
	.comm	ARRAY2,40000,32
	.globl	min
	.type	min, @function
min:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR -4[rbp], edi
	mov	DWORD PTR -8[rbp], esi
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -8[rbp]
	jge	.L2
	mov	eax, DWORD PTR -4[rbp]
	jmp	.L3
.L2:
	mov	eax, DWORD PTR -8[rbp]
.L3:
	pop	rbp
	ret
	.size	min, .-min
	.section	.rodata
.LC0:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR -16[rbp], 0
	mov	DWORD PTR -4[rbp], 0
	lea	rax, -16[rbp]
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -16[rbp]
	test	eax, eax
	jle	.L5
	mov	eax, DWORD PTR -16[rbp]
	cmp	eax, 10000
	jle	.L6
.L5:
	mov	eax, 0
	jmp	.L12
.L6:
	mov	DWORD PTR -8[rbp], 0
	jmp	.L8
.L9:
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rcx, 0[0+rax*4]
	lea	rdx, ARRAY1[rip]
	mov	eax, DWORD PTR -8[rbp]
	mov	DWORD PTR [rcx+rdx], eax
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, ARRAY1[rip]
	mov	eax, DWORD PTR [rdx+rax]
	add	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, ARRAY1[rip]
	mov	eax, DWORD PTR [rdx+rax]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	edi, 32
	call	putchar@PLT
	add	DWORD PTR -8[rbp], 1
.L8:
	mov	eax, DWORD PTR -16[rbp]
	cmp	DWORD PTR -8[rbp], eax
	jl	.L9
	mov	edi, 10
	call	putchar@PLT
	mov	ecx, DWORD PTR -16[rbp]
	mov	eax, DWORD PTR -4[rbp]
	cdq
	idiv	ecx
	mov	DWORD PTR -4[rbp], eax
	mov	DWORD PTR -12[rbp], 0
	jmp	.L10
.L11:
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, ARRAY1[rip]
	mov	edx, DWORD PTR [rdx+rax]
	mov	eax, DWORD PTR -4[rbp]
	mov	esi, edx
	mov	edi, eax
	call	min
	mov	edx, DWORD PTR -12[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	lea	rdx, ARRAY2[rip]
	mov	DWORD PTR [rcx+rdx], eax
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, ARRAY2[rip]
	mov	eax, DWORD PTR [rdx+rax]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	edi, 32
	call	putchar@PLT
	add	DWORD PTR -12[rbp], 1
.L10:
	mov	eax, DWORD PTR -16[rbp]
	cmp	DWORD PTR -12[rbp], eax
	jl	.L11
	mov	edi, 10
	call	putchar@PLT
	mov	eax, 0
.L12:
	leave
	ret
