global _start


_start:
    call func ; pushes the return address to the stack
    mov eax, 1
    mov ebx, 0
    int 0x80

func :
    push ebp        ; push the old ebp value onto the stack to avoid overwriting
    mov ebp, esp    ; preserve the top of the stack so we can restore it when we reach the return op
    sub esp, 2      ; create space on the stack
    mov [esp], byte 'H'
    mov [es+1], byte 'i'
    mov eax, 4      ; sys write system call
    mov ebx, 1      ; stdout file descriptor
    mov ecx, esp    ; bytes to write
    mov edx, 2      ; number of bytes to write
    int 0x80        ; perform a system call
    mov esp, ebp    ; restore esp
    pop ebp         
    ret


; we can preserve the location of hte stack using the base pointer
; we save the top of the stack into the ebp and then restore it when returning
; the first and last 3 lines of the program are called the prologue and the epilogue
; call pushes the EIP onto the stack
; ret pops the location from the stack and jumps to it
; pushing and popping the ebp from the stack allows us to have nested function calls to avoid overwriting ebp
