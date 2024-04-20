#Laboratory Exercise 4, Home Assignment 2
.text
li $s0, 0x12345678 #load test value for these function
andi $t1, $s0, 0xff000000	#Extract MSB of $s0, store into t1
srl $t2, $t1, 24
andi $s0, $s0, 0xFFFFFF00	#Clear LSB of $s0
xor $s0, $s0, 0x000000FF	#Set bits 7->0 to 1
xor $s0, $s0, $s0		#compare s0 with itself, if one bit != other => set to 0


