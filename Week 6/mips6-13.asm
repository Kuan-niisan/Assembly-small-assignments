.data
A: .word 6, 2, 5, 7, 10, 8  
Aend: .word                                       
string: .asciiz " "                             

.text
main:   
    la $a0, A         # $a0 = Address(A[0])
    la $a1, Aend
    addi $a1, $a1, -4 # $a1 = Address(A[n-1])
    j bubble_sort

#--------------------------------------------------------------
# Procedure bubble_sort (ascending bubble sort using pointers)
#--------------------------------------------------------------
bubble_sort:    
    # Outer loop for iterating over the array
    la $t3, A        
    
outer_loop:
    # If no swap, set $t2 to 0
    li $t2, 0          
    
    # Inner loop for performing bubble sort on the array
    la $t0, A        
    
inner_loop:
    lw $t4, 0($t0)   
    
    addi $t1, $t0, 4
    lw $t5, 0($t1)   
    
    # Print the current state of the array
    la $t6, A       # $t6 holds the address of the first element of A
    jal print_array

    # Compare the current element with the next element
    ble $t4, $t5, no_swap
    
    # Swap
    sw $t5, 0($t0)    
    sw $t4, 0($t1)    

    # Set $t2 to 1 to indicate a swap occurred
    li $t2, 1          
    
no_swap:
    # Move to the next pair of elements
    addi $t0, $t0, 4
    addi $t1, $t1, 4   
    
    # Check if we have reached the end of the array
    bne $t0, $a1, inner_loop
    
    # If no swaps were made in this pass, the array is sorted
    beq $t2, $zero, end_bubble_sort
    
    # Move to the next element in the outer loop
    addi $t3, $t3, 4    
    
    # Check if we have reached the end of the array
    bne $t3, $a1, outer_loop
    
end_bubble_sort:
    # Print the final sorted array
    la $t6, A       # $t6 holds the address of the first element of A
    jal print_array
    
    # Exit the program
    li $v0, 10
    syscall

#--------------------------------------------------------------
# Procedure print_array
#--------------------------------------------------------------
print_array:
    # Print the array
    lw $t7, 0($t6)    # Load the current element to be printed
    li $v0, 1         # syscall code for printing an integer
    move $a0, $t7     # Move the integer to $a0 for printing
    syscall           # Print the integer
    
    # Print a space character
    li $v0, 4         # syscall code for printing a string
    la $a0, string    # Load the address of the newline string
    syscall           # Print the newline
    
    # Move to the next element
    addi $t6, $t6, 4
    
    # Exit the subroutine
    jr $ra
