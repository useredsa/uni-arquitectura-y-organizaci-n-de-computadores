	.text
	.file	"sumaflops-improved4.c"
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
.LCPI1_2:
	.quad	4472406533629990549     # double 1.0000000000000001E-9
.LCPI1_3:
	.quad	4616189618054758400     # double 4
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI1_1:
	.long	1065353216              # float 1
	.long	1073741824              # float 2
	.long	1077936128              # float 3
	.long	1082130432              # float 4
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%fs:40, %rax
	movq	%rax, 48(%rsp)
	movl	$64, %r14d
	movl	$10000000, %ebx         # imm = 0x989680
	cmpl	$2, %edi
	jl	.LBB1_3
# %bb.1:
	movq	%rsi, %r15
	movl	%edi, %ebp
	movq	8(%rsi), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtol@PLT
	movq	%rax, %rbx
	cmpl	$2, %ebp
	je	.LBB1_3
# %bb.2:
	movq	16(%r15), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtol@PLT
	movq	%rax, %r14
.LBB1_3:
	leaq	.Lstr(%rip), %rdi
	callq	puts@PLT
	leaq	32(%rsp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday@PLT
	vcvtsi2sdq	32(%rsp), %xmm0, %xmm0
	vcvtsi2sdq	40(%rsp), %xmm1, %xmm1
	vmulsd	.LCPI1_0(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, 8(%rsp)          # 8-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	testl	%ebx, %ebx
	jle	.LBB1_13
# %bb.4:
	leal	3(%r14), %esi
	testl	%r14d, %r14d
	cmovnsl	%r14d, %esi
	cmpl	$4, %r14d
	jl	.LBB1_13
# %bb.5:
	sarl	$2, %esi
	leal	-1(%rsi), %eax
	movl	%esi, %ecx
	andl	$7, %ecx
	movl	%ecx, %edx
	subl	%esi, %edx
	vxorpd	%xmm1, %xmm1, %xmm1
	xorl	%esi, %esi
	vmovaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [1.0E+0,2.0E+0,3.0E+0,4.0E+0]
	jmp	.LBB1_6
	.p2align	4, 0x90
.LBB1_12:                               #   in Loop: Header=BB1_6 Depth=1
	incl	%esi
	cmpl	%ebx, %esi
	je	.LBB1_13
.LBB1_6:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_8 Depth 2
                                        #     Child Loop BB1_11 Depth 2
	cmpl	$7, %eax
	jb	.LBB1_9
# %bb.7:                                #   in Loop: Header=BB1_6 Depth=1
	movl	%edx, %edi
	.p2align	4, 0x90
.LBB1_8:                                #   Parent Loop BB1_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	addl	$8, %edi
	jne	.LBB1_8
.LBB1_9:                                #   in Loop: Header=BB1_6 Depth=1
	testl	%ecx, %ecx
	je	.LBB1_12
# %bb.10:                               #   in Loop: Header=BB1_6 Depth=1
	movl	%ecx, %edi
	.p2align	4, 0x90
.LBB1_11:                               #   Parent Loop BB1_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	decl	%edi
	jne	.LBB1_11
	jmp	.LBB1_12
.LBB1_13:
	vmovapd	%xmm1, 16(%rsp)         # 16-byte Spill
	leaq	32(%rsp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday@PLT
	vcvtsi2sdq	32(%rsp), %xmm2, %xmm0
	vcvtsi2sdq	40(%rsp), %xmm2, %xmm1
	vmulsd	.LCPI1_0(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	8(%rsp), %xmm0, %xmm1   # 8-byte Folded Reload
	vxorpd	%xmm0, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm1
	jbe	.LBB1_15
# %bb.14:
	vcvtsi2sd	%r14d, %xmm2, %xmm0
	vmulsd	.LCPI1_2(%rip), %xmm0, %xmm0
	vcvtsi2sd	%ebx, %xmm2, %xmm2
	vmulsd	%xmm2, %xmm0, %xmm0
	vmulsd	.LCPI1_3(%rip), %xmm0, %xmm0
	vdivsd	%xmm1, %xmm0, %xmm2
	vmovaps	16(%rsp), %xmm5         # 16-byte Reload
	vmovshdup	%xmm5, %xmm3    # xmm3 = xmm5[1,1,3,3]
	vaddss	%xmm3, %xmm5, %xmm3
	vpermilpd	$1, %xmm5, %xmm4 # xmm4 = xmm5[1,0]
	vaddss	%xmm4, %xmm3, %xmm3
	vpermilps	$231, %xmm5, %xmm4 # xmm4 = xmm5[3,1,2,3]
	vaddss	%xmm4, %xmm3, %xmm3
	vcvtss2sd	%xmm3, %xmm3, %xmm3
	leaq	.L.str.1(%rip), %rdi
	movb	$4, %al
	callq	printf@PLT
.LBB1_15:
	movq	%fs:40, %rax
	cmpq	48(%rsp), %rax
	jne	.LBB1_17
# %bb.16:
	xorl	%eax, %eax
	addq	$56, %rsp
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
	.cfi_def_cfa_offset 96
	callq	__stack_chk_fail@PLT
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str.1,@object        # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"GFlop = %10.3lf, Secs = %10.3lf, GFlop per sec = %10.3lf (GFLOPs), suma1 = %10.3lf\r\n"
	.size	.L.str.1, 85

	.type	.Lstr,@object           # @str
.Lstr:
	.asciz	"Starting Compute\r"
	.size	.Lstr, 18

	.ident	"clang version 10.0.1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __stack_chk_fail
