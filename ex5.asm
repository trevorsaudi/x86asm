global _start

section .data
    addr db "yellow"

section .text
_start:
    mov [addr], byte 'H' ; here we try modifying the contents of addr at runtime
    mov [addr+5], byte '!' ; this means at the position of w replace with !
    mov eax, 4      ; sys_write system call
    mov ebx, 1      ; stdout file desciptor
    mov ecx, addr   ; bytes to write
    mov edx, 6      ; number of bytes to write
    int 0x80    
    mov eax, 1      ; sys_exit system call
    mov ebx, 0      ; exit status is 0
    int 0x80


; data types in assembly

; section .data
;     ; db is 1 bytes
;     name1 db "string"
;     name2 db 0xff
;     name3 db 100
 
;     ; dw is 2 bytes
;     name4 dw 0x1234
;     name5 dw 1000
    
;     ; dd is 4 bytes
;     name6 dd 0x12345678
;     name7 dd 100000



; The stack
; Decreases by 4 everytime we push onto the stack since we are dealing with 4 byte integers

; ESP = 28 - 4 - 4 - 4 - 4

; [00]    0
; [04]    0
; [08]    0
; [12]    357
; [16]    246
; [20]    8765
; [24]    1234; if we were to push 1234 to the stack it gets stored here
; [28]    0

; NASM code for the stack above

; push 1234
; push 8765
; push 246
; push 357 can be written as follows :
;     sub esp, 4 ; decreasing the stack by 4 bytes
;     mov [esp], dword 357 ; move 357 into the stack, dword means we are moving 4 bytes


; In this scenario we pop the value at the top of the stack into the eax register
; eax contains 357 and now the esp increments by 4 and points to 246
; If we push a value to the stack, 357 (which temporarily exists)  gets overwritten

; push 1234
; push 8765
; push 246
; push 357 
; pop eax 


; The code above is similar to this

; push 1234
; push 8765
; push 246
; push 357
; mov eax, dword [esp]
; add esp, 4