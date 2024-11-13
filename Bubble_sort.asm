.data
array: .word 18, 65, 13, 12, 55   # Your unsorted array
length: .word 5              # Length of the array
space: .asciiz " "        # Newline for formatting output

.text
main:
    la $t0, array            # Load base address of array
    lw $t1, length           # Load length of array
    addi $t1, $t1, -1        # Set up for outer loop

outer_loop:
    addi $t2, $zero, 0       # Reset inner loop index

inner_loop:
    lw $t3, 0($t0)           # Load array[i]
    lw $t4, 4($t0)           # Load array[i+1]
    ble $t3, $t4, skip       # If array[i] <= array[i+1], skip

    # Swap array[i] and array[i+1]
    sw $t4, 0($t0)           
    sw $t3, 4($t0)           

skip:
    addi $t0, $t0, 4         # Move to next element
    addi $t2, $t2, 1         # Increment inner loop counter
    bne $t2, $t1, inner_loop # Repeat inner loop if t2 < length-1

    la $t0, array            # Reset base address of array
    addi $t1, $t1, -1        # Decrease outer loop count
    bgtz $t1, outer_loop     # Repeat outer loop if t1 > 0

# Printing sorted array
print_array:
    la $t0, array2            # Reset base address of array
    lw $t1, length           # Load length of array

print_loop:
    lw $a0, 0($t0)           # Load current array element into $a0 for printing
    li $v0, 1                # Syscall for printing integer
    syscall

    la $a0, space          # Load newline character
    li $v0, 4                # Syscall for printing string
    syscall

    addi $t0, $t0, 4         # Move to next element in array
    addi $t1, $t1, -1        # Decrease counter
    bgtz $t1, print_loop     # Repeat until all elements printed

end:
    j end                    # Infinite loop to end program





































































































































array2: .word 18, 12, 55, 65, 13