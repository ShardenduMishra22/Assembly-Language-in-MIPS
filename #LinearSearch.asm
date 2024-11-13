.data
    array: .word 5, 10, 15, 20, 25, 30  # Array to search in
    size: .word 6                       # Number of elements in the array
    search_val: .word 25                # Value to search for in the array

.text
.globl main

main:
    lw $a1, search_val                  # Load the search value into $a1
    la $a0, array                       # Load the address of the array into $a0
    lw $a2, size                        # Load the size of the array into $a2

    li $t0, 0                           # Initialize index counter $t0 to 0

search_loop:
    beq $t0, $a2, search_fail           # If $t0 == $a2, end of array reached; go to search_fail
    sll $t1, $t0, 2                     # Calculate byte offset (index * 4) for the current element
    add $t1, $t1, $a0                   # Add offset to base address of array
    lw $t2, ($t1)                       # Load array[$t0] value into $t2
    beq $t2, $a1, store_index           # If array[$t0] == search_val, go to store_index
    addi $t0, $t0, 1                    # Increment index counter
    j search_loop                       # Repeat loop

store_index:
    move $t3, $t0                       # Store the index of the found element in $t3
    j end_program                       # Jump to end_program

search_fail:
    li $t3, -1                          # Set $t3 to -1 if the search value is not found

end_program:
    li $v0, 10                          # Exit the program
    syscall                             