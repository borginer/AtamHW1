.global _start

.section .text
_start:
#your code here
call ex5_func_HW1
jmp exit_HW1

ex5_func_HW1:
    # prologue
    pushq %rbp
    movq %rsp, %rbp
    # setup
    leaq (command), %r11 # %r11 is a pointer to point we're at in the command string.
    movb (%r11), %al # %al is the value in the memory at address of %r11.
    movl $0, %r10d # %r10d is the integer value.
    # %r9d will be the base
    # %r8d will be the digit
_start_of_while_1_ex5_HW1:
    # if *command == 0 || *command == '$', jmp to _after_while_1_ex5_HW1
    cmpb $0, %al
    je _after_while_1_ex5_HW1
    cmpb $36, %al
    je _after_while_1_ex5_HW1
    # else, command++
    incq %r11
    movb (%r11), %al
    jmp _start_of_while_1_ex5_HW1
_after_while_1_ex5_HW1:
    # if *command == 0, jmp to _return_false_ex5_HW1
    cmpb $0, %al
    je _return_false_ex5_HW1
    # command++
    incq %r11
    movb (%r11), %al
# find the base:
    # if *command != '0', jump to _decimal_base_ex5_HW1
    cmpb $48, %al
    jne _decimal_base_ex5_HW1
    # command++
    incq %r11
    movb (%r11), %al
    # if *command == 'b', jump to _binary_base_ex5_HW1
    cmpb $98, %al
    je _binary_base_ex5_HW1
    # if *command == 'x', jump to _hexa_base_ex5_HW1
    cmpb $120, %al
    je _hexa_base_ex5_HW1
    # if *command == ',', jump to _return_true_ex5_HW1 (integer is still 0, as it should be)
    cmpb $44, %al
    je _return_true_ex5_HW1
    #jmp to _octal_base_ex5_HW1
    jmp _octal_base_ex5_HW1
_decimal_base_ex5_HW1:
    # varify that the string is not "$,".
    # if (*command == ','), return false.
    cmpb $44, %al
    je _return_false_ex5_HW1
    # else:
    movl $10, %r9d
    jmp _after_find_base_ex5_HW1
_binary_base_ex5_HW1:
    movl $2, %r9d
    # command++
    incq %r11
    movb (%r11), %al
    jmp _after_find_base_ex5_HW1
_hexa_base_ex5_HW1:
    movl $16, %r9d
    # command++
    incq %r11
    movb (%r11), %al
    jmp _after_find_base_ex5_HW1
_octal_base_ex5_HW1:
    movl $8, %r9d
    jmp _after_find_base_ex5_HW1
_after_find_base_ex5_HW1:
    # make sure there is any digit before the ',':
    cmpb $44, %al
    je _return_false_ex5_HW1
#calculating the integer
_start_of_while_2_ex5_HW1:
    # if (*command == 0 || *command == ','), jmp to _return_true_ex5_HW1
    cmpb $0, %al
    je _return_true_ex5_HW1
    cmpb $44, %al
    je _return_true_ex5_HW1
    # extend %al to %eax
    cbw
    cwde
    movl %eax, %edi
    call _get_digit_func_HW1
    # mov returned value to %r8d, which stores the digit.
    movl %eax, %r8d
    # if (digit == -1 || digit >= base), jmp to _return_false_ex5_HW1
    cmpl $-1, %r8d
    je _return_false_ex5_HW1
    cmpl %r8d, %r9d
    jle _return_false_ex5_HW1
    # %r10d *= base
    imull %r9d, %r10d
    # %r10d += digit
    addl %r8d, %r10d
    # command++
    incq %r11
    movb (%r11), %al
    jmp _start_of_while_2_ex5_HW1
_return_true_ex5_HW1:
    movb $1, (legal)
    movl %r10d, (integer)
    jmp return_ex5_HW1
_return_false_ex5_HW1:
    movb $0, (legal)
return_ex5_HW1:
    # epilogue
    popq %rbp
    ret



# c is stored in %edi
_get_digit_func_HW1:
    # prologue
    pushq %rbp
    movq %rsp, %rbp
    # if '0' > c or '9' < c, jump to _after_if_1_get_digit_HW1
    cmpl $48, %edi
    jl _after_if_1_get_digit_HW1
    cmpl $57, %edi
    jg _after_if_1_get_digit_HW1
    # else, calculate the digit value and return it
    movl %edi, %eax
    addl $-48, %eax
    jmp return_get_digit_HW1
_after_if_1_get_digit_HW1:
    # if 'A' > c or 'F' < c, jump to _after_if_2_get_digit_HW1
    cmpl $65, %edi
    jl _after_if_2_get_digit_HW1
    cmpl $70, %edi
    jg _after_if_2_get_digit_HW1
    # else, calculate the digit value and return it
    movl %edi, %eax
    addl $-55, %eax
    jmp return_get_digit_HW1
_after_if_2_get_digit_HW1:
    movl $-1, %eax
return_get_digit_HW1:
    # epilogue
    popq %rbp
    ret

exit_HW1:

