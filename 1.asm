.data
x : .word 10
y : .word -11

.text

.globl main
main:                # Define the main label here once

la $t2, x           # Load address of x into $t2
lw $t0, 0($t2)      # Load value of x into $t0

la $t2, y           # Load address of y into $t2
lw $t1, 0($t2)      # Load value of y into $t1

add $t2, $t1, $t0   # Add $t0 and $t1 and store result in $t2

li $v0, 10          # Prepare for program exit
add $a0, $t2, $t0   # Add $t2 and $t0, store in $a0
syscall             # Exit the program

li $v0, 10          # Exit program
syscall
