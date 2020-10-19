	.text
	.file	"sumaflops-improved9.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function dtime
.LCPI0_0:
	.quad	4517329193108106637     # double 9.9999999999999995E-7
	.text
	.globl	dtime
	.p2align	4, 0x90
	.type	dtime,@function
dtime:                                  # @dtime
	.cfi_startproc
# %bb.0:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%fs:40, %rax
	movq	%rax, 16(%rsp)
	movq	%rsp, %rdi
	xorl	%esi, %esi
	callq	gettimeofday@PLT
	vcvtsi2sdq	(%rsp), %xmm0, %xmm0
	vcvtsi2sdq	8(%rsp), %xmm1, %xmm1
	movq	%fs:40, %rax
	cmpq	16(%rsp), %rax
	jne	.LBB0_2
# %bb.1:
	vmulsd	.LCPI0_0(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.LBB0_2:
	.cfi_def_cfa_offset 32
	callq	__stack_chk_fail@PLT
.Lfunc_end0:
	.size	dtime, .Lfunc_end0-dtime
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function main
.LCPI1_0:
	.quad	4517329193108106637     # double 9.9999999999999995E-7
.LCPI1_11:
	.quad	4472406533629990549     # double 1.0000000000000001E-9
.LCPI1_12:
	.quad	4621256167635550208     # double 9
.LCPI1_13:
	.quad	0                       # double 0
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI1_1:
	.long	1065353216              # float 1
.LCPI1_2:
	.long	1073741824              # float 2
.LCPI1_3:
	.long	1077936128              # float 3
.LCPI1_4:
	.long	1082130432              # float 4
.LCPI1_5:
	.long	1065437102              # float 1.00999999
.LCPI1_6:
	.long	1084227584              # float 5
.LCPI1_7:
	.long	1086324736              # float 6
.LCPI1_8:
	.long	1088421888              # float 7
.LCPI1_9:
	.long	1090519040              # float 8
.LCPI1_10:
	.long	1091567616              # float 9
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$72, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%fs:40, %rax
	movq	%rax, 64(%rsp)
	movl	$64, %r14d
	movl	$10000000, %r15d        # imm = 0x989680
	cmpl	$2, %edi
	jl	.LBB1_3
# %bb.1:
	movq	%rsi, %rbx
	movl	%edi, %ebp
	movq	8(%rsi), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtol@PLT
	movq	%rax, %r15
	cmpl	$2, %ebp
	je	.LBB1_3
# %bb.2:
	movq	16(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtol@PLT
	movq	%rax, %r14
.LBB1_3:
	leaq	.Lstr(%rip), %rdi
	callq	puts@PLT
	leaq	48(%rsp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday@PLT
	vcvtsi2sdq	48(%rsp), %xmm0, %xmm0
	vcvtsi2sdq	56(%rsp), %xmm1, %xmm1
	vmulsd	.LCPI1_0(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, 40(%rsp)         # 8-byte Spill
	vxorps	%xmm12, %xmm12, %xmm12
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm8, %xmm8, %xmm8
	vxorps	%xmm9, %xmm9, %xmm9
	vxorps	%xmm10, %xmm10, %xmm10
	vxorps	%xmm7, %xmm7, %xmm7
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	testl	%r15d, %r15d
	jle	.LBB1_13
# %bb.4:
	cmpl	$2, %r14d
	jl	.LBB1_13
# %bb.5:
	movl	%r14d, %esi
	shrl	$31, %esi
	addl	%r14d, %esi
	sarl	%esi
	movl	%esi, %eax
	andl	$1, %eax
	movl	%r14d, %ecx
	andl	$-2, %ecx
	movl	%eax, %edx
	subl	%esi, %edx
	xorl	%esi, %esi
	vxorps	%xmm3, %xmm3, %xmm3
	vmovss	.LCPI1_5(%rip), %xmm1   # xmm1 = mem[0],zero,zero,zero
	vmovss	.LCPI1_1(%rip), %xmm11  # xmm11 = mem[0],zero,zero,zero
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm10, %xmm10, %xmm10
	vxorps	%xmm9, %xmm9, %xmm9
	vxorps	%xmm8, %xmm8, %xmm8
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm12, %xmm12, %xmm12
	vmovss	.LCPI1_8(%rip), %xmm15  # xmm15 = mem[0],zero,zero,zero
	vmovss	.LCPI1_9(%rip), %xmm14  # xmm14 = mem[0],zero,zero,zero
	vmovss	.LCPI1_10(%rip), %xmm13 # xmm13 = mem[0],zero,zero,zero
	jmp	.LBB1_6
	.p2align	4, 0x90
.LBB1_11:                               #   in Loop: Header=BB1_6 Depth=1
	incl	%esi
	cmpl	%r15d, %esi
	je	.LBB1_12
.LBB1_6:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_8 Depth 2
	cmpl	$2, %ecx
	je	.LBB1_9
# %bb.7:                                #   in Loop: Header=BB1_6 Depth=1
	movl	%edx, %edi
	.p2align	4, 0x90
.LBB1_8:                                #   Parent Loop BB1_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vaddss	%xmm11, %xmm12, %xmm4
	vmovss	.LCPI1_2(%rip), %xmm2   # xmm2 = mem[0],zero,zero,zero
	vaddss	%xmm2, %xmm5, %xmm5
	vmovss	.LCPI1_3(%rip), %xmm2   # xmm2 = mem[0],zero,zero,zero
	vaddss	%xmm2, %xmm6, %xmm6
	vmovss	.LCPI1_4(%rip), %xmm2   # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm2, %xmm1, %xmm8 # xmm8 = (xmm1 * xmm8) + xmm2
	vmovss	.LCPI1_6(%rip), %xmm2   # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm2, %xmm1, %xmm9 # xmm9 = (xmm1 * xmm9) + xmm2
	vmovaps	%xmm11, %xmm2
	vmovss	.LCPI1_7(%rip), %xmm12  # xmm12 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm12, %xmm1, %xmm10 # xmm10 = (xmm1 * xmm10) + xmm12
	vaddss	%xmm7, %xmm15, %xmm7
	vaddss	%xmm0, %xmm14, %xmm0
	vaddss	%xmm3, %xmm13, %xmm3
	vfmadd213ss	%xmm11, %xmm1, %xmm4 # xmm4 = (xmm1 * xmm4) + xmm11
	vmovss	.LCPI1_2(%rip), %xmm11  # xmm11 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm11, %xmm1, %xmm5 # xmm5 = (xmm1 * xmm5) + xmm11
	vfmadd213ss	.LCPI1_3(%rip), %xmm1, %xmm6 # xmm6 = (xmm1 * xmm6) + mem
	vaddss	.LCPI1_4(%rip), %xmm8, %xmm8
	vmovss	.LCPI1_6(%rip), %xmm11  # xmm11 = mem[0],zero,zero,zero
	vaddss	%xmm11, %xmm9, %xmm9
	vaddss	%xmm12, %xmm10, %xmm10
	vfmadd213ss	%xmm15, %xmm1, %xmm7 # xmm7 = (xmm1 * xmm7) + xmm15
	vfmadd213ss	%xmm14, %xmm1, %xmm0 # xmm0 = (xmm1 * xmm0) + xmm14
	vfmadd213ss	%xmm13, %xmm1, %xmm3 # xmm3 = (xmm1 * xmm3) + xmm13
	vaddss	%xmm2, %xmm4, %xmm12
	vaddss	.LCPI1_2(%rip), %xmm5, %xmm5
	vaddss	.LCPI1_3(%rip), %xmm6, %xmm6
	vmovss	.LCPI1_4(%rip), %xmm4   # xmm4 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm4, %xmm1, %xmm8 # xmm8 = (xmm1 * xmm8) + xmm4
	vfmadd213ss	%xmm11, %xmm1, %xmm9 # xmm9 = (xmm1 * xmm9) + xmm11
	vmovss	.LCPI1_7(%rip), %xmm4   # xmm4 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm4, %xmm1, %xmm10 # xmm10 = (xmm1 * xmm10) + xmm4
	vaddss	%xmm7, %xmm15, %xmm7
	vaddss	%xmm0, %xmm14, %xmm0
	vaddss	%xmm3, %xmm13, %xmm3
	vfmadd213ss	%xmm2, %xmm1, %xmm12 # xmm12 = (xmm1 * xmm12) + xmm2
	vfmadd213ss	.LCPI1_2(%rip), %xmm1, %xmm5 # xmm5 = (xmm1 * xmm5) + mem
	vfmadd213ss	.LCPI1_3(%rip), %xmm1, %xmm6 # xmm6 = (xmm1 * xmm6) + mem
	vaddss	.LCPI1_4(%rip), %xmm8, %xmm8
	vaddss	%xmm11, %xmm9, %xmm9
	vaddss	%xmm4, %xmm10, %xmm10
	vmovaps	%xmm2, %xmm11
	vfmadd213ss	%xmm15, %xmm1, %xmm7 # xmm7 = (xmm1 * xmm7) + xmm15
	vfmadd213ss	%xmm14, %xmm1, %xmm0 # xmm0 = (xmm1 * xmm0) + xmm14
	vfmadd213ss	%xmm13, %xmm1, %xmm3 # xmm3 = (xmm1 * xmm3) + xmm13
	addl	$2, %edi
	jne	.LBB1_8
.LBB1_9:                                #   in Loop: Header=BB1_6 Depth=1
	testl	%eax, %eax
	je	.LBB1_11
# %bb.10:                               #   in Loop: Header=BB1_6 Depth=1
	vmovss	.LCPI1_10(%rip), %xmm4  # xmm4 = mem[0],zero,zero,zero
	vaddss	%xmm4, %xmm3, %xmm3
	vfmadd213ss	%xmm4, %xmm1, %xmm3 # xmm3 = (xmm1 * xmm3) + xmm4
	vmovss	.LCPI1_9(%rip), %xmm4   # xmm4 = mem[0],zero,zero,zero
	vaddss	%xmm4, %xmm0, %xmm0
	vfmadd213ss	%xmm4, %xmm1, %xmm0 # xmm0 = (xmm1 * xmm0) + xmm4
	vmovss	.LCPI1_8(%rip), %xmm4   # xmm4 = mem[0],zero,zero,zero
	vaddss	%xmm4, %xmm7, %xmm7
	vfmadd213ss	%xmm4, %xmm1, %xmm7 # xmm7 = (xmm1 * xmm7) + xmm4
	vmovss	.LCPI1_7(%rip), %xmm4   # xmm4 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm4, %xmm1, %xmm10 # xmm10 = (xmm1 * xmm10) + xmm4
	vaddss	%xmm4, %xmm10, %xmm10
	vmovss	.LCPI1_6(%rip), %xmm4   # xmm4 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm4, %xmm1, %xmm9 # xmm9 = (xmm1 * xmm9) + xmm4
	vaddss	%xmm4, %xmm9, %xmm9
	vmovss	.LCPI1_4(%rip), %xmm4   # xmm4 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm4, %xmm1, %xmm8 # xmm8 = (xmm1 * xmm8) + xmm4
	vaddss	%xmm4, %xmm8, %xmm8
	vmovss	.LCPI1_3(%rip), %xmm4   # xmm4 = mem[0],zero,zero,zero
	vaddss	%xmm4, %xmm6, %xmm6
	vfmadd213ss	%xmm4, %xmm1, %xmm6 # xmm6 = (xmm1 * xmm6) + xmm4
	vmovss	.LCPI1_2(%rip), %xmm4   # xmm4 = mem[0],zero,zero,zero
	vaddss	%xmm4, %xmm5, %xmm5
	vfmadd213ss	%xmm4, %xmm1, %xmm5 # xmm5 = (xmm1 * xmm5) + xmm4
	vaddss	%xmm11, %xmm12, %xmm12
	vfmadd213ss	%xmm11, %xmm1, %xmm12 # xmm12 = (xmm1 * xmm12) + xmm11
	jmp	.LBB1_11
.LBB1_12:
	vcvtss2sd	%xmm3, %xmm3, %xmm1
.LBB1_13:
	vmovsd	%xmm1, 32(%rsp)         # 8-byte Spill
	vmovss	%xmm5, (%rsp)           # 4-byte Spill
	vmovss	%xmm6, 4(%rsp)          # 4-byte Spill
	vmovss	%xmm8, 8(%rsp)          # 4-byte Spill
	vmovss	%xmm9, 12(%rsp)         # 4-byte Spill
	vmovss	%xmm10, 16(%rsp)        # 4-byte Spill
	vmovss	%xmm7, 20(%rsp)         # 4-byte Spill
	vmovss	%xmm0, 24(%rsp)         # 4-byte Spill
	vmovss	%xmm12, 28(%rsp)        # 4-byte Spill
	leaq	48(%rsp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday@PLT
	vxorps	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	48(%rsp), %xmm2, %xmm0
	vxorps	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	56(%rsp), %xmm2, %xmm1
	vmulsd	.LCPI1_0(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	40(%rsp), %xmm0, %xmm1  # 8-byte Folded Reload
	vucomisd	.LCPI1_13(%rip), %xmm1
	jbe	.LBB1_15
# %bb.14:
	vxorps	%xmm2, %xmm2, %xmm2
	vcvtsi2sd	%r14d, %xmm2, %xmm0
	vmulsd	.LCPI1_11(%rip), %xmm0, %xmm0
	vxorps	%xmm2, %xmm2, %xmm2
	vcvtsi2sd	%r15d, %xmm2, %xmm2
	vmulsd	%xmm2, %xmm0, %xmm0
	vmulsd	.LCPI1_12(%rip), %xmm0, %xmm0
	vdivsd	%xmm1, %xmm0, %xmm2
	vmovss	(%rsp), %xmm3           # 4-byte Reload
                                        # xmm3 = mem[0],zero,zero,zero
	vaddss	28(%rsp), %xmm3, %xmm3  # 4-byte Folded Reload
	vaddss	4(%rsp), %xmm3, %xmm3   # 4-byte Folded Reload
	vaddss	8(%rsp), %xmm3, %xmm3   # 4-byte Folded Reload
	vaddss	12(%rsp), %xmm3, %xmm3  # 4-byte Folded Reload
	vaddss	16(%rsp), %xmm3, %xmm3  # 4-byte Folded Reload
	vaddss	20(%rsp), %xmm3, %xmm3  # 4-byte Folded Reload
	vaddss	24(%rsp), %xmm3, %xmm3  # 4-byte Folded Reload
	vcvtss2sd	%xmm3, %xmm3, %xmm3
	leaq	.L.str.1(%rip), %rdi
	vmovsd	32(%rsp), %xmm4         # 8-byte Reload
                                        # xmm4 = mem[0],zero
	movb	$5, %al
	callq	printf@PLT
.LBB1_15:
	movq	%fs:40, %rax
	cmpq	64(%rsp), %rax
	jne	.LBB1_17
# %bb.16:
	xorl	%eax, %eax
	addq	$72, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB1_17:
	.cfi_def_cfa_offset 112
	callq	__stack_chk_fail@PLT
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str.1,@object        # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"GFlop = %10.3lf, Secs = %10.3lf, GFlop per sec = %10.3lf (GFLOPs), suma1 = %10.3lf, suma2 = %10.3lf \r\n"
	.size	.L.str.1, 103

	.type	.Lstr,@object           # @str
.Lstr:
	.asciz	"Starting Compute\r"
	.size	.Lstr, 18

	.ident	"clang version 10.0.1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __stack_chk_fail
