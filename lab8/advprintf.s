	#### Satvik Kukreti

	.data
str1: .asciiz "The number is # and here is a string $ that gets spliced in"
str2: .asciiz "WHEEE!"

.text
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	li $t1, 0
	li $t2, 1


#Even though we are only looping through main once
#I still wanted to keep the same format as my previous
#question's code
	
floop:	
	# Push all the arguments on the stack
	bge $t1, $t2, fdone
	addi $t1, $t1, 1
	
    addi $sp, $sp, -12
    la $t0, str2
    sw $t0, 8($sp)
    li $t0, 999
    sw $t0, 4($sp)
    la $t0, str1
    sw $t0, 0($sp)
	jal printf
	
    addi $sp, $sp, 12

	j floop

fdone:
	# restore RA, return
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

	
# Your Modified Printf Here!
# Add support for $ to insert a string!
	
printf:
	# Store ra, s0, s1
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)

	# The arguments to the function are now at
	# 12($sp) and above
	lw $s0, 12($sp)
	la $s3, 20($sp)
	addi $s1, $sp, 16

	# $s0 is now the POINTER to the original string
	# $s1 is a pointer to the first argument after the string

	# Get one letter at a time and print
loop:	lb $a0, 0($s0)
	
	# Exit if it's zero
	beq $a0, $0, done

	# if statement -- check against '#'
	li $t0, '#'
	beq $a0, $t0, else

	li $t0, '$'
	beq $a0, $t0, selse
	
	# "If" part -- if it's not # or $
	li $v0, 11
	syscall
	b if_done
	
else:	# print the number pointed to by s1, then move the pointer
	lw $a0, 0($s1)
	li $v0, 1
	syscall

	addi $s1, $s1, 4
	j if_done

selse:
	lw $a0, 0($s3)
	li $v0, 4
	syscall
	
if_done:
	addi $s0, $s0, 1
	b loop

done:	# Restore registers, return
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	addi $sp, $sp, 12

	jr $ra
	
