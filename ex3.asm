.global _start

.section .text
_start:
#your code here
call _ex3_HW1
jmp _exit_ex3_HW1


_ex3_HW1:
    # prologue
    pushq %rbp
    movq %rsp, %rbp
    # setup
    movl (size), %esi # %esi is the length from array that we hasn't covered yet
    leaq source_array, %r9 # %r9 is the pointer to the place we are at in source_array
    movl (%r9), %r8d # %r8d is the next value in source_array
    movl %esi, %ebx # %ebx is the size left (%esi) if we  haven't chose the not_start_arr yet, and -1 otherwise
    leaq up_array, %rcx # %rcx is the pointer to the place we are at in the array that starts with arr[0]
    addq $-4, %rcx
    leaq down_array, %rdx # %rdx is the pointer to the place we are at in the array that does not start with arr[0]
    addq $-4, %rdx
# start of algorithm
_while_ex3_HW1:
    # jump to _update_output_and_return_true_ex3_HW1 if size that is rest of arr is 0
    test %esi, %esi
    jz _update_output_and_return_true_ex3_HW1
    # if_1 - if (%rcx < up_arr || *up_arr < *arr)
    leaq up_array, %rax
    cmpq %rcx, %rax
    jg _if_1_up_HW1
    cmpl (%rcx), %r8d
    jg _if_1_up_HW1
    jmp _else_1_not_up_HW1
_if_1_up_HW1:
    # if_2 - if (%rdx < down_arr || *down_arr > *arr)
    leaq down_array, %rax
    cmpq %rdx, %rax
    jg _if_2_down_HW1
    cmpl (%rdx), %r8d
    jl _if_2_down_HW1
    jmp _after_if_4_can_go_both_HW1
_if_2_down_HW1:
    # if_3 - if (size == 1)
    cmpl $1, %esi
    jne _after_if_3_size_HW1
    # up_arr++
    addq $4, %rcx
    # *up_arr = *arr
    movl %r8d, (%rcx)
    # size--
    decl %esi
    # arr++
    addq $4, %r9
    # update %r8d
    movl (%r9), %r8d
    jmp _update_output_and_return_true_ex3_HW1
_after_if_3_size_HW1:
    # if_4 - if (*arr > *(arr + 1))
    movq %r9, %r10
    addq $4, %r10
    cmpl %r8d, (%r10)
    jge _after_if_4_can_go_both_HW1
    # down_arr++
    addq $4, %rdx
    # *down_arr = *arr
    movl %r8d, (%rdx)
    # size--
    decl %esi
    # arr++
    addq $4, %r9
    # update %r8d
    movl (%r9), %r8d
    jmp _while_ex3_HW1
_after_if_4_can_go_both_HW1:
    # up_arr++
    addq $4, %rcx
    # *up_arr = *arr
    movl %r8d, (%rcx)
    # size--
    decl %esi
    # arr++
    addq $4, %r9
    # update %r8d
    movl (%r9), %r8d
    jmp _while_ex3_HW1
_else_1_not_up_HW1:
    # if_5 - if (%rdx < down_arr || *down_arr > *arr)
    leaq down_array, %rax
    cmpq %rdx, %rax
    jg _if_5_down_HW1
    cmpl (%rdx), %r8d
    jl _if_5_down_HW1
    jmp _else_5_not_down_HW1
_if_5_down_HW1:
    # down_arr++
    addq $4, %rdx
    # *down_arr = *arr
    movl %r8d, (%rdx)
    # size--
    decl %esi
    # arr++
    addq $4, %r9
    # update %r8d
    movl (%r9), %r8d
    jmp _while_ex3_HW1
_else_5_not_down_HW1:
    jmp _update_output_and_return_false_ex3_HW1


_update_output_and_return_true_ex3_HW1:
    movb $1, (bool)
_return_true_ex3_HW1:
    movq $1, %rax
    # epilogue
    popq %rbp
    ret

_update_output_and_return_false_ex3_HW1:
    movb $0, (bool)
_return_false_ex3_HW1:
    movq $0, %rax
    # epilogue
    popq %rbp
    ret


_exit_ex3_HW1:
