	.file	"daxpy.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Faltan n\302\272 componentes del vector y la constante"
.LC2:
	.string	"Tama\303\261o= %d\t Tiempo= %11.9f\t y[0]= %f\t y[%d]= %f\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jg	.L2
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	call	exit@PLT
.L2:
	movq	8(%rsi), %rdi
	movq	%rsi, %rbx
	call	atoi@PLT
	movq	16(%rbx), %rdi
	movl	%eax, %ebp
	call	atoi@PLT
	movq	%rbp, %r12
	salq	$3, %rbp
	movq	%rbp, %rdi
	movl	%eax, %ebx
	call	malloc@PLT
	movq	%rbp, %rdi
	movq	%rax, %r13
	call	malloc@PLT
	movq	%rax, %rbp
	xorl	%eax, %eax
.L3:
	cmpl	%eax, %r12d
	jbe	.L10
	leal	9(%rax), %edx
	cvtsi2sdl	%edx, %xmm0
	leal	2(%rax), %edx
	movsd	%xmm0, 0(%r13,%rax,8)
	cvtsi2sdl	%edx, %xmm0
	movsd	%xmm0, 0(%rbp,%rax,8)
	incq	%rax
	jmp	.L3
.L10:
	leaq	8(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	xorl	%eax, %eax
.L5:
	cmpl	%eax, %r12d
	jbe	.L11
	cvtsi2sdl	%ebx, %xmm0
	mulsd	0(%r13,%rax,8), %xmm0
	addsd	0(%rbp,%rax,8), %xmm0
	movsd	%xmm0, 0(%rbp,%rax,8)
	incq	%rax
	jmp	.L5
.L11:
	xorl	%edi, %edi
	leaq	24(%rsp), %rsi
	call	clock_gettime@PLT
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	leal	-1(%r12), %edx
	cvtsi2sdq	%rax, %xmm0
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	divsd	.LC1(%rip), %xmm0
	cvtsi2sdq	%rax, %xmm1
	movsd	0(%rbp,%rdx,8), %xmm2
	movq	%rdx, %rcx
	movb	$3, %al
	movl	%r12d, %edx
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	addsd	%xmm1, %xmm0
	movsd	0(%rbp), %xmm1
	call	__printf_chk@PLT
	movq	%r13, %rdi
	call	free@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movq	40(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	addq	$56, %rsp
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
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
