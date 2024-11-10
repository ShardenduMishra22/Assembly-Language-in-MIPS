.data
x: .word 18
y: .word 10

.text
.globl main
main:

la $t2, x           # Load address of x
lw $t0, 0($t2)      # Load value of x into $t0

la $t2, y           # Load address of y
lw $t1, 0($t2)      # Load value of y into $t1

# Swap the values
move $t2, $t0       # Save value of x in $t2
move $t0, $t1       # Store value of y in $t0
move $t1, $t2       # Store value of x in $t1

li $v0, 10          # Exit program
syscall