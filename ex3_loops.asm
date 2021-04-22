global _start:

section .text:
_start:
    mov ecx, 101     ;set ecx to 101
    mov ebx, 42     ; exit status is 42
    mov eax,0x1     ; sys_exit system call
    cmp ecx, 100    ; compare ecx to 100
    jl skip         ; jump if less than
    mov ebx, 13     ; exit status is 13

skip:
    int 0x80


; Conditional Jumps

; je  A, B ; Jump if equal
; jne A, B ; Jump if Not equal
; jg  A, B ; Jump if greater
; jge A, B ; Jump if greater or equal to 
; jl  A, B ; Jump if less
; jle A, B ; Jump if less or equal
