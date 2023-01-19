	#Satvik Kukreti
	.text
main:	li $t0, 0
	li $t1, 10
	li $a0, 0

wh:	beq $t0, $t1, done
	add $a0, $a0, $t0
	addi $t0, $t0, 1
	j wh

done:	li $v0, 1
	syscall

	li $v0, 10
	syscall
