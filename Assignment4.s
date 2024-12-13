.section .data
array: .byte 1, 2, 3, 4, 5, 0    @ Input array

.section .text
.globat _start

_start:
  LDR r0, =array                  @ Load address of the byte array
  LDR r1, =array                  @ Save starting point of the array for writing
  LDR r2, =reversed               @ Load address of the reversed array
  LDR r3, sp                      @ Save starting point of sp register

push_loop:
  @ push all bytes of the array onto the stack
  ldrb r4, [r0], #1               @ Load the next byte into r4 and increment r0
  cmp r4, #0                      @ Check if byte is the terminator (0)
                                  @ If 0, start popping bytes
                                  @ Push the byte onto the stack
                                  @ Repeat for the next byte

pop_elements:
  @ Pop all bytes from the stack into the reversed array
  cmp sp, r3                      @ Check if the stack pointer has reached the bottom
                                  @ If so, finish
                                  @ Pop the top byte from the stack into r4
                                  @ Store the byte in the array, increment r1
                                  @ Repeat for the next byte

done:
  @ Print to the console
  @ Exit the program
