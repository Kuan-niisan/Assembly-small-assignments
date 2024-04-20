#Laboratory Week 3, Assignment 6

.data
Array: .word 1, 2, -7, 6, 4	#Assign memory space and value for an array A[I]

.text
	la $t0, Array		#Load base address of A[I] into $t0
	addi $t3, $zero, 5	#N = 5
	addi $s0, $zero, 1	#Array stepping
	addi $s1, $zero, 0	#Array starting index

#Convert array's value to absolute
loop:
	add $s4, $s1, $s1     # $t1 = 2 * $s1
   	add $s4, $s4, $s4     # $t1 = 4 * $s1
    	add $s4, $s4, $t0    # $t1 stores the address of A[i]
	lw $t2, 0($s4)		#Load value of A[I] into $t2
	sw  $t2, 0($v0) #store t2 to v0
	add $s1, $s1, $s0	#I = I + step
	blt $t2, $zero, convert	#If A[i] < 0 then goto 'convert'
	blt $s1, $t3, loop	#(Branch if less than) rerun 'loop' if I < N
	j reset
	
convert:
	addi $t8, $zero, -1
	sw $t2, 0($v0) #store t2 to k0
	mul $t2, $t2, $t8	#A[i] = A[i] * (-1)
	add $s4, $s1, $s1     # $t1 = 2 * $s1
   	add $s4, $s4, $s4     # $t1 = 4 * $s1
    	add $s4, $s4, $t0    # $t1 stores the address of A[i]
    	lw $t2, 0($s4)		#Load value of A[I] into $t2
	blt $s1, $t3, loop  # (Branch if less than) rerun 'loop' if I < N
	j reset
	
	
reset:
	addi $s1, $zero, 0	#Reset array starting index
	addi $s2, $zero, 0	#Array largest value


loop_largest:
	add $s4, $s1, $s1     # $t1 = 2 * $s1
   	add $s4, $s4, $s4     # $t1 = 4 * $s1
    	add $s4, $s4, $t0    # $t1 stores the address of A[i]
	lw $v0, 0($s4)		#Load value of A[I] into $t2
	bge $v0, $s2, update_largest	#Update largest = A[i] if A[i] >= largest
	add $s1, $s1, $s0	#I = I + step
	blt $s1, $t3, loop_largest	#(Branch if less than) rerun 'loop' if I < N
	j endloop
	
update_largest:			#Update largest = A[i]
	add $s2, $zero, $t2
	add $s1, $s1, $s0	#I = I + step
	blt $s1, $t3, loop_largest  # (Branch if less than) rerun 'loop' if I < N

endloop: