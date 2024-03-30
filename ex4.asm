.global _start

.section .text
_start:

# CASE 3
movb $3, %bl
movq head(%rip), %rdi
testq %rdi, %rdi
je RETURN_HW1
movq (%rdi), %rax

CASE3_LOOP_HW1:
movq 8(%rdi), %rdi
testq %rdi, %rdi
je RETURN_HW1
movq (%rdi), %rcx
cmpq %rax, %rcx
jbe CASE3_CNT_HW1
movq %rcx, %rax
jmp CASE3_LOOP_HW1
CASE3_CNT_HW1:

# CASE 2
movb $2, %bl
movq head(%rip), %rdi
testq %rdi, %rdi
je RETURN_HW1
movq (%rdi), %rax

CASE2_LOOP_HW1:
movq 8(%rdi), %rdi
testq %rdi, %rdi                                
je RETURN_HW1
movq (%rdi), %rcx
cmpq %rax, %rcx
jb CASE2_CNT_HW1
movq %rcx, %rax
jmp CASE2_LOOP_HW1
CASE2_CNT_HW1:

# CASE 1
movb $1, %bl
movb $1, %sil
movq head(%rip), %rdi
testq %rdi, %rdi
je RETURN_HW1
movq (%rdi), %rax

CASE1_LOOP_HW1:
movq 8(%rdi), %rdi
testq %rdi, %rdi
je RETURN_HW1
movq (%rdi), %rcx
cmpq %rax, %rcx
jb CASE1_HIT_HW1
movq %rcx, %rax
jmp CASE1_LOOP_HW1
CASE1_HIT_HW1:
testb %sil, %sil
jz CASE1_CNT_HW1
sub $1, %sil
movq %rcx, %rax
jmp CASE1_LOOP_HW1
CASE1_CNT_HW1:

# CASE 0
movb $0, %bl

RETURN_HW1:
movb %bl, (result)


