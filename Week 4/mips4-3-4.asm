.text
	addi 	$s2, $zero, 5
	addi 	$s1, $zero, -4
	#ble 	$s1,$s2,L
	slt     $t0, $s2, $s1
	beq  	$t0, $zero, L
	#random code for jumping demonstration
	addi $s3, $zero, 1 #this will not run
L: