global _start

section .txt

_start:
    mov ebx, 1      ; start ebx at 1
    mov ecx, 4      ; number of iterations
    
label:
    add ebx, ebx    ; ebx += ebx
    dec ecx         ; ecx -= 1
    cmp ecx, 0      ; compare ecx with 0
    jg label        ; jump to label if greater
    mov eax, 1      ; syscall for exit
    int 0x80
