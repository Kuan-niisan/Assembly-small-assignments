.data
    Message: .asciiz "Input a string:"
    String: .space 21
    reverse_str: .space 21
    rev_message: .asciiz "Reverse string:"
.text
    # user input
    li $v0, 54
    la $a0, Message
    la $a1, String
    li $a2, 21 # Corrected the syscall argument
    syscall
    
    # get user length
get_length:
    li $t0, 0   # index = 0 for string
loop:
    lb $t1, String($t0)    # load current value of t0 to t1
    beqz $t1, reverse   # if String[i] == 0, reverse the string
    addi $t0, $t0, 1    # i = i + 1
    j loop
reverse:
    move $s0, $zero    # i = 0
    move $s1, $t0      # s1 = length of the string
reverse_loop:
    addi $s1, $s1, -1   # Decrement length counter
    blt $s1, $zero, end_of_reverse  # If s1 < 0, end
    lb $t2, String($s1)     # t2 = string[length - 1 - i]
    sb $t2, reverse_str($s0)    # reverse_str[i] = t2
    addi $s0, $s0, 1    # Increment index for reverse_str
    j reverse_loop
end_of_reverse:
    # Print reverse string message
    li $v0, 4
    la $a0, rev_message
    syscall
    
    # Print reversed string
    li $v0, 4
    la $a0, reverse_str
    syscall
