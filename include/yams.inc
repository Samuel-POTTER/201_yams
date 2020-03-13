;;
;; EPITECH PROJECT, 2019
;; NMS
;; File description:
;; NMS
;;

%ifidn __OUTPUT_FORMAT__, macho64
%define pow _pow
%define dprintf _dprintf
%define puts _puts
%define strcmp _strcmp
%define exit _exit
%define strncmp _strncmp
%define strlen _strlen
default rel
%endif

    extern pow
    extern printf
    extern dprintf
    extern strcmp
    extern puts
    extern exit
    extern strncmp
    extern strlen
    extern do_pair
    extern do_three
    extern do_four
    extern do_yams
