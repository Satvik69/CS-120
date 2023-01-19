	#### Satvik Kukreti

	.data
str1: .asciiz "abcxyz"
str2: .asciiz "xxxxxxx"

r1: .asciiz "First: "
r2: .asciiz "Second: "
nl: .asciiz "\n"
	
	.text

main:
	#stored the return address
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	#storing the strings
	addi $sp, $sp, -8
	la $t0, str1
	sw $t0, 0($sp)
	la $t0, str2
	sw $t0, 4($sp)

	li $t1, 0
	addi $sp, $sp, -8
	sw $t1, 4($sp)
	
	jal points

	lw $ra, 16($sp)
	addi $sp, $sp, 20
	jr $ra
	
points:	
	sw $ra, 0($sp)
	
	lw $t1, 4($sp)
	
	#if this is the first time iterating, then load str1
	beq $t1, $0, fiteration

	#end the program
	#li $t2, 2
	#beq $t1, $t2, finish

	#else, get str2
	lw $s0, 12($sp)
	j total
	
fiteration:	
	#getting str1
	lw $s0, 8($sp)
	
total:
	#setting up the total variable
	li $s1, 0

while:
	#loading str into arg register
	lb $a0,0($s0)

	#reaching end of str
	beq $a0, $0, done

	#if char = x
	li $t0, 'x'
	beq $a0, $t0, if

	#else
	add $s1, $s1, $a0
	
	j loop

if:
	addi $s1, $s1, 5
	
loop:
	addi $s0, $s0, 1
	j while

done:
	lw $t1, 4($sp)
	li $t2, 1
	beq $t1, $t2, done2
	
	la $a0, r1
	li $v0, 4
	syscall

	la $a0, 0($s1)
	li $v0, 1
	syscall

	la $a0, nl
	li $v0, 4
	syscall

	addi $t1, $t1, 1
	sw $t1, 4($sp)

	j points

done2:	
	la $a0, r2
	li $v0, 4
	syscall

	la $a0, 0($s1)
	li $v0, 1
	syscall

	la $a0, nl
	li $v0, 4
	syscall

	j finish

finish:
	jr $ra
