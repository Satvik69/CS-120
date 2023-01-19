	#Satvik Kukreti
	.data
x:
	.word 3
	.word 10
	.word 4
	.word 25
	.word 33
	.word 6
	.word 2
	.word 0

prompt:
	.asciiz "The total of things less than 10 is "

nl:
	.asciiz "\n"

	.text
main:
	li $t0, 0	#total
	la $t1, x	#address of x
	li $t2, 10	#conditional

wh:
	lw $t3, 0($t1)		#value of x element
	beq $t3, $0, done	#while conditional
	blt $t3, $t2, if	#if conditional, branch less than
	addi $t1, $t1, 4
	j wh

if:
	add $t0, $t0, $t3
	addi $t1, $t1, 4
	j wh

done:
	la $a0, prompt
	li $v0, 4
	syscall

	move $a0, $t0
	li $v0, 1
	syscall

	la $a0, nl
	li $v0, 4
	syscall

	li $v0, 10
	syscall
	
	
