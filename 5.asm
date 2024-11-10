# area square

.data
.text
.globl main
main:

li $t0,45
li $t1,55

mul $t2,$t1,$t0

li $v0,10
syscall