.code16
.global _start
_start:

# mode 0x13
xor %ah, %ah
mov $0x13, %al
int $0x10

mov $0xa000, %ax
mov %ax, %es # framebuffer at %es

pre:
mov $0xfa00, %bx
mov $320, %cx
loop:
xor %dx, %dx
mov %bx, %ax
div %cx
xor %dx, %ax
_val:
cmp $0x0, %al
ja ass
mov %al, %es:(%bx)
ass:

dec %bx
jne loop

addb $8, _val+1
jnz pre


# quit
mov $0x4C, %ah
int $0x21
