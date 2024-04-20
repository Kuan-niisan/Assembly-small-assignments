.text
	addi $s0, $zero, 5
	addi $s1, $zero, -4
	#abs $s0, $s1
	sra	$at,$s1, 31
	xor $s0, $s1, $at
	subu $s0, $s0, $at
	
