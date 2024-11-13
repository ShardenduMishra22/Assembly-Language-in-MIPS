
.data
.text
.globl main
main:
    li $t0,17
    li $t1,10
    move $t4,$t0
    move $t5,$t1

gcd:
    beq $t1,$zero,gcdEnd
    rem $t2,$t0,$t1
    move $t0,$t1
    move $t1,$t2
    j gcd

gcdEnd:
    move $t6,$t1

    mul $t3,$t4,$t5
    div $t3,$t6
    
    li $v0,10
    syscall