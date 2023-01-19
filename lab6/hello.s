	#Satvik Kukreti
	.data
hello:	.asciiz "Hello, world. CS120!\n"

	.text
main:
	la $a0, hello
	li $v0, 4
	syscall

	li $v0, 10
	syscall
