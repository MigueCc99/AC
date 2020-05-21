	.file	"daxpy.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Faltan n\302\272 componentes del vector y la constante"
	.align 8
.LC2:
	.string	"Tama\303\261o= %d\t Tiempo= %11.9f\t y[0]= %f\t y[%d]= %f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jle	.L15
	movq	8(%rsi), %rdi
	movq	%rsi, %rbp
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%rbp), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rax, %rbx
	call	strtol@PLT
	movl	%ebx, %ebp
	salq	$3, %rbp
	movq	%rax, %r12
	movq	%rbp, %rdi
	call	malloc@PLT
	movq	%rbp, %rdi
	movq	%rax, %r13
	call	malloc@PLT
	movq	%rax, %rbp
	testl	%ebx, %ebx
	je	.L3
	leal	-1(%rbx), %r14d
	xorl	%eax, %eax
	movq	%r14, %r15
	.p2align 4,,10
	.p2align 3
.L4:
	leal	9(%rax), %edx
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%edx, %xmm0
	leal	2(%rax), %edx
	movsd	%xmm0, 0(%r13,%rax,8)
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%edx, %xmm0
	movq	%rax, %rdx
	movsd	%xmm0, 0(%rbp,%rax,8)
	addq	$1, %rax
	cmpq	%r14, %rdx
	jne	.L4
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	pxor	%xmm1, %xmm1
	xorl	%eax, %eax
	cvtsi2sdl	%r12d, %xmm1
	.p2align 4,,10
	.p2align 3
.L6:
	movsd	0(%r13,%rax,8), %xmm0
	movq	%rax, %rdx
	mulsd	%xmm1, %xmm0
	addsd	0(%rbp,%rax,8), %xmm0
	movsd	%xmm0, 0(%rbp,%rax,8)
	addq	$1, %rax
	cmpq	%r14, %rdx
	jne	.L6
.L7:
	xorl	%edi, %edi
	leaq	16(%rsp), %rsi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	movl	%r15d, %edx
	movl	%r15d, %ecx
	subq	8(%rsp), %rax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movsd	0(%rbp,%rdx,8), %xmm2
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	movl	%ebx, %edx
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %edi
	movl	$3, %eax
	divsd	.LC1(%rip), %xmm0
	leaq	.LC2(%rip), %rsi
	addsd	%xmm1, %xmm0
	movsd	0(%rbp), %xmm1
	call	__printf_chk@PLT
	movq	%r13, %rdi
	call	free@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movq	40(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L16
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	movq	%rsp, %rsi
	xorl	%edi, %edi
	orl	$-1, %r15d
	call	clock_gettime@PLT
	jmp	.L7
.L16:
	call	__stack_chk_fail@PLT
.L15:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
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
