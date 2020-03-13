;;
;; EPITECH PROJECT, 2019
;; NMS
;; File description:
;; NMS
;;

%include "yams.inc"

    global _launch_yams

    section .text
; main math routine
_launch_yams:
    push rbp
    mov rbp, rsp
    cmp byte [__comb], 1
    je _launch_pair
    cmp byte [__comb], 2
    je _launch_three
    cmp byte [__comb], 3
    je _launch_four
    cmp byte [__comb], 4
    je _launch_full
    cmp byte [__comb], 5
    je _launch__yams
    cmp byte [__comb], 6
    je _launch_straight
    jmp _end_launch
_launch_pair:
    call _compute_pair
    jmp _end_launch
_launch_three:
    call _compute_three
    jmp _end_launch
_launch_four:
    call _compute_four
    jmp _end_launch
_launch_full:
    call _compute_full
    jmp _end_launch
_launch__yams:
    call _compute_yams
    jmp _end_launch
_launch_straight:
    call _compute_straight
_end_launch:
    leave
    ret

; compute pair routine
_compute_pair:
    push rbp
    mov rbp, rsp
    mov rdi, rsi
    xor rsi, rsi
    mov byte sil, [__comb_val]
    add sil, 48
    call do_pair
    leave
    ret

; compute three routine
_compute_three:
    push rbp
    mov rbp, rsp
    mov rdi, rsi
    xor rsi, rsi
    mov byte sil, [__comb_val]
    add sil, 48
    call do_three
    leave
    ret

; compute four routine
_compute_four:
    push rbp
    mov rbp, rsp
    mov rdi, rsi
    xor rsi, rsi
    mov byte sil, [__comb_val]
    add sil, 48
    call do_four
    leave
    ret

<<<<<<< HEAD
_getOcc:
    mov rax, 1
    xor r8, r8
_getOcc_beg:
    cmp rax, 6
    je _getOcc_end
    mov rdx, [rdi + rax * 8]
    mov cl, [rdx]
    cmp rdx, rsi
    jne _getOcc_noteq
    inc r8
_getOcc_noteq:
    inc rax
    jmp _getOcc_beg
_getOcc_end:
    ret

_comb:
    push rbp
    mov rsp, rbp
    sub rsp, 48
    mov qword [rbp - 8], rdi
    mov qword [rbp - 16], rsi
    call _facto
    mov qword [rbp - 32], rax
    mov rdi, rsi
    call _facto
    mov qword [rbp - 24], rax
    mov rdi, qword [rbp - 16]
    mov rax, qword [rbp - 8]
    sub rdi, rax
    call _facto
    mov rcx, [rbp - 32]
    mul rcx
    mov rcx, rax
    mov rax, qword [rbp - 24]
    xor rdx, rdx
    div rcx
    leave
    ret

; dice arg checking routine
_check_args:
=======
; compute full routine
_compute_full:
>>>>>>> 3ac1bf5259c402c80a189c02345ee0e98879871c
    push rbp
    mov rbp, rsp
    mov rdi, 1
    mov rsi, __compute_full_msg
    xor rdx, rdx
    mov dl, [__comb_val]
    xor rcx, rcx
    mov cl, [__full_snd]
    xor rax, rax
    call dprintf
    leave
    ret

; compute yams routine
_compute_yams:
    push rbp
    mov rbp, rsp
    mov rdi, rsi
    xor rsi, rsi
    mov byte sil, [__comb_val]
    add sil, 48
    call do_yams
    leave
    ret

; compute straight routine
_compute_straight:
    push rbp
    mov rbp, rsp
    mov rdi, 1
    mov rsi, __compute_straight_msg
    xor rdx, rdx
    mov dl, [__comb_val]
    xor rax, rax
    call dprintf
    leave
    ret

    section .data
    extern __comb
    extern __comb_val
    extern __full_snd

    section .rodata
__compute_pair_msg:
    db "Pair of %d", 10, 0
__compute_three_msg:
    db "Three of %d", 10, 0
__compute_four_msg:
    db "Four of %d", 10, 0
__compute_full_msg:
    db "Full of %d and %d", 10, 0
__compute_yams_msg:
    db "Yams of %d", 10, 0
__compute_straight_msg:
    db "Straight of %d", 10, 0