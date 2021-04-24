global _start:


_start:
    push 21
    call times2     ; pushes the return address of the function to the stack and jumps to the function
    mov ebx, eax
    mov eax, 1
    int 0x80

times2:
    push ebp
    mov ebp, esp
    mov eax, [esp+8]
    add eax, eax
    mov esp, ebp
    pop ebp
    ret


; ESP = 28 24 20 24
; EBP = 123 20 123; some random value so we keep track of it
; EAX = 0

; ``

; push moves the stack pointer and writes the value to the new address
; this will be the argument that we are passing. arguments in x86 get passed in the stack
; call times 2 pushes the return address to the stack and jumps to function
; we preserve the old base pointer with push ebp
; line 13 moves 20 into ebp, preservers the current top of the stack
; line 14 moves the value stored at the address of ebp+8, this gives us access to the value that was passed to the function
; ebp+8 at this point os 20+8 so address 28
; if we had more arguments at this point, they would all follow ebp+8, this would be in steps of 4
; we then add eax to itself
