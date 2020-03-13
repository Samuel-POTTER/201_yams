;;
;; EPITECH PROJECT, 2019
;; NMS
;; File description:
;; NMS
;;

%include "yams.inc"
%include "args.inc"

    global _main
    global main

    global __comb
    global __comb_val
    global __full_snd

    extern _launch_yams
    extern _raise_error

    section .text

main:
_main:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    mov [rbp - 8], rsi
    mov [rbp - 16], rdi
    cmp rdi, 2
    jne _no_usage
    mov rdi, [rsi + 8]
    mov rsi, __usage_arg
    call strcmp
    cmp rax, 0
    jne _no_usage
    call _print_usage
    jmp _main_end
_no_usage:
    cmp rdi, 7
    je _no_arg_number_error
    mov rdi, __arg_number_error_msg
    call _raise_error
_no_arg_number_error:
    call _check_args
    mov rsi, [rbp - 8]
    mov rdi, [rbp - 16]
    call _launch_yams
_main_end:
    xor rax, rax
    leave
    ret
    
; usage printing routine
_print_usage:
    push rbp
    mov rbp, rsp
    mov rdi, __usage_msg
    call puts
    leave
    ret

    section .data
__var:
    dq 6
__comb:
    db 0
__comb_val:
    db 0
__full_snd:
    db 0

    section .rodata
__usage_arg:
    db "-h", 0
__arg_number_error_msg:
    db `\x1B[1m\x1B[91mError:\x1B[0m not enough arguments`, 10, 0
__print_d_fmt:
    db "%d", 10, 0
__usage_msg:
    db "USAGE", 10
    db 9, "./201yams d1 d2 d3 d4 d5 c", 10, 10
    db "DESCRIPTION", 10
    db 9, "d1", 9, "value of the first die (0 if not thrown)", 10
    db 9, "d2", 9, "value of the second die (0 if not thrown)", 10
    db 9, "d3", 9, "value of the third die (0 if not thrown)", 10
    db 9, "d4", 9, "value of the fourth die (0 if not thrown)", 10
    db 9, "d5", 9, "value of the fifth die (0 if not thrown)", 10
    db 9, "c", 9, "expected combination", 0
