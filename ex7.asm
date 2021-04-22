global _start
_start:

    call func
    mov eax, 1
    int 0x80

func:
    mov ebx, 42
    ret ; pops the location off of the stack then returns to it as follows 
    ; pop eax
    ;jmp eax 