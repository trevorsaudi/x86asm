global _start:


section .text:
    _start:
    ; User prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, user_msg
    mov edx, user_msg_len
    int 0x80
    call input

    input:
    ; Read and store input
    mov eax, 3
    mov ebx, 2
    mov ecx, num
    mov edx, 5
    int 0x80
    ret

    ; display the output message
    mov eax, 4
    mov ebx, 1
    mov ecx, disp_msg
    mov edx, disp_msg_len
    int 0x80

    ; display the message
    mov eax, 4
    mov ebx, 1
    mov ecx, num
    mov edx, 5
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80




section .data:
    user_msg: db "Please enter a message: "
    user_msg_len: equ $-user_msg
    disp_msg: db "You have entered: "
    disp_msg_len: equ $-user_msg

section .bss           ;Uninitialized data
   num resb 5
	

