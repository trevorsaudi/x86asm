global _start


section .text
_start:
    mov ebx, 42 ; exit status is 42
    mov eax, 0x1  ; sys_exit system call
    jmp skip    ; skip is a label we will define
    mov ebx, 13 ; exit status is 13

skip:           ; creating a label
    int 0x80    ; interrupt to exit the program
