#Laboratory Exercise 3, Home Assignment 1
start:

li 	$t1, 3 #x=3
li	$t2, 4 #y=4
li	$t3, 5 #z=5
addi	$s2, $zero, 4 #j=4
addi	$s1, $zero, 5 #i=5
addi	$s3, $zero, 3 #m=3
addi	$s4, $zero, 6 #n=6
add	$t0, $s1, $s2 #$t0 = i+j
add 	$t4, $s3, $s4 #$t4 = m + n
ble     $t0,$t4, else
addi $t1,$t1,1 # then part: x=x+1
addi $t3,$zero,1 # z=1
j endif # skip “else” part
else: addi $t2,$t2,-1 # begin else part: y=y-1
add $t3,$t3,$t3 # z=2*z
endif:
