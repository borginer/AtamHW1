.global _start

.section .text
_start:

movb (character), %al
cmpb $97, %al
jl SMALL_CNT_HW1
cmpb $122, %al
jg SMALL_CNT_HW1

sub $32, %al
movb %al, %bl
jmp INSERT_HW1
SMALL_CNT_HW1:

movb (character), %al
cmpb $65, %al
jl BIG_CNT_HW1
cmpb $90, %al
jg BIG_CNT_HW1

movb %al, %bl
jmp INSERT_HW1
BIG_CNT_HW1:

movb $34, %bl # ' - "
cmpb $39, %al
je INSERT_HW1
movb $60, %bl # , - <
cmpb $44, %al
je INSERT_HW1
movb $95, %bl # - - _
cmpb $45, %al
je INSERT_HW1
movb $62, %bl # . - >
cmpb $46, %al
je INSERT_HW1
movb $63, %bl # / - ?
cmpb $47, %al
je INSERT_HW1
movb $41, %bl # 0 - )
cmpb $48, %al
je INSERT_HW1
movb $33, %bl # 1 - !
cmpb $49, %al
je INSERT_HW1
movb $64, %bl # 2 - @
cmpb $50, %al
je INSERT_HW1
movb $35, %bl # 3 - #
cmpb $51, %al
je INSERT_HW1
movb $36, %bl # 4 - $
cmpb $52, %al
je INSERT_HW1
movb $37, %bl # 5 - %
cmpb $53, %al
je INSERT_HW1
movb $94, %bl # 6 - ^
cmpb $54, %al
je INSERT_HW1
movb $38, %bl # 7 - &
cmpb $55, %al
je INSERT_HW1
movb $42, %bl # 8 - *
cmpb $56, %al
je INSERT_HW1
movb $40, %bl # 9 - (
cmpb $57, %al
je INSERT_HW1
movb $58, %bl # ; - :
cmpb $59, %al
je INSERT_HW1
movb $43, %bl # = - +
cmpb $61, %al
je INSERT_HW1
movb $123, %bl # [ - {
cmpb $91, %al
je INSERT_HW1
movb $124, %bl # \ - |
cmpb $92, %al
je INSERT_HW1
movb $125, %bl # ] - }
cmpb $93, %al
je INSERT_HW1
movb $126, %bl # ` - ~
cmpb $96, %al
je INSERT_HW1

movb %al, %bl
cmpb $33, %al # !
je INSERT_HW1
cmpb $34, %al # "
je INSERT_HW1
cmpb $35, %al # #
je INSERT_HW1
cmpb $36, %al # $
je INSERT_HW1
cmpb $37, %al # %
je INSERT_HW1
cmpb $38, %al # &
je INSERT_HW1
cmpb $40, %al # (
je INSERT_HW1
cmpb $41, %al # )
je INSERT_HW1
cmpb $42, %al # *
je INSERT_HW1
cmpb $43, %al # +
je INSERT_HW1
cmpb $58, %al # :
je INSERT_HW1
cmpb $60, %al # <
je INSERT_HW1
cmpb $62, %al # >
je INSERT_HW1
cmpb $63, %al # ?
je INSERT_HW1
cmpb $64, %al # @
je INSERT_HW1
cmpb $94, %al # ^
je INSERT_HW1
cmpb $95, %al # _
je INSERT_HW1
cmpb $123, %al # {
je INSERT_HW1
cmpb $124, %al # |
je INSERT_HW1
cmpb $125, %al # }
je INSERT_HW1
cmpb $126, %al # ~
je INSERT_HW1

movb $0xff, %bl
INSERT_HW1:
movb %bl, (shifted)
