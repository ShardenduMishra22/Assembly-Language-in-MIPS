.data
string:     .asciiz "racecar"   # Hardcoded string to check if it's a palindrome

.text
.globl main

main:
    la   $a0, string          # Load address of the string into $a0
    jal  is_palin             # Jump and link to is_palin subroutine to check if the string is a palindrome
    move $a0, $v0             # Move the result (1 or 0) from $v0 to $a0 for further use

    li   $v0, 10              # Prepare to exit the program
    syscall                   # System call to exit the program

is_palin:
    move $t0, $a0             # Copy the address of the string to $t0 (for iterating through it)
    li   $t1, 0               # Initialize length counter ($t1) to 0

find_len:
    lb   $t2, ($t0)           # Load byte from the string into $t2
    beq  $t2, $zero, len_found # If byte is null (end of string), jump to len_found
    addi $t1, $t1, 1          # Increment the length counter
    addi $t0, $t0, 1          # Move to the next character in the string
    j    find_len             # Repeat the loop to find the string length

len_found:
    move $t2, $t1             # Move the length into $t2
    move $t0, $a0             # Reset $t0 to the start of the string
    add  $t3, $a0, $t1        # Add the length to the address to get the last byte's address
    addi $t3, $t3, -1         # Move $t3 to point to the last character (null-terminated byte)

    li   $v0, 1               # Assume palindrome (set $v0 to 1 initially)

check_palin:
    bge  $t0, $t3, done_check  # If $t0 is greater than or equal to $t3, we're done checking
    lb   $t4, ($t0)            # Load byte at current start position of the string into $t4
    lb   $t5, ($t3)            # Load byte at current end position of the string into $t5
    bne  $t4, $t5, not_palin   # If the characters don't match, it's not a palindrome
    addi $t0, $t0, 1           # Move $t0 forward (check next character)
    addi $t3, $t3, -1          # Move $t3 backward (check previous character)
    j    check_palin           # Repeat the loop for the next pair of characters

not_palin:
    li   $v0, 0                # Set $v0 to 0 (not a palindrome)

done_check:
    jr   $ra                   # Return from the subroutine
