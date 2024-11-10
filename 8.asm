.data
numbers: .word 4, 2, 3, 4, 5, 6
evenArr: .space 24
oddArr: .space 24

.text
.globl main
main:
    la $t0, numbers        # Base address of numbers
    la $t1, evenArr        # Base address of evenArr    
    la $t2, oddArr         # Base address of oddArr
    li $t3, 0              # Initialize sum
    li $t4, 6              # Element count

loop:
    lw $t5, 0($t0)         # Load number
    add $t3, $t3, $t5      # Add to sum
    andi $t6, $t5, 1       # Check even/odd
    beqz $t6, store_even   # If even, go to store_even

    sw $t5, 0($t2)         # Store in oddArr
    addi $t2, $t2, 4       # Increment oddArr position
    j next

store_even:
    sw $t5, 0($t1)         # Store in evenArr
    addi $t1, $t1, 4       # Increment evenArr position

next:
    addi $t0, $t0, 4       # Next number
    addi $t4, $t4, -1      # Decrement count
    bnez $t4, loop         # Loop if count > 0

    li $t4,6
    div $t3,$t4            # Calculate average
    mflo $a0               # Move avg to $a0
    
    li $v0,10              # Exit
    syscall               