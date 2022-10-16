	.intel_syntax noprefix # используем синтаксис intel
	.text # объявляем 2 массива на 10 000 элементов
	.local	ARRAY1
	.comm	ARRAY1,40000,32
	.local	ARRAY2
	.comm	ARRAY2,40000,32
	.globl	min
	.type	min, @function
# функция min, возвращает наименьший из 2 элементов (в eax результат)
min:
	push	rbp # помещаем rbp на стек 
	mov	rbp, rsp # rbp = rsp 
	# в edi и в esi хранятся 2 элемента, которые подаются на вход
	mov	eax, edi # eax = edi
	# сравниваем элементы и возвращаем минимальный
	cmp	eax, esi # сравниваем eax и esi
	jge	.L2 # если >=, то переходим на .L2
	mov	eax, edi # eax = edi
	jmp	.L3 # переходим на метку .L3
.L2:
	mov	eax, esi # eax = esi
.L3:
	pop	rbp # получаем значение со стека и передаем в rbp
	ret # выход из функции
.LC0:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp # помещаем rbp на стек 
	mov	rbp, rsp # rbp = rsp 
	sub	rsp, 16 # rsp -= 16 
	mov	DWORD PTR -16[rbp], 0 # (-16 на стеке) = n = 0
	mov	ebx, 0 # (-4 на стеке) = a = 0
	lea	rax, -16[rbp] # rax = &(-16 на стеке)
	mov	rsi, rax # rsi = rax
	lea	rax, .LC0[rip] # rax = "%d"
	mov	rdi, rax # rdi = rax
	mov	eax, 0 # eax = 0
	call	__isoc99_scanf@PLT # считываем n
	mov	eax, DWORD PTR -16[rbp] # eax = (-16 на стеке)
	# если n <= 0 то переходим на .L5 (завершаем программу)
	# если n не <= 10000 то тоже туда попадаем
	# иначе переходим на .L6
	test	eax, eax # побитовое И
	jle	.L5 # если eax (n) <= 0 то переходим .L5
	mov	eax, DWORD PTR -16[rbp] # eax = (-16 на стеке)
	cmp	eax, 10000 # сравниваем eax и 10000
	jle	.L6 # если <= то идем .L6
.L5:
	mov	eax, 0 # eax = 0
	jmp	.L12 # переходим на .L12 (завершаем программу)
.L6:
	mov	DWORD PTR -8[rbp], 0 # (-8 на стеке) = i = 0
	jmp	.L8 # переходим на .L8
.L9: 	# тело цикла (заполняем массив, выводим, складываем элементы)
	mov	eax, DWORD PTR -8[rbp] # eax = (-8 на стеке) = i
	cdqe # расширяем eax до rax
	# вычисляем положение элемента №i
	lea	rcx, 0[0+rax*4]
	lea	rdx, ARRAY1[rip]
	mov	eax, DWORD PTR -8[rbp] # помещаем i в eax
	mov	DWORD PTR [rcx+rdx], eax # элемент №i приравниваем к i
	mov	eax, DWORD PTR -8[rbp] # eax = (-8 на стеке) = i
	cdqe # расширяем eax до rax
	# вычисляем положение элемента №i
	lea	rdx, 0[0+rax*4]
	lea	rax, ARRAY1[rip]
	mov	eax, DWORD PTR [rdx+rax] # помещаем в eax элемент №i
	add	ebx, eax # прибавляем eax (элемент) к ebx = a
	mov	eax, DWORD PTR -8[rbp] # eax = (-8 на стеке) = i
	cdqe # расширяем eax до rax
	# вычисляем положение элемента №i
	lea	rdx, 0[0+rax*4]
	lea	rax, ARRAY1[rip]
	mov	eax, DWORD PTR [rdx+rax] # помещаем в eax элемент №i
	mov	esi, eax # esi = eax
	lea	rax, .LC0[rip] # rax = "%d"
	mov	rdi, rax # rdi = rax
	mov	eax, 0 # eax = 0
	call	printf@PLT # выводим элемент массива
	mov	edi, 32 # edi = 32
	call	putchar@PLT # выводим " "
	add	DWORD PTR -8[rbp], 1 # увеличиваем i на 1
.L8: 	
	mov	eax, DWORD PTR -16[rbp] # eax = (-16 на стеке)
	cmp	DWORD PTR -8[rbp], eax # сравниваем (-8 на стеке) = i и eax
	jl	.L9 # если меньше, то снова заходим в цикл
	mov	edi, 10 # edi = 10
	call	putchar@PLT # выводим перенос строки
	mov	ecx, DWORD PTR -16[rbp] # ecx = (-16 на стеке)
	mov	eax, ebx # eax = ebx = a
	cdq
	idiv	ecx # делим a на n
	mov	ebx, eax # записываем результат деления в a
	mov	DWORD PTR -12[rbp], 0 # приравниваем i к 0
	jmp	.L10 # переходим на .L10
.L11:  	# тело цикла (присваивание значений 2ому массиву)
	mov	eax, DWORD PTR -12[rbp] # eax = (-12 на стеке) = i
	cdqe # расширяем eax до rax
	# вычисляем положение элемента №i массива 1
	lea	rdx, 0[0+rax*4]
	lea	rax, ARRAY1[rip]
	mov	edx, DWORD PTR [rdx+rax] # edx = элемента №i массива 1
	mov	eax, ebx # eax = ebx = a
	mov	esi, edx # esi = edx
	mov	edi, eax # edi = eax
	call	min # вызываем функцию min, в eax кладем результат
	mov	edx, DWORD PTR -12[rbp] # edx = (-12 на стеке) = i
	movsx	rdx, edx # rdx = edx
	# вычисляем положение элемента №i массива 2
	lea	rcx, 0[0+rdx*4]
	lea	rdx, ARRAY2[rip]
	mov	DWORD PTR [rcx+rdx], eax # в элемент №i массива 2 помещаем eax = min(ARRAY[i], a)
	mov	eax, DWORD PTR -12[rbp] # eax = (-12 на стеке) = i
	cdqe # расширяем eax до rax
	# вычисляем положение элемента №i массива 2
	lea	rdx, 0[0+rax*4]
	lea	rax, ARRAY2[rip]
	mov	eax, DWORD PTR [rdx+rax] # в eax помещаем элемент №i массива 2
	mov	esi, eax # esi = eax
	lea	rax, .LC0[rip] # rax = "%d"
	mov	rdi, rax # rdi = rax
	mov	eax, 0 # eax = 0
	call	printf@PLT # выводим элемент массив 2
	mov	edi, 32 # edi = 32
	call	putchar@PLT # выводим " "
	add	DWORD PTR -12[rbp], 1 # добавляем 1 к (-12 на стеке) = i
.L10:
	mov	eax, DWORD PTR -16[rbp] # eax = (-16 на стеке) = n
	cmp	DWORD PTR -12[rbp], eax # сравниваем (-12 на стеке) = i и eax = n
	jl	.L11 # если еще меньше, то снова идем в тело цикла на метку .L11
	mov	edi, 10 # edi = 10
	call	putchar@PLT # выводим перенос строки
	mov	eax, 0 # eax = 0
.L12:
	leave # выход
	ret # из функции
