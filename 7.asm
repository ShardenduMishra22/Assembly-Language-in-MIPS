#PROGRAM 3 : GCD and LCM of two numbers.

.data
x: .word 10
y: .word 17

.text

.globl main
main:
    la $t2, x              # Load address of x
    lw $t0, 0($t2)         # Load value of x into $t0
    la $t2, y              # Load address of y
    lw $t1, 0($t2)         # Load value of y into $t1
    move $t4, $t0          # Copy x to $t4 for LCM calculation
    move $t5, $t1          # Copy y to $t5 for LCM calculation

gcd:                       # Calculate GCD using Euclidean algorithm
    beq $t0, $t1, gcdEnd   # If $t0 == $t1, GCD found in $t0
    blt $t0, $t1, gcdSwap  # If $t0 < $t1, swap values
    sub $t0, $t0, $t1      # $t0 = $t0 - $t1 if $t0 > $t1
    j gcd                  # Repeat until GCD is found

gcdSwap:                    
    move $t3, $t0          # Swap $t0 and $t1
    move $t0, $t1
    move $t1, $t3
    j gcd

gcdEnd:
    move $t6, $t0          # Store GCD in $t6

    mul $t3, $t4, $t5      # Calculate x * y for LCM
    div $t3, $t6           # Divide (x * y) by GCD
    mflo $t3               # Resulting LCM in $t3

    li $v0, 10             # Exit program
    syscall
