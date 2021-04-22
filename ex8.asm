global _start


_start:
    call func
    mov eax, 1
    mov ebx, 0
    int 0x80

func :
    push ebp
    mov ebp, esp
    sub esp, 2
    mov [esp], byte 'H'
    mov [es+1], byte 'i'
    mov eax, 4      ; sys write system call
    mov ebx, 1      ; stdout file descriptor
    mov ecx, esp    ; bytes to write
    mov edx, 2      ; number of bytes to write
    int 0x80        ; perform a system call
    mov esp, ebp
    pop ebp
    ret


; we can preserve the location of hte stack using the base pointer
; we save the top of the stack into the ebp and then restore it when returning
; the first and last 3 lines of the program are called the prologue and the epilogue