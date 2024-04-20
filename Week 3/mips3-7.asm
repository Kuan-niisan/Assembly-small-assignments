.data
Array: .word 1, 2, -7, 6, 4    # Original array
LargestValue: .word 0           # Variable to store the largest absolute value

.text
    la $t0, Array        # Load base address of Array into $t0
    addi $t3, $zero, 5   # N = 5
    addi $s0, $zero, 1   # Array stepping
    addi $s1, $zero, 0   # Array starting index
    addi $s2, $zero, 0   # Largest value found so far

# Convert array's value to absolute and find the largest absolute value
loop:
    add $s4, $s1, $s1    # $s4 = 2 * $s1
    add $s4, $s4, $s4    # $s4 = 4 * $s1
    add $s4, $s4, $t0    # $s4 stores the address of A[i]
    lw $t2, 0($s4)       # Load value of A[i] into $t2
    blt $t2, $zero, convert  # If A[i] < 0, go to 'convert'
    bge $t2, $s2, update_largest  # If A[i] >= LargestValue, update LargestValue
    add $s1, $s1, $s0    # Increment the array index
    blt $s1, $t3, loop   # If index < N, repeat the loop
    j endloop            # Otherwise, end the loop

convert:
    mul $t2, $t2, -1     # Convert negative value to positive
    sw $t2, 0($s4)       # Store the updated value back into the array
    bge $t2, $s2, update_largest  # If A[i] >= LargestValue, update LargestValue
    add $s1, $s1, $s0    # Increment the array index
    blt $s1, $t3, loop   # If index < N, repeat the loop
    j endloop            # Otherwise, end the loop

update_largest:
    add $s2, $zero, $t2  # Update LargestValue with A[i]
    add $s1, $s1, $s0    # Increment the array index
    blt $s1, $t3, loop   # If index < N, repeat the loop
    j endloop            # Otherwise, end the loop

endloop:
