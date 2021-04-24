global main
extern printf   ;we use an external symbol here

section .data   
    msg db "Testing %i...", 0x0a, 0x00  ; one format specifier that expects an integer. 0x0a is a newline character and 0x00 tells where the end of the string is
    ;0x00 is a null terminator

section .text
    main:
        push ebp
        mov ebp, esp 
        push 123
        push msg
        call printf
        mov eax, 0  ;return status for the program
        mov esp, ebp
        pop ebp
        ret

; in this porgram we use an external C function printf
; C defined the _start for you in this program and then expects a main function 
; we push 123 and msg into the stack and call printf on those argumetns
; we then mov 0 into eax for the return value of the function