.data
num1: .word 12
num2: .word 15

.text
main:
    lw $t0, num1        # Load num1 into $t0
    lw $t1, num2        # Load num2 into $t1
    move $a0, $t0       # Move num1 to $a0 for gcd call
    move $a1, $t1       # Move num2 to $a1 for gcd call
    jal gcd
    move $t2, $v0       # Store GCD in $t2

    # Calculate LCM directly in main
    move $a0, $t0       # num1
    move $a1, $t1       # num2
    multu $a0, $a1      # num1 * num2
    mflo $t5            # Store product in $t5
    divu $t5, $t2       # Divide product by GCD
    mflo $t3            # Store LCM in $t3

    li $v0, 10
    syscall

gcd:
    beq $a0, $a1, gcd_end
    blt $a0, $a1, gcd_swap
    sub $a0, $a0, $a1
    j gcd
gcd_swap:
    move $t4, $a0
    move $a0, $a1
    move $a1, $t4
    j gcd
gcd_end:
    move $v0, $a0
    jr $ra
