.data
.align 4
_intG: .space 4

.data
.align 4
_boolG: .space 4

.text
func1:
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	subu  $sp, $sp, 0
	addu  $fp, $sp, 8

.data
.L0: .asciiz "Testing void function with no parameters.\n"
.text
	la    $t0, .L0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

_func1_exit:
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $ra, 0($fp)
	move  $t0, $fp		#Move Frame Pointer into temp register, control link.
	lw    $fp, -4($fp)
	move  $sp, $t0		#Move Stack Pointer back to origin.
	addi  $sp, $sp, 0		#Move stack pointer before formals.
	sw    $t1, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	jr    $ra		#Return.
.text
func2:
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	subu  $sp, $sp, 4
	addu  $fp, $sp, 12

.data
.L1: .asciiz "Testing int function with 2 parameters.\n"
.text
	la    $t0, .L1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L2: .asciiz "Parameters passed in are: "
.text
	la    $t0, .L2
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, 4($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L3: .asciiz " and "
.text
	la    $t0, .L3
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, 8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L4: .asciiz "\n"
.text
	la    $t0, .L4
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, 4($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	add   $t0, $t0, $t1		#Plus node.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t0, -8($fp)
	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	j     _func2_exit		#Jump to caller
_func2_exit:
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $ra, 0($fp)
	move  $t0, $fp		#Move Frame Pointer into temp register, control link.
	lw    $fp, -4($fp)
	move  $sp, $t0		#Move Stack Pointer back to origin.
	addi  $sp, $sp, 8		#Move stack pointer before formals.
	sw    $t1, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	jr    $ra		#Return.
.text
.globl main
main:
__start:
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	subu  $sp, $sp, 24
	addu  $fp, $sp, 32

	li    $t0, 2
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t0, _intG		#Save in global.
	li    $t0, 4
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t0, -8($fp)
	li    $t0, 6
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $t1, 0
	sub   $t0, $t1, $t0		#Unary Minus.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t0, -12($fp)
	li    $t0, 0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t0, _boolG		#Save in global.
	li    $t0, 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t0, -28($fp)
.data
.L5: .asciiz "Testing Arithmetic Operators:\n"
.text
	la    $t0, .L5
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L6: .asciiz "Printing intL1: "
.text
	la    $t0, .L6
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L7: .asciiz "\n"
.text
	la    $t0, .L7
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L8: .asciiz "Printing intL2: "
.text
	la    $t0, .L8
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -12($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L9: .asciiz "\n"
.text
	la    $t0, .L9
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L10: .asciiz "Printing intG: "
.text
	la    $t0, .L10
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, _intG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L11: .asciiz "\n"
.text
	la    $t0, .L11
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L12: .asciiz "Printing intL1 + intG: "
.text
	la    $t0, .L12
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, _intG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	add   $t0, $t0, $t1		#Plus node.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L13: .asciiz "\n"
.text
	la    $t0, .L13
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L14: .asciiz "Printing intL1 - intG: "
.text
	la    $t0, .L14
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, _intG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sub   $t0, $t0, $t1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L15: .asciiz "\n"
.text
	la    $t0, .L15
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L16: .asciiz "Printing intL2 * intL1 : "
.text
	la    $t0, .L16
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -12($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	mult  $t0, $t1		#Times node.
	mflo  $t0		#Store lo into T0.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L17: .asciiz "\n"
.text
	la    $t0, .L17
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L18: .asciiz "Printing intL2 / intG: "
.text
	la    $t0, .L18
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -12($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, _intG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	div   $t0, $t1		#Divide node.
	mflo  $t0		#Store lo into T0.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L19: .asciiz "\n"
.text
	la    $t0, .L19
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L20: .asciiz "Printing -intL1: "
.text
	la    $t0, .L20
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $t1, 0
	sub   $t0, $t1, $t0		#Unary Minus.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L21: .asciiz "\n"
.text
	la    $t0, .L21
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L22: .asciiz "Printing intL1++: "
.text
	la    $t0, .L22
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -8($fp)
	addi  $t0, $t0, 1		#Post Increment.
	sw    $t0, -8($fp)

	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L23: .asciiz "\n"
.text
	la    $t0, .L23
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L24: .asciiz "Printing intG--: "
.text
	la    $t0, .L24
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, _intG		#load global
	addi  $t0, $t0, -1		#Post Increment.
	sw    $t0, _intG		#save word

	lw    $t0, _intG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L25: .asciiz "\n"
.text
	la    $t0, .L25
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L26: .asciiz "\n"
.text
	la    $t0, .L26
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L27: .asciiz "Testing Logical Operators:\n"
.text
	la    $t0, .L27
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L28: .asciiz "Printing boolL: "
.text
	la    $t0, .L28
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -28($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for a bool.
	syscall

.data
.L29: .asciiz "\n"
.text
	la    $t0, .L29
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L30: .asciiz "Printing boolG: "
.text
	la    $t0, .L30
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, _boolG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for a bool.
	syscall

.data
.L31: .asciiz "\n"
.text
	la    $t0, .L31
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L32: .asciiz "Printing !boolL: "
.text
	la    $t0, .L32
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -28($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $t1, 0
	seq   $t0, $t0, $t1		#Not Node.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for a bool.
	syscall

.data
.L33: .asciiz "\n"
.text
	la    $t0, .L33
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L34: .asciiz "Printing result of boolL && boolG: "
.text
	la    $t0, .L34
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -28($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .L35		#And node.
	lw    $t0, _boolG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .L35		#And node 2.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
.L35:
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for a bool.
	syscall

.data
.L36: .asciiz "\n"
.text
	la    $t0, .L36
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L37: .asciiz "Printing result of boolL && boolL: "
.text
	la    $t0, .L37
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -28($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .L38		#And node.
	lw    $t0, -28($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .L38		#And node 2.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
.L38:
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for a bool.
	syscall

.data
.L39: .asciiz "\n"
.text
	la    $t0, .L39
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L40: .asciiz "Printing result of boolL || boolG: "
.text
	la    $t0, .L40
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -28($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 1, .L41		#Or node.
	lw    $t0, _boolG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 1, .L41		#Or node 2.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
.L41:
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for a bool.
	syscall

.data
.L42: .asciiz "\n"
.text
	la    $t0, .L42
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L43: .asciiz "Printing result of boolG || boolG: "
.text
	la    $t0, .L43
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, _boolG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 1, .L44		#Or node.
	lw    $t0, _boolG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 1, .L44		#Or node 2.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
.L44:
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for a bool.
	syscall

.data
.L45: .asciiz "\n"
.text
	la    $t0, .L45
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L46: .asciiz "\n"
.text
	la    $t0, .L46
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L47: .asciiz "Testing Relational Operators:\n"
.text
	la    $t0, .L47
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L48: .asciiz "Printing intL1: "
.text
	la    $t0, .L48
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L49: .asciiz "\n"
.text
	la    $t0, .L49
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L50: .asciiz "Printing intL2: "
.text
	la    $t0, .L50
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -12($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L51: .asciiz "\n"
.text
	la    $t0, .L51
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L52: .asciiz "Printing intG: "
.text
	la    $t0, .L52
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, _intG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L53: .asciiz "\n"
.text
	la    $t0, .L53
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L54: .asciiz "Printing result of intG < intL1: "
.text
	la    $t0, .L54
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, _intG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	slt   $t0, $t0, $t1		#Less node.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for a bool.
	syscall

.data
.L55: .asciiz "\n"
.text
	la    $t0, .L55
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L56: .asciiz "Printing result of intL1 < intG: "
.text
	la    $t0, .L56
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, _intG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	slt   $t0, $t0, $t1		#Less node.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for a bool.
	syscall

.data
.L57: .asciiz "\n"
.text
	la    $t0, .L57
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L58: .asciiz "Printing result of intG > intL1: "
.text
	la    $t0, .L58
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, _intG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sgt   $t0, $t0, $t1		#Greater node.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for a bool.
	syscall

.data
.L59: .asciiz "\n"
.text
	la    $t0, .L59
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L60: .asciiz "Printing result of intL1 > intG: "
.text
	la    $t0, .L60
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, _intG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sgt   $t0, $t0, $t1		#Greater node.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for a bool.
	syscall

.data
.L61: .asciiz "\n"
.text
	la    $t0, .L61
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L62: .asciiz "Printing result of intG <= intL1 : "
.text
	la    $t0, .L62
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, _intG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sle   $t0, $t0, $t1		#Less equal node.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for a bool.
	syscall

.data
.L63: .asciiz "\n"
.text
	la    $t0, .L63
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L64: .asciiz "Printing result of intL1 <= intG: "
.text
	la    $t0, .L64
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, _intG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sle   $t0, $t0, $t1		#Less equal node.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for a bool.
	syscall

.data
.L65: .asciiz "\n"
.text
	la    $t0, .L65
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L66: .asciiz "Printing result of intL1 <= intL1 : "
.text
	la    $t0, .L66
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sle   $t0, $t0, $t1		#Less equal node.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for a bool.
	syscall

.data
.L67: .asciiz "\n"
.text
	la    $t0, .L67
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L68: .asciiz "Printing result of intG >= intL1: "
.text
	la    $t0, .L68
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, _intG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sge   $t0, $t0, $t1		#Greater equal node.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for a bool.
	syscall

.data
.L69: .asciiz "\n"
.text
	la    $t0, .L69
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L70: .asciiz "Printing result of intL1 >= intG : "
.text
	la    $t0, .L70
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, _intG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sge   $t0, $t0, $t1		#Greater equal node.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for a bool.
	syscall

.data
.L71: .asciiz "\n"
.text
	la    $t0, .L71
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L72: .asciiz "Printing result of intL1 >= intL1: "
.text
	la    $t0, .L72
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sge   $t0, $t0, $t1		#Greater equal node.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for a bool.
	syscall

.data
.L73: .asciiz "\n"
.text
	la    $t0, .L73
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L74: .asciiz "\n"
.text
	la    $t0, .L74
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L75: .asciiz "Testing Equality Operators:\n"
.text
	la    $t0, .L75
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L76: .asciiz "Printing intL1: "
.text
	la    $t0, .L76
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L77: .asciiz "\n"
.text
	la    $t0, .L77
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L78: .asciiz "Printing intG: "
.text
	la    $t0, .L78
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, _intG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L79: .asciiz "\n"
.text
	la    $t0, .L79
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L80: .asciiz "Printing result of intL1 == intG: "
.text
	la    $t0, .L80
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, _intG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	seq   $t0, $t0, $t1		#If equal return boolean.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for a bool.
	syscall

.data
.L81: .asciiz "\n"
.text
	la    $t0, .L81
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L82: .asciiz "Printing result of intL1 == intL1 : "
.text
	la    $t0, .L82
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	seq   $t0, $t0, $t1		#If equal return boolean.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for a bool.
	syscall

.data
.L83: .asciiz "\n"
.text
	la    $t0, .L83
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L84: .asciiz "Printing result of intL1 != intG: "
.text
	la    $t0, .L84
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, _intG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sne   $t0, $t0, $t1		#If not equal return boolean.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for a bool.
	syscall

.data
.L85: .asciiz "\n"
.text
	la    $t0, .L85
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L86: .asciiz "Printing result of intL1 != intL1 : "
.text
	la    $t0, .L86
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sne   $t0, $t0, $t1		#If not equal return boolean.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for a bool.
	syscall

.data
.L87: .asciiz "\n"
.text
	la    $t0, .L87
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L88: .asciiz "\n"
.text
	la    $t0, .L88
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L89: .asciiz "Testing Writing and Reading:\n"
.text
	la    $t0, .L89
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L90: .asciiz "Please enter an int and press enter: "
.text
	la    $t0, .L90
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	li    $v0, 5		#Print command
	syscall
	move  $t0, $v0
	sw    $t0, -16($fp)

.data
.L91: .asciiz "You entered: "
.text
	la    $t0, .L91
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -16($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L92: .asciiz "\n"
.text
	la    $t0, .L92
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L93: .asciiz "\n"
.text
	la    $t0, .L93
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L94: .asciiz "Testing If and If Else Statements:\n"
.text
	la    $t0, .L94
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L95: .asciiz "Printing intL1: "
.text
	la    $t0, .L95
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L96: .asciiz "\n"
.text
	la    $t0, .L96
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L97: .asciiz "Printing intG: "
.text
	la    $t0, .L97
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, _intG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L98: .asciiz "\n"
.text
	la    $t0, .L98
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, _intG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sgt   $t0, $t0, $t1		#Greater node.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .L99		#If conditional.
.data
.L100: .asciiz "Print if intL1 > intG.\n"
.text
	la    $t0, .L100
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.L99:

	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, _intG		#Load global variable.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	slt   $t0, $t0, $t1		#Less node.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .L101		#If conditional.
.data
.L102: .asciiz "Print if intL1 < intG.\n"
.text
	la    $t0, .L102
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.L101:

	li    $t0, 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .L103		#If conditional.
.data
.L105: .asciiz "If Else Statement 1 Success.\n"
.text
	la    $t0, .L105
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	j     .L104
.L103:
.data
.L106: .asciiz "If Else Statement 1 Fail.\n"
.text
	la    $t0, .L106
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.L104:

	li    $t0, 0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .L107		#If conditional.
.data
.L109: .asciiz "If Else Statement 2 Fail.\n"
.text
	la    $t0, .L109
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	j     .L108
.L107:
.data
.L110: .asciiz "If Else Statement 2 Success.\n"
.text
	la    $t0, .L110
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.L108:

.data
.L111: .asciiz "\n"
.text
	la    $t0, .L111
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L112: .asciiz "Testing While Statements:\n"
.text
	la    $t0, .L112
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	li    $t0, 0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t0, -20($fp)
.data
.L113: .asciiz "Using While Loop to count until 25.\n"
.text
	la    $t0, .L113
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.L114:
	lw    $t0, -20($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 25
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	slt   $t0, $t0, $t1		#Less node.
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .L115		#While conditional.
	lw    $t0, -20($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L116: .asciiz " "
.text
	la    $t0, .L116
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -20($fp)
	addi  $t0, $t0, 1		#Post Increment.
	sw    $t0, -20($fp)

	j     .L114
.L115:

.data
.L117: .asciiz "\n"
.text
	la    $t0, .L117
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L118: .asciiz "\n"
.text
	la    $t0, .L118
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L119: .asciiz "Testing Function Calls:\n"
.text
	la    $t0, .L119
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	jal   func1
	lw    $t0, -12($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	jal   func2
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t0, -24($fp)
.data
.L120: .asciiz "Printing the return value, which is the sum of the parameters: "
.text
	la    $t0, .L120
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

	lw    $t0, -24($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#Load in code for an int.
	syscall

.data
.L121: .asciiz "\n"
.text
	la    $t0, .L121
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L122: .asciiz "All tests are complete!\n"
.text
	la    $t0, .L122
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L123: .asciiz "               ,,ggddY888Ybbgg,,\n "
.text
	la    $t0, .L123
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L124: .asciiz "          ,agd8888   .d8888888888bga,\n "
.text
	la    $t0, .L124
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L125: .asciiz "       ,gdP568     .d88888888888888888g,\n"
.text
	la    $t0, .L125
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L126: .asciiz "     ,dP4        ,d888888888888888888888b,\n"
.text
	la    $t0, .L126
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L127: .asciiz "   ,dP4         ,8888888888888888888888888b,\n"
.text
	la    $t0, .L127
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L128: .asciiz "  ,84          ,8888888P'''88888888888888888,\n"
.text
	la    $t0, .L128
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L129: .asciiz " ,8'           I888888I    )88888888888888888,\n"
.text
	la    $t0, .L129
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L130: .asciiz ",8'            `8888888booo8888888888888888888,\n"
.text
	la    $t0, .L130
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L131: .asciiz "d'              `88888888888888888888888888888b\n"
.text
	la    $t0, .L131
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L132: .asciiz "8                ``8888888888888888888888888888\n"
.text
	la    $t0, .L132
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L133: .asciiz "8                  ``88888888888888888888888888\n"
.text
	la    $t0, .L133
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L134: .asciiz "8                      `18888888888888888888888\n"
.text
	la    $t0, .L134
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L135: .asciiz "Y,                        `8888888888888888888P\n"
.text
	la    $t0, .L135
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L136: .asciiz "`8,                         `88888888888888888'\n"
.text
	la    $t0, .L136
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L137: .asciiz " `8,              .oo.       `888888888888888'\n"
.text
	la    $t0, .L137
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L138: .asciiz "  `8a             8888        88888888888888'\n"
.text
	la    $t0, .L138
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L139: .asciiz "   `Yba           `oo'       ,888888888888P'\n"
.text
	la    $t0, .L139
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L140: .asciiz "     `Yba                   ,88888888888'\n"
.text
	la    $t0, .L140
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L141: .asciiz "       ``Yba,             ,8888888888P`'   \n"
.text
	la    $t0, .L141
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L142: .asciiz "          ``Y8baa,      ,d88888888P`'\n"
.text
	la    $t0, .L142
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

.data
.L143: .asciiz "               ````YYba8888P888`'\n"
.text
	la    $t0, .L143
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#Load in code for a string.
	syscall

_main_exit:
	lw    $ra, 0($fp)
	move  $t0, $fp		#Move Frame Pointer into temp register, control link.
	lw    $fp, -4($fp)
	move  $sp, $t0		#Move Stack Pointer back to origin.
	li    $v0, 10		#Program main exit.
	syscall
