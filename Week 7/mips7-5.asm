.data
Message: .asciiz "Largest: "
Message2: .asciiz ","
Message3: .asciiz "Smallest: "
Message4: .asciiz "\n"
.text
main: 	li $s0,2 #load test input
 	li $s1,1
 	li $s2,3
 	li $s3,6
 	li $s4,8
 	li $s5,10
 	li $s6,4
 	li $s7,-1
 	nop 

#---------------------------------------------------------------------
#Procedure WARP: assign value and call Max
#---------------------------------------------------------------------  
WRAP:
	addi $sp,$sp,-32 #make space for value
	
	sw $s7, 0($sp) #load $s7
	addi $sp, $sp, 4
	sw $s6, 0($sp) #load $s6
	addi $sp, $sp, 4
	sw $s5, 0($sp) #load $s5
	addi $sp, $sp, 4
	sw $s4, 0($sp) #load $s4
	addi $sp, $sp, 4
	sw $s3, 0($sp) #load $s3
	addi $sp, $sp, 4
	sw $s2, 0($sp) #load $s2
	addi $sp, $sp, 4
	sw $s1, 0($sp) #load $s1
	addi $sp, $sp, 4
	sw $s0, 0($sp) #load $s0
	addi $sp, $sp, 4
	
#----------------------------------------------
#find procedure: make an index run from 0->7
#assign k0 = Max element
#assign k1 = Min element
#assign t0 = address of k0
#assign t1 = address of k1
#----------------------------------------------	

find:
	li $t3, 0 #t3 = 1 = i 
	li $t4, 8 #t4 = 8, end procedure
	lw $k0, -4($sp) #k0 = s0  
	lw $k1, -4($sp) #k1 = s0
	
load:
	addi $t3, $t3, 1 #t3 = t3 +1 = i+1 
	add $t5, $t3, $t3 #t5 = 2t3 = 2i 
	add $t5, $t5, $t5 #t5 = 4t3 = 4i 
	sub $t5, $zero, $t5 #t1 = -4i 
	add $t2, $t5, $sp # t2 = sp - 4t1 = &A[i] 
	lw $a0, 0($t2) #a0 = *t2 = A[i] 
	addi $a1, $t3, -1 #a1 = t0-1 = A[i] 
	beq  $a1, $t4, endmain 
	nop  

Check_max:
	slt $a2, $k0, $a0 #if k0 < a0 => a1 = 1 (a0 <= k0) 
	beqz $a2, Check_min #if a1 = 0 => jump to min 
	nop 
	addi $k0, $a0, 0 #k0 = a0 
	addi $t0, $a1, 0 #t0 = a1 (vi tri max moi) 
	
Check_min:
	slt $a2, $a0, $k1 #(k1 <= a0 => jump to load) 
	beqz $a2, load 
	nop 
	addi $k1, $a0, 0 #k1 = a0 
	addi $t1, $a1, 0 #t1 = a1 

	j load 
	
endmain:
#print max
	li $v0, 4
 	la $a0, Message
 	syscall
 	li $v0, 1
 	add $a0, $zero, $k0 #print max
 	syscall
 	li $v0, 4 
	la $a0, Message2 #print comma 
	syscall
	li $v0, 1
 	add $a0, $zero, $t0 #print address of max
 	syscall
 	li $v0, 4
 	la $a0, Message4 #newline
 	syscall
 	
#print min	
 	li $v0, 4
 	la $a0, Message3
 	syscall
 	li $v0, 1
 	add $a0, $zero, $k1 #print min
 	syscall
 	li $v0, 4 
	la $a0, Message2 #print comma 
	syscall
	li $v0, 1
 	add $a0, $zero, $t1 #print address of min
 	syscall
 	li $v0, 4
 	la $a0, Message4 #newline
 	syscall
	
