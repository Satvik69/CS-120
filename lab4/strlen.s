	##### Satvik Kukreti
	
.data
str0: .asciiz "Hello world"
str1: .asciiz "This is a longer string."
nl: .asciiz "\n"
	
.text
main:
    addi $sp, $sp, -4
    sw $ra, 0($sp)  # Save return address

    la $a0, str0
    jal strlen   # Calculate the length of str0
    move $a0, $v0  # Print out the length
    li $v0, 1
    syscall
    la $a0, nl
    li $v0, 4
    syscall
    la $a0, str1   # Calculate the length of str1
    jal strlen
    move $a0, $v0
    li $v0, 1
    syscall
    la $a0, nl
    li $v0, 4
    syscall
    lw $ra, 0($sp)   # Restore return address
    jr $ra  # back to the OS

#### YOUR CODE FOR STRLEN HERE ####

strlen:
	li $v0, 0		#is my counter

while:	
	lb $t0, 0($a0)		#stores first byte of a0
	beq $t0, $0, done	#conditional that checks if we are done
	addi $a0, $a0, 1	#adds 1 to a0 in opes of looping
	addi $v0, $v0, 1	#increments counter
	j while			#loops back
		
done:
	jr $ra			#returns back to main
	
	
	
