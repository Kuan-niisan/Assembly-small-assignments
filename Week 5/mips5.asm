.text
    	li $s0, 80   # $s0 = 80
    	li $s1, 32   # $s1 = 32
    	#product of $s0 and $s1
    	li $t0, 1	#init exponent = 1
    	bne $t0, $s1, loop # if $t0 != $s1, go to loop
loop:
	sll	$t0, $t0, 1 #shift 1 bit to the left
	beq	$t0, $s1, out_loop #out_loop if $t0 = $s1 = $32
	j loop
out_loop:
	mul	$t1, $s0, $t0 