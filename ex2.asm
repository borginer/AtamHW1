.global _start

.section .text
_start:

movq $vertices, %rdi 

OUTER_LOOP_HW1:
movq (%rdi), %rax
cmpq $0, %rax
jz RETURN_FALSE_HW1

LOOP1_HW1:
movq (%rax), %r8
testq %r8, %r8
jz OUTER_LOOP_CNT_HW1
cmpq %r8, (%rdi)
je RETURN_TRUE_HW1

LOOP2_HW1:
movq (%r8), %r9
testq %r9, %r9
jz LOOP1_CNT_HW1
cmpq %r9, (%rdi)
je RETURN_TRUE_HW1

LOOP3_HW1:
movq (%r9), %r10
testq %r10, %r10
jz LOOP2_CNT_HW1
cmpq %r10, (%rdi)
je RETURN_TRUE_HW1

LOOP4_HW1:
movq (%r10), %r11
testq %r11, %r11
jz LOOP3_CNT_HW1
cmpq %r11, (%rdi)
je RETURN_TRUE_HW1

LOOP5_HW1:
movq (%r11), %r12
testq %r12, %r12
jz LOOP4_CNT_HW1
cmpq %r12, (%rdi)
je RETURN_TRUE_HW1

LOOP6_HW1:
movq (%r12), %r13
testq %r13, %r13
jz LOOP5_CNT_HW1
cmpq %r13, (%rdi)
je RETURN_TRUE_HW1

LOOP7_HW1:
movq (%r13), %r14
testq %r14, %r14
jz LOOP6_CNT_HW1
cmpq %r14, (%rdi)
je RETURN_TRUE_HW1

LOOP8_HW1:
movq (%r14), %r15
testq %r15, %r15
jz LOOP7_CNT_HW1
cmpq %r15, (%rdi)
je RETURN_TRUE_HW1

jmp RETURN_TRUE_HW1

LOOP7_CNT_HW1:
addq $8, %r13
jmp LOOP7_HW1

LOOP6_CNT_HW1:
addq $8, %r12
jmp LOOP6_HW1

LOOP5_CNT_HW1:
addq $8, %r11
jmp LOOP5_HW1

LOOP4_CNT_HW1:
addq $8, %r10
jmp LOOP4_HW1

LOOP3_CNT_HW1:
addq $8, %r9
jmp LOOP3_HW1

LOOP2_CNT_HW1:
addq $8, %r8
jmp LOOP2_HW1

LOOP1_CNT_HW1:
addq $8, %rax
jmp LOOP1_HW1

OUTER_LOOP_CNT_HW1:
addq $8, %rdi
jmp OUTER_LOOP_HW1


RETURN_TRUE_HW1:
movb $1, (circle)
jmp EXIT_HW1
RETURN_FALSE_HW1:
movb $-1, (circle)
EXIT_HW1:
