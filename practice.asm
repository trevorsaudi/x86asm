; global _start


; section .data:
;     message: db "Hello World"
;     message_length equ $ - message

; section .text:
; _start:
;     mov eax, 4 
;     mov ebx, 1
;     mov ecx, message
;     mov edx, message_length
;     int 0x80
;     mov eax, 1
;     mov ebx, 0
;     int 0x80



    




; global _start

; _start:
;     mov ebx, 1
;     mov ecx, 5

; label:
;     add ebx, ebx 
;     dec ecx
;     cmp ecx, 0
;     jg label
;     mov eax, 1
;     int 0x80



global _start

section .text:
    _start:
        mov eax, 3
        mov ebx, 2
        mov ecx, 5
        int 0x80
        call display
        mov eax, 1
        mov ebx 0
        int 0x80
    
    display:
        mov eax, 4
        mov ebx, 1
        mov ecx, db ""


section .data