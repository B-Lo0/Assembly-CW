        @ This program for the robert_burns string should output:
        @
        @ ./freq-hard-coded
        @ 0000000032  
        @ 0000000003 '
        @ 0000000006 ,
        @ 0000000002 -
        @ 0000000001 .
        @ 0000000001 ;
        @ 0000000001 C
        @ ...

        .global _start

_start:
        LDR R1, =robert_burns
        @ LDR R1, =test_string   @ if you just want to test with "coooow"

        @ start your algorithm here
countlist  RESB 26
XOR EBX,EBX
XOR EAX,EAX
XOR EDX,EDX
l1:
MOV AL,[ESI+EBX]
SUB EAX,65    ;so that A=0, B=1 etc
MOV DL,[countlist+EAX]
INC DL
MOV [countlist+EAX],DL
INC EBX
LOOP l1

        
        @ exit the program
_exit:	MOV R7, #1
	MOV R0, #0
	SWI 0

.data
.equ O_RDONLY, 0x0000
@ memory location to communicate file char with 'read' function call
char:	.word 0x00

@ characters to print with 'write' to format the output
nls: 	.word '\n'
sps:	.word ' '

@ power of 10s array, values computed during runtime
tens:	.rept 10
	.word 0x00
	.endr

@ frequency table in memory
freq:	.rept 128
	.word 0x00 @ initialise character counts as 0
	.endr

.data
.equ MASK, 0x000000ff
.equ EOS, 0
@ the next position in the frequency table
next:	.word 0x00  @ memory address to obtain next value from frequency table
count:  .word 0x00  @ counts from 0..127 when printing frequency table
test_string:   .asciz "coooow"
robert_burns: .asciz "My heart's in the Highlands, my heart is not here, My heart's in the Highlands, a-chasing the deer; Chasing the wild-deer, and following the roe, My heart's in the Highlands, wherever I go."
