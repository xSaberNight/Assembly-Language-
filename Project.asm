		
			        .data
array: 			    .word   202, 303, 101, 808
initial_output: 	.asciiz "Initial Contents (1st to 4th): "
final_output: 		.asciiz "\nFinal Contents (4th to 1st): "
space: 			    .asciiz " "

			        .text
			        .globl main
main:
					                        # Display initial output label
			        li $v0, 4		        # Load syscall for print string
			        la $a0, initial_output	# Load address of initial output string
			        syscall			        # Pring the string
			
					                        # Load and display initial contents
			        la $t0, array		    # Load base address of array into $t0
			        lw $t1, 0($t0)		    # Load 1st element (202) into $t1
			        lw $t2, 4($t0)		    # Load 2nd element (303) into $t2
			        lw $t3, 8($t0)		    # Load 3rd element (101) into $t3
			        lw $t4, 12($t0)		    # Load 4th element (808) into $t4
			
			        li $v0, 1		        # Load syscall for print integer
			        move $a0, $t1		    # Move 1st element to $a0
			        syscall			        # Print 1st element
			
			        li $v0, 4		        # Load syscall for print string
			        la $a0, space		    # Load address of space
			        syscall			        # Print space
			
			        li $v0, 1		        # Print 2nd element
			        move $a0, $t2
			        syscall
			
			        li $v0, 4		        # Print space
			        la $a0, space
			        syscall
			
			        li $v0, 1		        # Print 3rd element
			        move $a0, $t3
			        syscall
			
			        li $v0, 4		        # Print space
			        la $a0, space
			        syscall
			
			        li $v0, 1		        # Print 4th element
			        move $a0, $t4
			        syscall
			
					                        # Swap the 1st and 4th elements
			        lw $t5, 0($t0)		    # Load 1st element (202) into $t5
			        lw $t6, 12($t0)		    # Load 4th element (808) into $t6
			        sw $t6, 0($t0)		    # Store 4th element (808) in 1st position
			        sw $t5, 12($t0)		    # Store 1st element (202) in 4th position
			
					                        # Swap the 2nd and 3rd elements
			        lw $t7, 4($t0)		    # Load 2nd element (303) into $t7
			        lw $t8, 8($t0)		    # Load 3rd element (101) into $t8
			        sw $t8, 4($t0)		    # Store 3rd element (101) in 2nd position
			        sw $t7, 8($t0)		    # Store 2nd element (303) in 3rd position
			
					                        # Display final output label
			        li $v0, 4		        # Load syscall for print string
			        la $a0, final_output	# Load address of final output string
			        syscall			        # Print the string
				
					                        # Load and display final contents
			        la $t0, array		    # Load base address of array into $t0
			        lw $t1, 12($t0)		    # Load 4th element (202) into $t1
			        lw $t2, 8($t0)		    # Load 3rd element (303) into $t2
			        lw $t3, 4($t0)		    # Load 2nd element (101) into $t3
			        lw $t4, 0($t0)		    # Load 1st element (808) into $t4
			
					                        # Print values in reverse order
			        li $v0, 1		        # Load syscall for print integer
			        move $a0, $t1		    # Move 4th element to $a0
			        syscall			        # Print 4th element
			
			        li $v0, 4		        # Print space
			        la $a0, space
			        syscall
			
			        li $v0, 1		        # Print 3rd element
			        move $a0, $t2
			        syscall
			
			        li $v0, 4		        # Print space
			        la $a0, space
			        syscall
			
			        li $v0, 1		        # Print 2nd element
			        move $a0, $t3
			        syscall
			
			        li $v0, 4		        # Print space
			        la $a0, space
			        syscall
			
			        li $v0, 1		        # Print 1st element
			        move $a0, $t4
			        syscall
			
					# Exit program
			        li $v0, 10
			        syscall
