global _start ; this is the entry point of our program, global key word makes an identifier accessible to the linker
_start: ; creates a label, names location in our code
    mov eax, 1 ; move 1 into eax
    mov ebx, 42 
    sub ebx, 29
    int 0x80 ; this line performs an interrupt. This means the processor transfers control to an interrupt handler that we specify eg 0x80
             ; 0x80 is the interrupt handler for system calls. This is determined by the value in the eax register. The value in eax - 1 - specifies the exit syscall
             ; The value in ebx specifies the exit status of our syscall which could be any integer
             ; if we do echo $? we get 13 which is the exit status of our program - successful.