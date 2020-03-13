;;
;; EPITECH PROJECT, 2019
;; NMS
;; File description:
;; NMS
;;

%include "yams.inc"

    global _check_args
    global _raise_error

    section .text

; dice arg checking routine
_check_args:
    push rbp
    mov rbp, rsp
    mov rax, 1
_begin_check_arg:
    cmp rax, 6
    je _end_check_arg
    mov rcx, [rsi + rax * 8]
    xor rdx, rdx
    mov dl, [rcx]
    sub rdx, 48
    jne _check_args_current_nz
    xor r8, r8
    mov byte r8b, [__nb_zero_arg]
    inc r8
    mov byte [__nb_zero_arg], r8b
    jmp _check_args_no_invalid_value
_check_args_current_nz:
    cmp rdx, 1
    jl _check_args_die_error
    cmp rdx, 6
    jg _check_args_die_error
    jmp _check_args_no_invalid_value
_check_args_die_error:
    mov rdi, __die_error_msg
    call _raise_error
_check_args_no_invalid_value:
    inc rax
    jmp _begin_check_arg
_end_check_arg:
    cmp byte [__nb_zero_arg], 0
    je _check_args_no_zerror
    cmp byte [__nb_zero_arg], 5
    je _check_args_no_zerror
    mov rdi, __arg_zero_error_msg
    call _raise_error
_check_args_no_zerror:
    leave
    call _check_comb
    ret

; combination checking routine
_check_comb:
    push rbp
    mov rbp, rsp
    sub rsp, 64
    mov qword [rbp - 8], __zpair
    mov qword [rbp - 16], __zthree
    mov qword [rbp - 24], __zfour
    mov qword [rbp - 32], __zfull
    mov qword [rbp - 40], __zyams
    mov qword [rbp - 48], __zstraight
    mov qword [rbp - 56], rsi
    mov rax, -1
_check_comb_loop:
    mov [rbp - 64], rax
    cmp rax, -7
    je _check_comb_end
    mov rdi, [rbp + rax * 8]
    call strlen
    mov rdi, [rbp - 56]
    mov rdi, [rdi + 48]
    mov rdx, rax
    mov rax, [rbp - 64]
    mov rsi, [rbp + rax * 8]
    call strncmp
    cmp rax, 0
    jne _wrong_nb
    xor rax, rax
    mov rbx, [rbp - 64]
    sub rax, rbx
    mov byte [__comb], al
_wrong_nb:
    mov rax, [rbp - 64]
    dec rax
    jmp _check_comb_loop
_check_comb_end:
    mov rax, [__comb]
    cmp rax, 0
    jne _check_comb_not_invalid
    mov rdi, __comb_error_msg
    call _raise_error
_check_comb_not_invalid:
    mov rdi, [rbp - 56]
    mov rdi, [rdi + 48]
    call _check_comb_args
    leave
    ret

; combination argument checking routine
_check_comb_args:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov [rbp - 8], rdi
    call strlen
    mov [rbp - 16], rax
    mov rax, 4
    mov bl, [__comb]
    cmp bl, 2
    jne _check_comb_args_no_three
    inc rax
_check_comb_args_no_three:
    cmp bl, 6
    jne _check_comb_args_no_straight
    mov rax, 8
_check_comb_args_no_straight:
    add rax, 2
    mov rcx, [rbp - 16]
    cmp rax, rcx
    jle _check_comb_args_no_len_err
    mov rdi, __comb_error_msg
    call _raise_error
_check_comb_args_no_len_err:
    sub rax, 2
    mov byte cl, [rdi + rax]
    cmp cl, 95
    je _check_comb_args_no_userr
    mov rdi, __comb_error_msg
    call _raise_error
_check_comb_args_no_userr:
    inc rax
    mov byte cl, [rdi + rax]
    sub cl, 49
    jl _check_comb_args_val_err
    cmp cl, 5
    jg _check_comb_args_val_err
    jmp _check_comb_args_no_val_err
_check_comb_args_val_err:
    mov rdi, __comb_error_msg
    call _raise_error
_check_comb_args_no_val_err:
    inc cl
    mov [__comb_val], cl
    cmp bl, 4
    jne _check_comb_args_no_full
    mov rax, [rbp - 16]
    cmp rax, 8
    je _check_comb_args_full_no_len_err
    mov rdi, __comb_error_msg
    call _raise_error
_check_comb_args_full_no_len_err:
    cmp byte [rdi + 6], 95
    je _check_comb_args_full_no_userr
    mov rdi, __comb_error_msg
    call _raise_error
_check_comb_args_full_no_userr:
    mov cl, [rdi + 7]
    sub cl, 49
    jl _check_comb_args_full_arg_err
    cmp cl, 5
    jg _check_comb_args_full_arg_err
    jmp _check_comb_args_full_no_arg_err
_check_comb_args_full_arg_err:
    mov rdi, __comb_error_msg
    call _raise_error
_check_comb_args_full_no_arg_err:
    inc cl
    mov dl, [__comb_val]
    cmp cl, dl
    jne _check_comb_args_full_no_eq
    mov rdi, __comb_error_msg
    call _raise_error
_check_comb_args_full_no_eq:
    mov [__full_snd], cl
_check_comb_args_no_full:
    cmp bl, 6
    jne _check_comb_args_no_straight_check
    mov cl, [__comb_val]
    cmp cl, 5
    jl _check_comb_args_straight_err
    cmp cl, 6
    jg _check_comb_args_straight_err
    jmp _check_comb_args_no_straight_check
_check_comb_args_straight_err:
    mov rdi, __comb_error_msg
    call _raise_error
_check_comb_args_no_straight_check:
    mov rax, [rbp - 16]
    cmp bl, 1
    je _check_comb_args_overflow_four_check
    cmp bl, 2
    je _check_comb_args_overflow_five_check
    cmp bl, 3
    je _check_comb_args_overflow_four_check
    cmp bl, 5
    je _check_comb_args_overflow_four_check
    cmp bl, 6
    je _check_comb_args_overflow_eight_check
    jmp _check_comb_args_overflow_check_end
_check_comb_args_overflow_four_check:
    cmp rax, 6
    je _check_comb_args_overflow_check_end
    mov rdi, __comb_error_msg
    call _raise_error
_check_comb_args_overflow_five_check:
    cmp rax, 7
    je _check_comb_args_overflow_check_end
    mov rdi, __comb_error_msg
    call _raise_error
_check_comb_args_overflow_eight_check:
    cmp rax, 10
    je _check_comb_args_overflow_check_end
    mov rdi, __comb_error_msg
    call _raise_error
_check_comb_args_overflow_check_end:
    leave
    ret

; routine for printing error message and exiting
_raise_error:
    push rbp
    mov rbp, rsp
    mov rsi, rdi
    mov rdi, 2
    xor rax, rax
    call dprintf
    mov rdi, 84
    call exit
    leave
    ret

    section .data
__nb_zero_arg:
    db 0
    extern __comb
    extern __comb_val
    extern __full_snd

    section .rodata
__zpair:
    db "pair", 0
__zthree:
    db "three", 0
__zfour:
    db "four", 0
__zfull:
    db "full", 0
__zyams:
    db "yams", 0
__zstraight:
    db "straight", 0

__arg_zero_error_msg:
    db `\x1B[1m\x1B[91mError:\x1B[0m You must have only 0's or none of them`, 10, 0

__die_error_msg:
    db `\x1B[1m\x1B[91mError:\x1B[0m Die value can only be between 0 and 6`, 10, 0

__comb_error_msg:
    db `\x1B[1m\x1B[91mError:\x1B[0m wrong combination`, 10, 0