	.file	"sumaflops-improved4.c"
	.text
	.p2align 4
	.globl	dtime
	.type	dtime, @function
dtime:
.LFB22:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	xorl	%esi, %esi
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rdi
	call	gettimeofday@PLT
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	8(%rsp), %xmm0, %xmm1
	vcvtsi2sdq	(%rsp), %xmm0, %xmm0
	vfmadd231sd	.LC0(%rip), %xmm1, %xmm0
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L5
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE22:
	.size	dtime, .-dtime
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Starting Compute\r"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC10:
	.string	"GFlop = %10.3lf, Secs = %10.3lf, GFlop per sec = %10.3lf (GFLOPs), suma1 = %10.3lf\r\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
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
	subq	$72, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jg	.L24
	leaq	32(%rsp), %r12
	movl	$10000000, %ebp
	movl	$64, %ebx
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	xorl	%esi, %esi
	movq	%r12, %rdi
	call	gettimeofday@PLT
	vxorps	%xmm8, %xmm8, %xmm8
	vmovsd	.LC0(%rip), %xmm9
	vcvtsi2sdq	40(%rsp), %xmm8, %xmm1
	vcvtsi2sdq	32(%rsp), %xmm8, %xmm0
	vfmadd132sd	%xmm9, %xmm0, %xmm1
	vmovsd	%xmm1, (%rsp)
.L9:
	testl	%ebx, %ebx
	leal	3(%rbx), %edx
	vxorps	%xmm0, %xmm0, %xmm0
	vmovss	.LC3(%rip), %xmm4
	cmovns	%ebx, %edx
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm0, %xmm3
	xorl	%ecx, %ecx
	vmovss	.LC4(%rip), %xmm7
	vmovss	.LC5(%rip), %xmm6
	vmovaps	%xmm0, %xmm2
	vmovss	.LC6(%rip), %xmm5
	sarl	$2, %edx
	.p2align 4,,10
	.p2align 3
.L12:
	xorl	%eax, %eax
	cmpl	$3, %ebx
	jle	.L13
	.p2align 4,,10
	.p2align 3
.L11:
	vfmadd231ss	%xmm4, %xmm4, %xmm2
	vaddss	%xmm7, %xmm3, %xmm3
	vaddss	%xmm6, %xmm1, %xmm1
	incl	%eax
	vaddss	%xmm5, %xmm0, %xmm0
	vfmadd231ss	%xmm4, %xmm7, %xmm3
	vaddss	%xmm6, %xmm1, %xmm1
	vaddss	%xmm5, %xmm0, %xmm0
	vaddss	%xmm4, %xmm2, %xmm2
	vfmadd231ss	%xmm4, %xmm6, %xmm1
	vaddss	%xmm5, %xmm0, %xmm0
	vaddss	%xmm4, %xmm2, %xmm2
	vaddss	%xmm7, %xmm3, %xmm3
	vfmadd231ss	%xmm4, %xmm5, %xmm0
	vaddss	%xmm4, %xmm2, %xmm2
	vaddss	%xmm7, %xmm3, %xmm3
	vaddss	%xmm6, %xmm1, %xmm1
	cmpl	%edx, %eax
	jl	.L11
.L13:
	incl	%ecx
	cmpl	%ebp, %ecx
	jl	.L12
.L10:
	xorl	%esi, %esi
	movq	%r12, %rdi
	vmovsd	%xmm9, 8(%rsp)
	vmovss	%xmm0, 28(%rsp)
	vmovss	%xmm1, 24(%rsp)
	vmovss	%xmm3, 20(%rsp)
	vmovss	%xmm2, 16(%rsp)
	call	gettimeofday@PLT
	vxorps	%xmm8, %xmm8, %xmm8
	vmovsd	8(%rsp), %xmm9
	vcvtsi2sdq	40(%rsp), %xmm8, %xmm4
	vcvtsi2sdq	32(%rsp), %xmm8, %xmm5
	vfmadd132sd	%xmm9, %xmm5, %xmm4
	vsubsd	(%rsp), %xmm4, %xmm4
	vcomisd	.LC7(%rip), %xmm4
	jbe	.L14
	vcvtsi2sdl	%ebx, %xmm8, %xmm5
	vmulsd	.LC8(%rip), %xmm5, %xmm5
	vmovss	20(%rsp), %xmm3
	leaq	.LC10(%rip), %rdi
	vcvtsi2sdl	%ebp, %xmm8, %xmm8
	vmovss	16(%rsp), %xmm2
	movl	$4, %eax
	vmovss	24(%rsp), %xmm1
	vmovss	28(%rsp), %xmm0
	vaddss	%xmm3, %xmm2, %xmm2
	vmulsd	%xmm8, %xmm5, %xmm5
	vmulsd	.LC9(%rip), %xmm5, %xmm5
	vaddss	%xmm1, %xmm2, %xmm2
	vmovsd	%xmm4, %xmm4, %xmm1
	vaddss	%xmm0, %xmm2, %xmm3
	vdivsd	%xmm4, %xmm5, %xmm2
	vmovsd	%xmm5, %xmm5, %xmm0
	vcvtss2sd	%xmm3, %xmm3, %xmm3
	call	printf@PLT
.L14:
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L25
	addq	$72, %rsp
	.cfi_remember_state
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
.L24:
	.cfi_restore_state
	movl	%edi, %ebx
	movq	8(%rsi), %rdi
	movq	%rsi, %r12
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, %r13
	movl	%eax, %ebp
	cmpl	$2, %ebx
	je	.L17
	movq	16(%r12), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, %ebx
.L8:
	leaq	.LC2(%rip), %rdi
	leaq	32(%rsp), %r12
	call	puts@PLT
	xorl	%esi, %esi
	movq	%r12, %rdi
	call	gettimeofday@PLT
	vxorps	%xmm8, %xmm8, %xmm8
	vmovsd	.LC0(%rip), %xmm9
	vcvtsi2sdq	40(%rsp), %xmm8, %xmm1
	vcvtsi2sdq	32(%rsp), %xmm8, %xmm0
	vfmadd132sd	%xmm9, %xmm0, %xmm1
	vmovsd	%xmm1, (%rsp)
	testl	%r13d, %r13d
	jg	.L9
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm0, %xmm3
	vmovaps	%xmm0, %xmm2
	jmp	.L10
.L17:
	movl	$64, %ebx
	jmp	.L8
.L25:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	-1598689907
	.long	1051772663
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC3:
	.long	1065353216
	.align 4
.LC4:
	.long	1073741824
	.align 4
.LC5:
	.long	1077936128
	.align 4
.LC6:
	.long	1082130432
	.section	.rodata.cst8
	.align 8
.LC7:
	.long	0
	.long	0
	.align 8
.LC8:
	.long	-400107883
	.long	1041313291
	.align 8
.LC9:
	.long	0
	.long	1074790400
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
