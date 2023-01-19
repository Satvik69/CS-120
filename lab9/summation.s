	#### Satvik Kukreti
	.data
str: .asciiz " summation is "
nl: .asciiz "\n"

	.text
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	#outer i value
	li $s1, 1
	
	#max value
	li $s2, 10
	
	jal f
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

f:
	beq $s1, $s2, finish

	#total
	li $s0, 0

	#inner i value
	li $t0, 0
	
compute:
	add $s0, $s0, $t0

	beq $t0, $s1, done

	addi $t0, $t0, 1

	j compute

done:
	la $a0, 0($s1)
	li $v0, 1
	syscall

	la $a0, str
	li $v0, 4
	syscall

	la $a0, 0($s0)
	li $v0, 1
	syscall

	la $a0, nl
	li $v0, 4
	syscall
	
	addi $s1, $s1, 1

	j f
	
finish:
	jr $ra
	
	

	
