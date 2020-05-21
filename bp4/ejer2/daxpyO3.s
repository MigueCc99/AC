	.file	"daxpy.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Faltan n\302\272 componentes del vector y la constante"
	.align 8
.LC6:
	.string	"Tama\303\261o= %d\t Tiempo= %11.9f\t y[0]= %f\t y[%d]= %f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jle	.L23
	movq	8(%rsi), %rdi
	movq	%rsi, %rbx
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rax, %r13
	call	strtol@PLT
	movl	%r13d, %ebp
	salq	$3, %rbp
	movq	%rax, %rbx
	movq	%rbp, %rdi
	call	malloc@PLT
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	malloc@PLT
	movq	%rax, %rbp
	testl	%r13d, %r13d
	je	.L3
	leal	-1(%r13), %r14d
	cmpl	$2, %r14d
	jbe	.L15
	movl	%r13d, %edx
	movdqa	.LC0(%rip), %xmm2
	movdqa	.LC2(%rip), %xmm6
	xorl	%eax, %eax
	shrl	$2, %edx
	movdqa	.LC3(%rip), %xmm5
	movdqa	.LC4(%rip), %xmm4
	salq	$5, %rdx
	.p2align 4,,10
	.p2align 3
.L5:
	movdqa	%xmm2, %xmm0
	paddd	%xmm6, %xmm2
	movdqa	%xmm0, %xmm1
	paddd	%xmm4, %xmm0
	paddd	%xmm5, %xmm1
	cvtdq2pd	%xmm1, %xmm3
	pshufd	$238, %xmm1, %xmm1
	movups	%xmm3, (%r12,%rax)
	cvtdq2pd	%xmm1, %xmm1
	movups	%xmm1, 16(%r12,%rax)
	cvtdq2pd	%xmm0, %xmm1
	pshufd	$238, %xmm0, %xmm0
	movups	%xmm1, 0(%rbp,%rax)
	cvtdq2pd	%xmm0, %xmm0
	movups	%xmm0, 16(%rbp,%rax)
	addq	$32, %rax
	cmpq	%rax, %rdx
	jne	.L5
	movl	%r13d, %eax
	andl	$-4, %eax
	testb	$3, %r13b
	je	.L6
.L4:
	leal	9(%rax), %edx
	pxor	%xmm0, %xmm0
	movslq	%eax, %rcx
	cvtsi2sdl	%edx, %xmm0
	leal	2(%rax), %edx
	movsd	%xmm0, (%r12,%rcx,8)
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%edx, %xmm0
	movsd	%xmm0, 0(%rbp,%rcx,8)
	leal	1(%rax), %ecx
	cmpl	%r13d, %ecx
	jnb	.L7
	leal	10(%rax), %esi
	pxor	%xmm0, %xmm0
	movslq	%ecx, %rcx
	cvtsi2sdl	%esi, %xmm0
	leal	3(%rax), %esi
	movsd	%xmm0, (%r12,%rcx,8)
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%esi, %xmm0
	movsd	%xmm0, 0(%rbp,%rcx,8)
	cmpl	%edx, %r13d
	jbe	.L6
	leal	11(%rax), %ecx
	pxor	%xmm0, %xmm0
	movslq	%edx, %rdx
	addl	$4, %eax
	cvtsi2sdl	%ecx, %xmm0
	movsd	%xmm0, (%r12,%rdx,8)
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, 0(%rbp,%rdx,8)
.L6:
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%ebx, %xmm0
.L13:
	movl	%r13d, %edx
	movapd	%xmm0, %xmm2
	xorl	%eax, %eax
	shrl	%edx
	unpcklpd	%xmm2, %xmm2
	salq	$4, %rdx
	.p2align 4,,10
	.p2align 3
.L9:
	movupd	(%r12,%rax), %xmm1
	movupd	0(%rbp,%rax), %xmm7
	mulpd	%xmm2, %xmm1
	addpd	%xmm7, %xmm1
	movups	%xmm1, 0(%rbp,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L9
	movl	%r13d, %eax
	andl	$-2, %eax
	testb	$1, %r13b
	je	.L12
.L11:
	cltq
	leaq	0(%rbp,%rax,8), %rdx
	mulsd	(%r12,%rax,8), %xmm0
	addsd	(%rdx), %xmm0
	movsd	%xmm0, (%rdx)
.L12:
	xorl	%edi, %edi
	leaq	16(%rsp), %rsi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	movl	%r14d, %edx
	movl	%r14d, %ecx
	subq	8(%rsp), %rax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movsd	0(%rbp,%rdx,8), %xmm2
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	movl	%r13d, %edx
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %edi
	movl	$3, %eax
	divsd	.LC5(%rip), %xmm0
	leaq	.LC6(%rip), %rsi
	addsd	%xmm1, %xmm0
	movsd	0(%rbp), %xmm1
	call	__printf_chk@PLT
	movq	%r12, %rdi
	call	free@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movq	40(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L24
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	movq	%rsp, %rsi
	xorl	%edi, %edi
	orl	$-1, %r14d
	call	clock_gettime@PLT
	jmp	.L12
.L15:
	xorl	%eax, %eax
	jmp	.L4
.L7:
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	cvtsi2sdl	%ebx, %xmm0
	cmpl	$1, %r13d
	je	.L11
	jmp	.L13
.L24:
	call	__stack_chk_fail@PLT
.L23:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC2:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC3:
	.long	9
	.long	9
	.long	9
	.long	9
	.align 16
.LC4:
	.long	2
	.long	2
	.long	2
	.long	2
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC5:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 9.3.0-10ubuntu2) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
