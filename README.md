# ACS_IHW1
# АВС ИДЗ№1 ВАРИАНТ№16

16. Сформировать массив B из элементов массива A, заменой на
среднее арифметическое значений, которые больше среднего
арифметического.

tests.md - файл с тестами (входные данные и ожидаемый результат)

hw1.c - программа на C

c.out - результат компиляции программы на C

Ход работы:

1) Программа на С (hw1.c)

2) Программа на ассемблере (hw1.s) с использованием флагов gcc -masm=intel \
    -fno-asynchronous-unwind-tables \
    -fno-jump-tables \
    -fno-stack-protector \
    -fno-exceptions \
    ./hw1.c -S hw1.s
    
И вручную убраны следующие строки:

	.file	"hw1.c"
    .size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
    0:
        .string	"GNU"
    1:
        .align 8
        .long	0xc0000002
        .long	3f - 2f
    2:
        .long	0x3
    3:
        .align 8
    4:
    
3) Результат компиляции hw1.s (s1.out) и hw1.c (c.out)

4) Тестирование c.out и s1.out (в файле tests.md). Результаты совпали

5) Добавлены комментарии в программу на ассемблере (hw1withcomments.s) и убраны "endbr64" и строки

	.size	min, .-min
	
	.section	.rodata

6) Результат компиляции hw1withcomments.s (s2.out) 

7) Тестирование s2.out (в файле tests.md). Результаты совпали


ожидаемая оценка 6:

Тесты прорамм, программа на C и ассемблере, убраны лишние макросы с помощью флагов компиляции и вручную. Отдельно скомпилирована программа на ассемблере.
Используется функция с передачей через параметры. Используются локальные переменные. Максимально используются регистры процессора. Есть комментарии в в программе на ассемблере, объясняющие связь с программой на С и т.д.
