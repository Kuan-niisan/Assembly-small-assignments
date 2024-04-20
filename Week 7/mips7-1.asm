#Laboratory Exercise 7 Home Assignment 1
.text
main: 	li $a1,-23 #load input parameter 
 	jal abs #jump and link to abs procedure
 	nop
 	add $s0, $zero, $v1
 	li $v0,10 #terminate
 	syscall 
endmain:
#--------------------------------------------------------------------
# function abs
# param[in] $a1 the interger need to be gained the absolute value 
# return $v0 absolute value
#--------------------------------------------------------------------
abs:
	sub $v1,$zero,$a1 #put -(a1) in v1; in case (a1)<0
	bltz $a1,done #if (a1)<0 then done
 	nop
 	add $v1,$a1,$zero #else put (a0) in v1
done:
 
	jr $ra