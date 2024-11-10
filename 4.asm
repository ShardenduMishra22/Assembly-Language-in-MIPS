.data
.text
.globl main
main:

li $t0,50
li $t1,40

mul $t2,$t1,$t0

mfhi $t3
mflo $t4

li $v0,10
syscall