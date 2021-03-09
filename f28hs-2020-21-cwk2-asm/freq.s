        @ This program should output:
        @
        @ ./freq RobertBurns.txt
        @ 0000000001 
        @ 0000000032  
        @ 0000000003 '
        @ 0000000006 ,
        @ 0000000002 -
        @ 0000000001 .
        @ 0000000001 ;
        @ 0000000001 C
        @ ...

        .global _start

_start: @ start your algorithm here
        

        @ exit the program
_exit:	MOV R7, #1
	MOV R0, #0
	SWI 0
        
.data
.equ O_RDONLY, 0x0000
@ memory location to communicate file char with 'read' and 'write' function calls
char:	.word 0x00

@ memory location to communicate file name to 'open' and 'close' function calls
fin:	.word 0x00

@ characters to print with 'write' to format the output
nls: 	.word '\n'
sps:	.word ' '

@ power of 10s array, values computed during runtime
tens:	.rept 10
	.word 0x00
	.endr

@ frequency table in memory
freq:	.rept 256
	.word 0x00 @ initialise character counts as 0
	.endr

@ the next position in the frequency table
next:	.word 0x00  @ memory address to obtain next value from frequency table
count:  .word 0x00  @ counts from 0..127 when printing frequency table
        
