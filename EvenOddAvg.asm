.data
number : .word 1, 2, 3, 4, 5, 6
evenArr : .space 24
oddArr : .space 24

.text
.globl main
main:
    la $t0, num
    la $t1, evenArr
    la $t2, oddArr
    li $t3, 0
    li $t4, 6

check:
    lw $t5, 0($t0)
    add $t3,$t3,$t5
    
    andi $t6,$t5,1
    beqz $t6,storeEven

storeOdd:
    sw $t5,0($t2)
    addi $t2,$t2,4
    j next

storeEven:
    sw $t5,0($t1)
    addi $t1,$t1,4

next:
    addi $t0,$t0,4
    addi $t4,$t4,-1
    bnez $t4,check

    li $t4,6
    div $t3,$t4

    li $v0,10
    syscall