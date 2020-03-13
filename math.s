<<<<<<< HEAD
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15
	.globl	_factorial              ## -- Begin function factorial
	.p2align	4, 0x90
_factorial:                             ## @factorial
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -8(%rbp)
	cmpl	$1, -8(%rbp)
	jg	LBB0_2
## %bb.1:
	movl	$1, -4(%rbp)
	jmp	LBB0_3
LBB0_2:
	movl	-8(%rbp), %eax
	movl	-8(%rbp), %ecx
	subl	$1, %ecx
	movl	%ecx, %edi
	movl	%eax, -12(%rbp)         ## 4-byte Spill
	callq	_factorial
	movl	-12(%rbp), %ecx         ## 4-byte Reload
	imull	%eax, %ecx
	movl	%ecx, -4(%rbp)
LBB0_3:
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_comb                   ## -- Begin function comb
	.p2align	4, 0x90
_comb:                                  ## @comb
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-8(%rbp), %edi
	callq	_factorial
	cvtsi2sdl	%eax, %xmm0
	movl	-8(%rbp), %eax
	subl	-4(%rbp), %eax
	movl	%eax, %edi
	movsd	%xmm0, -16(%rbp)        ## 8-byte Spill
	callq	_factorial
	movl	-4(%rbp), %edi
	movl	%eax, -20(%rbp)         ## 4-byte Spill
	callq	_factorial
	movl	-20(%rbp), %esi         ## 4-byte Reload
	imull	%eax, %esi
	cvtsi2sdl	%esi, %xmm0
	movsd	-16(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	divsd	%xmm0, %xmm1
	cvttsd2si	%xmm1, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function binomial
LCPI2_0:
	.quad	4605681218924227243     ## double 0.83333333333333337
LCPI2_1:
	.quad	4595172819793696085     ## double 0.16666666666666666
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_binomial
	.p2align	4, 0x90
_binomial:                              ## @binomial
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -16(%rbp)
	movl	-8(%rbp), %esi
	subl	-4(%rbp), %esi
	movl	%esi, -20(%rbp)
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	movl	$5, %ecx
	subl	-4(%rbp), %ecx
	addl	$1, %ecx
	cmpl	%ecx, %eax
	je	LBB2_4
## %bb.2:                               ##   in Loop: Header=BB2_1 Depth=1
	movl	-20(%rbp), %edi
	movl	$5, %eax
	subl	-4(%rbp), %eax
	movl	%eax, %esi
	callq	_comb
	cvtsi2sdl	%eax, %xmm0
	movl	-20(%rbp), %eax
	cvtsi2sdl	%eax, %xmm1
	movsd	LCPI2_1(%rip), %xmm2    ## xmm2 = mem[0],zero
	movsd	%xmm0, -32(%rbp)        ## 8-byte Spill
	movaps	%xmm2, %xmm0
	callq	_pow
	movsd	-32(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	mulsd	%xmm0, %xmm1
	movl	$5, %eax
	subl	-4(%rbp), %eax
	subl	-20(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	movsd	LCPI2_0(%rip), %xmm2    ## xmm2 = mem[0],zero
	movsd	%xmm0, -40(%rbp)        ## 8-byte Spill
	movaps	%xmm2, %xmm0
	movsd	-40(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	movsd	%xmm1, -48(%rbp)        ## 8-byte Spill
	movaps	%xmm2, %xmm1
	callq	_pow
	movsd	-48(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	mulsd	%xmm0, %xmm1
	addsd	-16(%rbp), %xmm1
	movsd	%xmm1, -16(%rbp)
## %bb.3:                               ##   in Loop: Header=BB2_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB2_1
LBB2_4:
	movsd	-16(%rbp), %xmm0        ## xmm0 = mem[0],zero
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_getOcc                 ## -- Begin function getOcc
	.p2align	4, 0x90
_getOcc:                                ## @getOcc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movb	%sil, %al
	movq	%rdi, -8(%rbp)
	movb	%al, -9(%rbp)
	movl	$0, -16(%rbp)
	movl	$1, -20(%rbp)
LBB3_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$6, -20(%rbp)
	jge	LBB3_6
## %bb.2:                               ##   in Loop: Header=BB3_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movsbl	(%rax), %edx
	movsbl	-9(%rbp), %esi
	cmpl	%esi, %edx
	jne	LBB3_4
## %bb.3:                               ##   in Loop: Header=BB3_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
LBB3_4:                                 ##   in Loop: Header=BB3_1 Depth=1
	jmp	LBB3_5
LBB3_5:                                 ##   in Loop: Header=BB3_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB3_1
LBB3_6:
	movl	-16(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function do_pair
LCPI4_0:
	.quad	4636737291354636288     ## double 100
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_do_pair
	.p2align	4, 0x90
_do_pair:                               ## @do_pair
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movb	%sil, %al
	movq	%rdi, -8(%rbp)
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rdi
	movl	$50, %esi
	callq	_getOcc
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %edi
	movl	$2, %esi
	callq	_binomial
	movsd	LCPI4_0(%rip), %xmm1    ## xmm1 = mem[0],zero
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	movl	-16(%rbp), %esi
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
	cmpl	$2, -16(%rbp)
	movl	%eax, -28(%rbp)         ## 4-byte Spill
	jl	LBB4_2
## %bb.1:
	movsbl	-9(%rbp), %esi
	leaq	L_.str.1(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -32(%rbp)         ## 4-byte Spill
	jmp	LBB4_3
LBB4_2:
	movsd	-24(%rbp), %xmm0        ## xmm0 = mem[0],zero
	leaq	L_.str.2(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movl	%eax, -36(%rbp)         ## 4-byte Spill
LBB4_3:
	movsd	-24(%rbp), %xmm0        ## xmm0 = mem[0],zero
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movl	$50, %esi
	callq	_do_pair
	xorl	%eax, %eax
	movsd	%xmm0, -24(%rbp)
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Debug: a = %d\n"

L_.str.1:                               ## @.str.1
	.asciz	"Chances to get pair of %c: 100.00%%"

L_.str.2:                               ## @.str.2
	.asciz	"%.2lf%%\n"


.subsections_via_symbols
=======
;;
;; EPITECH PROJECT, 2019
;; NMS
;; File description:
;; NMS
;;

    global _fac

    section .text
; factorial computation routine
_fac:
    push rdi
    cmp rdi, 1
    jg _fac_gt_1
    pop rdi
    mov rax, 1
    ret
_fac_gt_1:
    dec rdi
    call _fac
    pop rdi
    mul rdi
    ret
>>>>>>> 3ac1bf5259c402c80a189c02345ee0e98879871c
