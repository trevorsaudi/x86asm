;mov ebx, 123    ; ebx = 123
;mov eax, ebx    ; eax = ebx
;add ebx, ecx    ; ebx += ecx
;sub ebx, edx    ; ebx -= edx
;mul ebx         ; eax *= ebx
;div edx         ; eax /= edx 


global _start

section .data
    msg db "Hello, world!", 0x0a
    len equ $ - msg ; determining the length of the string by substracting the start of the string and the last of the stirng
    