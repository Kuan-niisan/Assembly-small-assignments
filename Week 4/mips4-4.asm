#Laboratory Exercise 4
.text
start:
    addi    	$s1, $zero, 2147483647  # $s1 = 2147483647
    addi    	$s2, $zero, 1 	# $s2 = 1
    li      	$t0, 0                    # Default Overflow status(0)
    addu	$s3, $s1, $s2 		# $s3 = $s1 + $s2
    xor     	$t1, $s1, $s2             # Test if $s1 and $s2 have the same sign
    bltz    	$t1, NOT_OVERFLOW	# Branch to NOT_OVERFLOW if they have different signs
    xor     	$t2, $s1, $s3             # Test if $s1 and $s3 have the same sign
    bltz    	$t2, OVERFLOW             # Branch to OVERFLOW if they have different signs
    xor     	$t2, $s2, $s3             # Test if $s2 and $s3 have the same sign
    bltz    	$t2, OVERFLOW         # Branch to OVERFLOW if they have the different signs
    j       NOT_OVERFLOW            
OVERFLOW:
    li      	$t0, 1                    # Set $t0 to 1 indicating overflow
NOT_OVERFLOW:
