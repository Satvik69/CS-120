	#### Satvik Kukreti
	
.data
str: .asciiz "This HAS UPPER and lower CASE letters."

.text
main:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    la $a0, str
    jal lowercase
    # Now we print the string, which lowercase has modified
    la $a0, str
    li $v0, 4
    syscall
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

### YOUR CODE for lowercase here
	
lowercase:	
	lb $s0, 0($a0)
	li $t0, 'Z'
	li $t1, 'A'
	beq $s0, $0, done
	blt $s0, $t1, addition
	bgt $s0, $t0, addition
	ble $s0, $t0, uppercase
	

addition:	
	addi $a0,$a0, 1
	j lowercase

uppercase:
	addi $s0, $s0, 32
	sb $s0, 0($a0)
	j addition

done:
	jr $ra
	
	
