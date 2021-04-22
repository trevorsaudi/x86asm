; hello_world.asm
;
; Author: Trevor Saudi
; Date: 16-04-2021


; start by defining the sections necessary for the program to run
global _start 

section .text:

_start:
    mov eax, 0x4            ; use the write syscall
    mov ebx, 1              ; use stdout as the fd
    mov ecx, message        ; use the message as the buffer
    mov edx, message_length ; supply the length 
    int 0x80                ; invoke the syscall, interrupt,  0x80 - identifier for running a syscall

    ; now gracefully exit

    mov eax, 0x1            ; use sysexit syscalll
    mov ebx, 0              ; return 0 like in C programs
    int 0x80

section .data:
    message: db "Hello World!", 0xA
    message_length equ $-message    ; the length of the message variable



