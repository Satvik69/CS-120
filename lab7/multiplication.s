	#### Satvik Kukreti
	.data
a1:
	.word 3
b1:	
	.word 4
a2:
	.word 5
b2:	
	.word 7

space:	.asciiz " "
nl:	.asciiz "\n"

	.text
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, a1
	la $a1, b1
	jal multtable

	la $a0, a2
	la $a1, b2
	jal multtable
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra


multtable:
	lw $s0, 0($a0) #this is 3
	lw $s1, 0($a1) #this is 4
	li $s2, 1	#var i
	li $s3, 1	#var j
	j floop

floop:
	li $s3, 1
	bgt $s2, $s0, done #i > a
	ble $s2, $s0, sloop
	

sloop:
	bgt $s3, $s1, newline #j > b, 
	

	mul $s4, $s2, $s3
	la $a0, 0($s4)
	li $v0, 1
	syscall

	la $a0, space
	li $v0, 4
	syscall

	addi $s3, 1
	j sloop
	
newline:
	la $a0, nl #new line printed out
	li $v0, 4
	addi $s2, 1
	syscall
	
	j floop

done:
	jr $ra
