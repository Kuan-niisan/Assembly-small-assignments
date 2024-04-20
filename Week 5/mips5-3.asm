.data
x: .space 1000 # malloc 1000 byte to string x
y: .asciiz "Hello" # string y
.text
	la $a1, y # y[0] = a1
	la $a0, x # x[0] = a0
strcpy:
	add $s0,$zero,$zero #s0 = i = 0
L1:
	add $t1,$s0,$a1 #t1 = s0 + a1 = i + y[0]
 			# = address of y[i]
	lb $t2,0($t1) 	#t2 = value at t1 = y[i]
	add $t3,$s0,$a0 #t3 = s0 + a0 = i + x[0] 
 			# = address of x[i]
	sb $t2,0($t3) 	#x[i]= t2 = y[i]
	beq $t2,$zero,end_of_strcpy #if y[i]==0, exit
	addi $s0,$s0,1 	#s0=s0 + 1 <-> i=i+1
	j L1 		#next character
end_of_strcpy:
	li $v0, 55
	la $a0, x
	syscall