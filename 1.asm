# Store 32b in $t0, $t1 and store in $t2

.data
x : .word 10
y : .word -11

.text

.globl main
main:

la $t2,x
lw $t0,0($t2)

la $t2,y
lw $t1,0($t2)

add $t2,$t1,$t0

li $v0, 10
add $a0, $t2, $t0
syscall

li $v0, 10
syscall