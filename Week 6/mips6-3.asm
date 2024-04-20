.data
A: .word 6, 2, 5, 7, 10, 8  
Aend: .word                                       
string: .asciiz " "                             

.text
main:   
    la $a0, A #$a0 = Address(A[0])
    la $a1, Aend
    addi $a1, $a1, -4 #$a1 = Address(A[n-1])
    j bubble_sort

#--------------------------------------------------------------
# Procedure bubble_sort (ascending bubble sort using pointers)
# $t0 holds the address of the first element of A in inner_loop
# $t1 holds the address of the next element of A in inner_loop
# $t2 is an indicator for swapping element or not
# $t3 holds the address of the first element of A in outer_loop
# $t4 holds value of $t0 in inner_loop
# $t5 holds value of $t1 in inner_loop
#--------------------------------------------------------------
bubble_sort:    
    # Outer loop for iterating over the array
    la $t3, A        
    
outer_loop:
    #if no swap, set $t2 to 0
    li $t2, 0          
    
    # Inner loop for performing bubble sort on the array
    la $t0, A        
    
inner_loop:
    lw $t4, 0($t0)   
    
    addi $t1, $t0, 4
    lw $t5, 0($t1)   
    
    # Compare the current element with the next element
    ble $t4, $t5, no_swap
    
    #Swap
    sw $t5, 0($t0)    
    sw $t4, 0($t1)    
    
    #if a swap was made, set $t2 to 1
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
    # Print the sorted array
    la $t0, A          # $t0 holds the address of the first element of A
    
print_loop:
    lw $a0, 0($t0)  
    li $v0, 1        
    syscall           
    
    li $v0, 4         
    la $a0, string
    syscall           # Print string
    
    # Move to the next element
    addi $t0, $t0, 4
    
    # Check if we have reached the end of the array
    ble  $t0, $a1, print_loop
    
    # Exit the program
    li $v0, 10
    syscall
