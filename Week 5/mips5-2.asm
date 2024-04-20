.data
	Message: .asciiz "The sum of "
	Message2: .asciiz " and "
	Message3: .asciiz " is "
.text
	li $v0, 4
	la $a0, Message
	syscall
	
	li $v0, 1
	li $a0, 10 
	add $s0, $zero, $a0 #init value of $s0 to 10
 	syscall
 	
	li $v0, 4
	la $a0, Message2
	syscall
	
	li $v0, 1
	li $a0, 11 
	add $s1, $zero, $a0 #init value of $s1 to 11
	syscall
	
	li $v0, 4
	la $a0, Message3
	syscall
	
	li $v0, 1
	add  $s4, $s1, $s0 #result = $s0 + $s1
	la $a0, 0($s4)
	syscall

