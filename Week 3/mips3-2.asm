#Laboratory Exercise 3, Home Assignment 2
.data
	Array: .word 0, 4, 3, 0, -1 #20 bytes	
.text
    addi $s1, $zero, 0    # i = 0
    addi $s3, $zero, 3   # N = 5 (array size)
    la $s2, Array         # load address of array to $s2
    addi $s4, $zero, 1    # step = 1
    addi $s5, $zero, 0    # init_sum = 0

loop:
    add $t1, $s1, $s1     # $t1 = 2 * $s1
    add $t1, $t1, $t1     # $t1 = 4 * $s1
    add $t1, $t1, $s2     # $t1 stores the address of A[i]
    lw $t0, 0($t1)        # load value of A[i] into $t0
    add $s1, $s1, $s4     # i = i+step
    add $s5, $s5, $t0	  # sum = sum +A[i]
    bgt   $s1, $s3, endloop # endloop if i > N
    beqz $t0, loop	  # if A[i] == 0, go to loop
    bnez $t0, skip        # if A[i] != 0, skip the loop iteration 
skip:
    add $t1, $s1, $s1     # $t1 = 2 * $s1
    add $t1, $t1, $t1     # $t1 = 4 * $s1
    add $t1, $t1, $s2     # $t1 stores the address of A[i]
    lw $t0, 0($t1)        # load value of A[i] into $t0
    bgt   $s1, $s3, endloop # endloop if i > N
    beqz $t0, loop    	  # if A[i] == 0, go to loop
    bnez $t0, skip        # if A[i] != 0, skip the loop iteration
endloop: