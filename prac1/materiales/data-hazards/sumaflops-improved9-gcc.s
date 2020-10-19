	.file	"sumaflops-improved9.c"
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
.LC16:
	.string	"GFlop = %10.3lf, Secs = %10.3lf, GFlop per sec = %10.3lf (GFLOPs), suma1 = %10.3lf, suma2 = %10.3lf \r\n"
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
	subq	$104, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jg	.L25
	leaq	64(%rsp), %r12
	movl	$10000000, %ebx
	movl	$64, %ebp
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	xorl	%esi, %esi
	movq	%r12, %rdi
	call	gettimeofday@PLT
	vxorpd	%xmm2, %xmm2, %xmm2
	vmovsd	.LC0(%rip), %xmm3
	vcvtsi2sdq	72(%rsp), %xmm2, %xmm1
	vcvtsi2sdq	64(%rsp), %xmm2, %xmm0
	vmovsd	%xmm3, 16(%rsp)
	vfmadd132sd	%xmm3, %xmm0, %xmm1
	vmovsd	%xmm1, 8(%rsp)
.L9:
	movl	%ebp, %edx
	vxorps	%xmm4, %xmm4, %xmm4
	vmovss	.LC3(%rip), %xmm15
	xorl	%ecx, %ecx
	shrl	$31, %edx
	vmovss	.LC6(%rip), %xmm0
	vmovss	.LC8(%rip), %xmm14
	vmovaps	%xmm4, %xmm3
	addl	%ebp, %edx
	vmovss	.LC9(%rip), %xmm13
	vmovss	.LC10(%rip), %xmm12
	vmovaps	%xmm4, %xmm5
	vmovaps	%xmm4, %xmm6
	sarl	%edx
	vmovaps	%xmm4, %xmm7
	vmovaps	%xmm4, %xmm8
	vmovss	.LC11(%rip), %xmm11
	vmovaps	%xmm4, %xmm9
	vmovaps	%xmm4, %xmm10
	vmovaps	%xmm4, %xmm2
	vmovss	.LC12(%rip), %xmm1
	.p2align 4,,10
	.p2align 3
.L12:
	xorl	%eax, %eax
	cmpl	$1, %ebp
	jle	.L13
	.p2align 4,,10
	.p2align 3
.L11:
	vfmadd132ss	%xmm0, %xmm14, %xmm7
	vaddss	%xmm15, %xmm2, %xmm2
	vaddss	%xmm12, %xmm5, %xmm5
	incl	%eax
	vfmadd132ss	%xmm0, %xmm13, %xmm6
	vaddss	%xmm11, %xmm3, %xmm3
	vaddss	%xmm1, %xmm4, %xmm4
	vaddss	.LC4(%rip), %xmm10, %xmm10
	vaddss	.LC5(%rip), %xmm9, %xmm9
	vfmadd213ss	.LC7(%rip), %xmm0, %xmm8
	vfmadd132ss	%xmm0, %xmm15, %xmm2
	vfmadd213ss	.LC4(%rip), %xmm0, %xmm10
	vfmadd132ss	%xmm0, %xmm12, %xmm5
	vaddss	.LC7(%rip), %xmm8, %xmm8
	vfmadd132ss	%xmm0, %xmm11, %xmm3
	vfmadd132ss	%xmm0, %xmm1, %xmm4
	vaddss	%xmm14, %xmm7, %xmm7
	vfmadd213ss	.LC5(%rip), %xmm0, %xmm9
	vaddss	%xmm13, %xmm6, %xmm6
	cmpl	%edx, %eax
	jl	.L11
.L13:
	incl	%ecx
	cmpl	%ecx, %ebx
	jg	.L12
.L10:
	xorl	%esi, %esi
	movq	%r12, %rdi
	vmovss	%xmm5, 52(%rsp)
	vmovss	%xmm4, 60(%rsp)
	vmovss	%xmm3, 56(%rsp)
	vmovss	%xmm6, 48(%rsp)
	vmovss	%xmm7, 44(%rsp)
	vmovss	%xmm8, 40(%rsp)
	vmovss	%xmm9, 36(%rsp)
	vmovss	%xmm10, 32(%rsp)
	vmovss	%xmm2, 28(%rsp)
	call	gettimeofday@PLT
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	72(%rsp), %xmm5, %xmm0
	vcvtsi2sdq	64(%rsp), %xmm5, %xmm1
	vfmadd231sd	16(%rsp), %xmm0, %xmm1
	vsubsd	8(%rsp), %xmm1, %xmm1
	vcomisd	.LC13(%rip), %xmm1
	jbe	.L14
	vcvtsi2sdl	%ebp, %xmm5, %xmm0
	vmulsd	.LC14(%rip), %xmm0, %xmm0
	vmovss	28(%rsp), %xmm2
	leaq	.LC16(%rip), %rdi
	vcvtsi2sdl	%ebx, %xmm5, %xmm11
	vmovss	32(%rsp), %xmm10
	vmovss	36(%rsp), %xmm9
	movl	$5, %eax
	vmovss	40(%rsp), %xmm8
	vmovss	44(%rsp), %xmm7
	vaddss	%xmm10, %xmm2, %xmm2
	vmovss	48(%rsp), %xmm6
	vmovss	52(%rsp), %xmm5
	vmovss	56(%rsp), %xmm3
	vmovss	60(%rsp), %xmm4
	vmulsd	%xmm11, %xmm0, %xmm0
	vmulsd	.LC15(%rip), %xmm0, %xmm0
	vaddss	%xmm9, %xmm2, %xmm9
	vcvtss2sd	%xmm4, %xmm4, %xmm4
	vaddss	%xmm8, %xmm9, %xmm8
	vdivsd	%xmm1, %xmm0, %xmm2
	vaddss	%xmm7, %xmm8, %xmm7
	vaddss	%xmm6, %xmm7, %xmm6
	vaddss	%xmm5, %xmm6, %xmm5
	vaddss	%xmm3, %xmm5, %xmm3
	vcvtss2sd	%xmm3, %xmm3, %xmm3
	call	printf@PLT
.L14:
	movq	88(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L26
	addq	$104, %rsp
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
.L25:
	.cfi_restore_state
	movl	%edi, %ebp
	movq	8(%rsi), %rdi
	movq	%rsi, %r12
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, %r13
	movl	%eax, %ebx
	cmpl	$2, %ebp
	je	.L17
	movq	16(%r12), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, %ebp
.L8:
	leaq	.LC2(%rip), %rdi
	leaq	64(%rsp), %r12
	call	puts@PLT
	xorl	%esi, %esi
	movq	%r12, %rdi
	call	gettimeofday@PLT
	vxorpd	%xmm6, %xmm6, %xmm6
	vmovsd	.LC0(%rip), %xmm7
	vcvtsi2sdq	72(%rsp), %xmm6, %xmm1
	vcvtsi2sdq	64(%rsp), %xmm6, %xmm0
	vmovsd	%xmm7, 16(%rsp)
	vfmadd132sd	%xmm7, %xmm0, %xmm1
	vmovsd	%xmm1, 8(%rsp)
	testl	%r13d, %r13d
	jg	.L9
	vxorps	%xmm4, %xmm4, %xmm4
	vmovaps	%xmm4, %xmm3
	vmovaps	%xmm4, %xmm5
	vmovaps	%xmm4, %xmm6
	vmovaps	%xmm4, %xmm7
	vmovaps	%xmm4, %xmm8
	vmovaps	%xmm4, %xmm9
	vmovaps	%xmm4, %xmm10
	vmovaps	%xmm4, %xmm2
	jmp	.L10
.L17:
	movl	$64, %ebp
	jmp	.L8
.L26:
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
	.long	1065437102
	.align 4
.LC7:
	.long	1082130432
	.align 4
.LC8:
	.long	1084227584
	.align 4
.LC9:
	.long	1086324736
	.align 4
.LC10:
	.long	1088421888
	.align 4
.LC11:
	.long	1090519040
	.align 4
.LC12:
	.long	1091567616
	.section	.rodata.cst8
	.align 8
.LC13:
	.long	0
	.long	0
	.align 8
.LC14:
	.long	-400107883
	.long	1041313291
	.align 8
.LC15:
	.long	0
	.long	1075970048
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
