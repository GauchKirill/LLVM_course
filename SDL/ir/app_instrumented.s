	.text
	.file	"app.c"
	.globl	random_range                    # -- Begin function random_range
	.p2align	4, 0x90
	.type	random_range,@function
random_range:                           # @random_range
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movl	%esi, %ebp
	movl	%edi, %ebx
	movl	$.Linst_str, %edi
	callq	__log_inst@PLT
	callq	rand@PLT
	movl	%eax, %r14d
	movl	$.Linst_str.1, %edi
	callq	__log_inst@PLT
	subl	%ebx, %ebp
	movl	$.Linst_str.2, %edi
	callq	__log_inst@PLT
	incl	%ebp
	movl	$.Linst_str.3, %edi
	callq	__log_inst@PLT
	movl	%r14d, %eax
	cltd
	idivl	%ebp
	movl	%edx, %ebp
	movl	$.Linst_str.4, %edi
	callq	__log_inst@PLT
	addl	%ebx, %ebp
	movl	$.Linst_str.5, %edi
	callq	__log_inst@PLT
	movl	%ebp, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	random_range, .Lfunc_end0-random_range
	.cfi_endproc
                                        # -- End function
	.globl	app                             # -- Begin function app
	.p2align	4, 0x90
	.type	app,@function
app:                                    # @app
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$1720, %rsp                     # imm = 0x6B8
	.cfi_def_cfa_offset 1776
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$.Linst_str.6, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.7, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.8, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.9, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.10, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.11, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.12, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.13, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.14, %edi
	callq	__log_inst@PLT
	xorl	%r14d, %r14d
	xorl	%edi, %edi
	callq	time@PLT
	movq	%rax, %rbx
	movl	$.Linst_str.15, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.16, %edi
	callq	__log_inst@PLT
	movl	%ebx, %edi
	callq	srand@PLT
	movl	$.Linst_str.17, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.18, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.19, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.20, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.21, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.22, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.23, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.24, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.25, %edi
	callq	__log_inst@PLT
	.p2align	4, 0x90
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movl	$.Linst_str.26, %edi
	callq	__log_inst@PLT
	callq	rand@PLT
	movl	%eax, %ebx
	movl	$.Linst_str.27, %edi
	callq	__log_inst@PLT
	movslq	%ebx, %rbx
	imulq	$780903145, %rbx, %rax          # imm = 0x2E8BA2E9
	movq	%rax, %rcx
	shrq	$63, %rcx
	shrq	$32, %rax
	sarl	%eax
	addl	%ecx, %eax
	leal	(%rax,%rax,4), %ecx
	leal	(%rax,%rcx,2), %r12d
	movl	%ebx, %r15d
	subl	%r12d, %r15d
	movl	$.Linst_str.28, %edi
	callq	__log_inst@PLT
	negl	%r12d
	addl	%r12d, %ebx
	addl	$5, %ebx
	movl	$.Linst_str.29, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.30, %edi
	callq	__log_inst@PLT
	movl	%ebx, 896(%rsp,%r14)
	movl	$.Linst_str.31, %edi
	callq	__log_inst@PLT
	callq	rand@PLT
	movl	%eax, %ebx
	movl	$.Linst_str.32, %edi
	callq	__log_inst@PLT
	movl	$791, %ebp                      # imm = 0x317
	subl	%r15d, %ebp
	subl	%r15d, %ebp
	movl	$.Linst_str.33, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.34, %edi
	callq	__log_inst@PLT
	movl	%ebx, %eax
	cltd
	idivl	%ebp
	movl	%edx, %ebx
	movl	$.Linst_str.35, %edi
	callq	__log_inst@PLT
	addl	%r15d, %ebx
	addl	$5, %ebx
	movl	$.Linst_str.36, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.37, %edi
	callq	__log_inst@PLT
	movl	%ebx, 272(%rsp,%r14)
	movl	$.Linst_str.38, %edi
	callq	__log_inst@PLT
	callq	rand@PLT
	movl	%eax, %ebx
	movl	$.Linst_str.39, %edi
	callq	__log_inst@PLT
	leal	10(,%r15,2), %eax
	movl	$601, %ebp                      # imm = 0x259
	subl	%eax, %ebp
	movl	$.Linst_str.40, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.41, %edi
	callq	__log_inst@PLT
	movl	%ebx, %eax
	cltd
	idivl	%ebp
	movl	%edx, %ebx
	movl	$.Linst_str.42, %edi
	callq	__log_inst@PLT
	addl	%r15d, %ebx
	addl	$5, %ebx
	movl	$.Linst_str.43, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.44, %edi
	callq	__log_inst@PLT
	movl	%ebx, 64(%rsp,%r14)
	movl	$.Linst_str.45, %edi
	callq	__log_inst@PLT
	callq	rand@PLT
	movl	%eax, %ebx
	movl	$.Linst_str.46, %edi
	callq	__log_inst@PLT
	movslq	%ebx, %rbx
	imulq	$715827883, %rbx, %rax          # imm = 0x2AAAAAAB
	movq	%rax, %rcx
	shrq	$63, %rcx
	shrq	$32, %rax
	addl	%ecx, %eax
	addl	%eax, %eax
	leal	(%rax,%rax,2), %r15d
	movl	%ebx, %ebp
	subl	%r15d, %ebp
	movl	$.Linst_str.47, %edi
	callq	__log_inst@PLT
	negl	%r15d
	addl	%ebx, %r15d
	incl	%r15d
	movl	$.Linst_str.48, %edi
	callq	__log_inst@PLT
	callq	rand@PLT
	movl	%eax, %ebx
	movl	$.Linst_str.49, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.50, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.51, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.52, %edi
	callq	__log_inst@PLT
	testb	$1, %bl
	notl	%ebp
	cmovnel	%r15d, %ebp
	movl	$.Linst_str.53, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.54, %edi
	callq	__log_inst@PLT
	movl	%ebp, 688(%rsp,%r14)
	movl	$.Linst_str.55, %edi
	callq	__log_inst@PLT
	callq	rand@PLT
	movl	%eax, %ebx
	movl	$.Linst_str.56, %edi
	callq	__log_inst@PLT
	movslq	%ebx, %rbx
	imulq	$715827883, %rbx, %rax          # imm = 0x2AAAAAAB
	movq	%rax, %rcx
	shrq	$63, %rcx
	shrq	$32, %rax
	addl	%ecx, %eax
	addl	%eax, %eax
	leal	(%rax,%rax,2), %r15d
	movl	%ebx, %ebp
	subl	%r15d, %ebp
	movl	$.Linst_str.57, %edi
	callq	__log_inst@PLT
	negl	%r15d
	addl	%ebx, %r15d
	incl	%r15d
	movl	$.Linst_str.58, %edi
	callq	__log_inst@PLT
	callq	rand@PLT
	movl	%eax, %ebx
	movl	$.Linst_str.59, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.60, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.61, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.62, %edi
	callq	__log_inst@PLT
	testb	$1, %bl
	notl	%ebp
	cmovnel	%r15d, %ebp
	movl	$.Linst_str.63, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.64, %edi
	callq	__log_inst@PLT
	movl	%ebp, 480(%rsp,%r14)
	movl	$.Linst_str.65, %edi
	callq	__log_inst@PLT
	callq	rand@PLT
	movl	%eax, %ebx
	movl	$.Linst_str.66, %edi
	callq	__log_inst@PLT
	movslq	%ebx, %rbx
	imulq	$333589693, %rbx, %rax          # imm = 0x13E22CBD
	movq	%rax, %rcx
	shrq	$63, %rcx
	sarq	$36, %rax
	addl	%ecx, %eax
	imull	$206, %eax, %r15d
	movl	$.Linst_str.67, %edi
	callq	__log_inst@PLT
	negl	%r15d
	addl	%r15d, %ebx
	addl	$50, %ebx
	movl	$.Linst_str.68, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.69, %edi
	callq	__log_inst@PLT
	movl	%ebx, 1520(%rsp,%r14)
	movl	$.Linst_str.70, %edi
	callq	__log_inst@PLT
	callq	rand@PLT
	movl	%eax, %ebx
	movl	$.Linst_str.71, %edi
	callq	__log_inst@PLT
	movslq	%ebx, %rbx
	imulq	$333589693, %rbx, %rax          # imm = 0x13E22CBD
	movq	%rax, %rcx
	shrq	$63, %rcx
	sarq	$36, %rax
	addl	%ecx, %eax
	imull	$206, %eax, %r15d
	movl	$.Linst_str.72, %edi
	callq	__log_inst@PLT
	negl	%r15d
	addl	%r15d, %ebx
	addl	$50, %ebx
	movl	$.Linst_str.73, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.74, %edi
	callq	__log_inst@PLT
	movl	%ebx, 1312(%rsp,%r14)
	movl	$.Linst_str.75, %edi
	callq	__log_inst@PLT
	callq	rand@PLT
	movl	%eax, %ebx
	movl	$.Linst_str.76, %edi
	callq	__log_inst@PLT
	movslq	%ebx, %rbx
	imulq	$333589693, %rbx, %rax          # imm = 0x13E22CBD
	movq	%rax, %rcx
	shrq	$63, %rcx
	sarq	$36, %rax
	addl	%ecx, %eax
	imull	$206, %eax, %r15d
	movl	$.Linst_str.77, %edi
	callq	__log_inst@PLT
	negl	%r15d
	addl	%r15d, %ebx
	addl	$50, %ebx
	movl	$.Linst_str.78, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.79, %edi
	callq	__log_inst@PLT
	movl	%ebx, 1104(%rsp,%r14)
	movl	$.Linst_str.80, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.81, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.82, %edi
	callq	__log_inst@PLT
	addq	$4, %r14
	cmpq	$200, %r14
	jne	.LBB1_1
# %bb.2:
	movl	$.Linst_str.83, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.84, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.85, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.86, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.87, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.88, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.89, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.90, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.91, %edi
	callq	__log_inst@PLT
	xorl	%ebx, %ebx
	jmp	.LBB1_3
	.p2align	4, 0x90
.LBB1_4:                                #   in Loop: Header=BB1_3 Depth=1
	movl	$.Linst_str.107, %edi
	callq	__log_inst@PLT
.LBB1_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_6 Depth 2
                                        #     Child Loop BB1_16 Depth 2
                                        #       Child Loop BB1_21 Depth 3
	movl	$.Linst_str.92, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.93, %edi
	callq	__log_inst@PLT
	movaps	688(%rsp,%rbx,4), %xmm0
	movaps	%xmm0, 16(%rsp)                 # 16-byte Spill
	movl	$.Linst_str.94, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.95, %edi
	callq	__log_inst@PLT
	movdqa	16(%rsp), %xmm0                 # 16-byte Reload
	paddd	272(%rsp,%rbx,4), %xmm0
	movdqa	%xmm0, 16(%rsp)                 # 16-byte Spill
	movl	$.Linst_str.96, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.97, %edi
	callq	__log_inst@PLT
	movaps	16(%rsp), %xmm0                 # 16-byte Reload
	movaps	%xmm0, 272(%rsp,%rbx,4)
	movl	$.Linst_str.98, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.99, %edi
	callq	__log_inst@PLT
	movaps	480(%rsp,%rbx,4), %xmm0
	movaps	%xmm0, 16(%rsp)                 # 16-byte Spill
	movl	$.Linst_str.100, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.101, %edi
	callq	__log_inst@PLT
	movdqa	16(%rsp), %xmm0                 # 16-byte Reload
	paddd	64(%rsp,%rbx,4), %xmm0
	movdqa	%xmm0, 16(%rsp)                 # 16-byte Spill
	movl	$.Linst_str.102, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.103, %edi
	callq	__log_inst@PLT
	movaps	16(%rsp), %xmm0                 # 16-byte Reload
	movaps	%xmm0, 64(%rsp,%rbx,4)
	movl	$.Linst_str.104, %edi
	callq	__log_inst@PLT
	addq	$4, %rbx
	movl	$.Linst_str.105, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.106, %edi
	callq	__log_inst@PLT
	cmpq	$48, %rbx
	jne	.LBB1_4
# %bb.5:                                #   in Loop: Header=BB1_3 Depth=1
	movl	$.Linst_str.108, %edi
	callq	__log_inst@PLT
	movl	880(%rsp), %ebx
	movl	$.Linst_str.109, %edi
	callq	__log_inst@PLT
	addl	464(%rsp), %ebx
	movl	$.Linst_str.110, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.111, %edi
	callq	__log_inst@PLT
	movl	%ebx, 464(%rsp)
	movl	$.Linst_str.112, %edi
	callq	__log_inst@PLT
	movl	672(%rsp), %ebx
	movl	$.Linst_str.113, %edi
	callq	__log_inst@PLT
	addl	256(%rsp), %ebx
	movl	$.Linst_str.114, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.115, %edi
	callq	__log_inst@PLT
	movl	%ebx, 256(%rsp)
	movl	$.Linst_str.116, %edi
	callq	__log_inst@PLT
	movl	884(%rsp), %ebx
	movl	$.Linst_str.117, %edi
	callq	__log_inst@PLT
	addl	468(%rsp), %ebx
	movl	$.Linst_str.118, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.119, %edi
	callq	__log_inst@PLT
	movl	%ebx, 468(%rsp)
	movl	$.Linst_str.120, %edi
	callq	__log_inst@PLT
	movl	676(%rsp), %ebx
	movl	$.Linst_str.121, %edi
	callq	__log_inst@PLT
	addl	260(%rsp), %ebx
	movl	$.Linst_str.122, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.123, %edi
	callq	__log_inst@PLT
	movl	%ebx, 260(%rsp)
	movl	$.Linst_str.124, %edi
	callq	__log_inst@PLT
	xorl	%ebx, %ebx
	jmp	.LBB1_6
	.p2align	4, 0x90
.LBB1_14:                               #   in Loop: Header=BB1_6 Depth=2
	movl	$.Linst_str.165, %edi
	callq	__log_inst@PLT
	incq	%rbx
	movl	$.Linst_str.166, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.167, %edi
	callq	__log_inst@PLT
	cmpq	$50, %rbx
	je	.LBB1_15
.LBB1_6:                                #   Parent Loop BB1_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$.Linst_str.125, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.126, %edi
	callq	__log_inst@PLT
	movl	272(%rsp,%rbx,4), %r14d
	movl	$.Linst_str.127, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.128, %edi
	callq	__log_inst@PLT
	movl	896(%rsp,%rbx,4), %ebp
	movl	$.Linst_str.129, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.130, %edi
	callq	__log_inst@PLT
	cmpl	%ebp, %r14d
	jge	.LBB1_8
# %bb.7:                                #   in Loop: Header=BB1_6 Depth=2
	movl	$.Linst_str.131, %edi
	callq	__log_inst@PLT
	movl	%ebp, 272(%rsp,%rbx,4)
	movl	$.Linst_str.132, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.133, %edi
	callq	__log_inst@PLT
	xorl	%r14d, %r14d
	subl	688(%rsp,%rbx,4), %r14d
	movl	$.Linst_str.134, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.135, %edi
	callq	__log_inst@PLT
	movl	%r14d, 688(%rsp,%rbx,4)
	movl	$.Linst_str.136, %edi
	callq	__log_inst@PLT
	movl	%ebp, %r14d
.LBB1_8:                                #   in Loop: Header=BB1_6 Depth=2
	movl	$.Linst_str.137, %edi
	callq	__log_inst@PLT
	movl	$800, %r15d                     # imm = 0x320
	subl	%ebp, %r15d
	movl	$.Linst_str.138, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.139, %edi
	callq	__log_inst@PLT
	cmpl	%r15d, %r14d
	jle	.LBB1_10
# %bb.9:                                #   in Loop: Header=BB1_6 Depth=2
	movl	$.Linst_str.140, %edi
	callq	__log_inst@PLT
	movl	%r15d, 272(%rsp,%rbx,4)
	movl	$.Linst_str.141, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.142, %edi
	callq	__log_inst@PLT
	xorl	%r14d, %r14d
	subl	688(%rsp,%rbx,4), %r14d
	movl	$.Linst_str.143, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.144, %edi
	callq	__log_inst@PLT
	movl	%r14d, 688(%rsp,%rbx,4)
	movl	$.Linst_str.145, %edi
	callq	__log_inst@PLT
.LBB1_10:                               #   in Loop: Header=BB1_6 Depth=2
	movl	$.Linst_str.146, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.147, %edi
	callq	__log_inst@PLT
	movl	64(%rsp,%rbx,4), %r14d
	movl	$.Linst_str.148, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.149, %edi
	callq	__log_inst@PLT
	cmpl	%ebp, %r14d
	jge	.LBB1_12
# %bb.11:                               #   in Loop: Header=BB1_6 Depth=2
	movl	$.Linst_str.150, %edi
	callq	__log_inst@PLT
	movl	%ebp, 64(%rsp,%rbx,4)
	movl	$.Linst_str.151, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.152, %edi
	callq	__log_inst@PLT
	xorl	%r14d, %r14d
	subl	480(%rsp,%rbx,4), %r14d
	movl	$.Linst_str.153, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.154, %edi
	callq	__log_inst@PLT
	movl	%r14d, 480(%rsp,%rbx,4)
	movl	$.Linst_str.155, %edi
	callq	__log_inst@PLT
	movl	%ebp, %r14d
.LBB1_12:                               #   in Loop: Header=BB1_6 Depth=2
	movl	$.Linst_str.156, %edi
	callq	__log_inst@PLT
	movl	$600, %r15d                     # imm = 0x258
	subl	%ebp, %r15d
	movl	$.Linst_str.157, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.158, %edi
	callq	__log_inst@PLT
	cmpl	%r15d, %r14d
	jle	.LBB1_14
# %bb.13:                               #   in Loop: Header=BB1_6 Depth=2
	movl	$.Linst_str.159, %edi
	callq	__log_inst@PLT
	movl	%r15d, 64(%rsp,%rbx,4)
	movl	$.Linst_str.160, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.161, %edi
	callq	__log_inst@PLT
	xorl	%ebp, %ebp
	subl	480(%rsp,%rbx,4), %ebp
	movl	$.Linst_str.162, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.163, %edi
	callq	__log_inst@PLT
	movl	%ebp, 480(%rsp,%rbx,4)
	movl	$.Linst_str.164, %edi
	callq	__log_inst@PLT
	jmp	.LBB1_14
	.p2align	4, 0x90
.LBB1_15:                               # %.preheader
                                        #   in Loop: Header=BB1_3 Depth=1
	xorl	%ebx, %ebx
	jmp	.LBB1_16
	.p2align	4, 0x90
.LBB1_17:                               #   in Loop: Header=BB1_16 Depth=2
	movq	16(%rsp), %rbx                  # 8-byte Reload
	incq	%rbx
	movl	$.Linst_str.168, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.169, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.170, %edi
	callq	__log_inst@PLT
	cmpq	$50, %rbx
	je	.LBB1_18
.LBB1_16:                               #   Parent Loop BB1_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_21 Depth 3
	movl	$.Linst_str.174, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.175, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.176, %edi
	callq	__log_inst@PLT
	movq	%rbx, 16(%rsp)                  # 8-byte Spill
	cmpq	$48, %rbx
	ja	.LBB1_17
# %bb.20:                               #   in Loop: Header=BB1_16 Depth=2
	movl	$.Linst_str.177, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.178, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.179, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.180, %edi
	callq	__log_inst@PLT
	movq	16(%rsp), %rbx                  # 8-byte Reload
	movl	896(%rsp,%rbx,4), %eax
	movl	%eax, 44(%rsp)                  # 4-byte Spill
	movl	$.Linst_str.181, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.182, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.183, %edi
	callq	__log_inst@PLT
	jmp	.LBB1_21
	.p2align	4, 0x90
.LBB1_24:                               #   in Loop: Header=BB1_21 Depth=3
	movl	$.Linst_str.230, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.231, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.232, %edi
	callq	__log_inst@PLT
	incq	%rbx
	cmpq	$49, %rbx
	je	.LBB1_17
.LBB1_21:                               #   Parent Loop BB1_3 Depth=1
                                        #     Parent Loop BB1_16 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$.Linst_str.184, %edi
	callq	__log_inst@PLT
	movq	16(%rsp), %r14                  # 8-byte Reload
	movl	272(%rsp,%r14,4), %r15d
	movl	$.Linst_str.185, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.186, %edi
	callq	__log_inst@PLT
	movq	%r15, 48(%rsp)                  # 8-byte Spill
	movl	%r15d, %ebp
	subl	276(%rsp,%rbx,4), %ebp
	movl	$.Linst_str.187, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.188, %edi
	callq	__log_inst@PLT
	movl	64(%rsp,%r14,4), %r14d
	movl	$.Linst_str.189, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.190, %edi
	callq	__log_inst@PLT
	movq	%r14, 56(%rsp)                  # 8-byte Spill
	movl	%r14d, %r12d
	subl	68(%rsp,%rbx,4), %r12d
	movl	$.Linst_str.191, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.192, %edi
	callq	__log_inst@PLT
	movl	%ebp, %r14d
	imull	%ebp, %r14d
	movl	$.Linst_str.193, %edi
	callq	__log_inst@PLT
	movl	%r12d, %r13d
	imull	%r12d, %r13d
	movl	$.Linst_str.194, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.195, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.196, %edi
	callq	__log_inst@PLT
	movl	900(%rsp,%rbx,4), %r15d
	addl	44(%rsp), %r15d                 # 4-byte Folded Reload
	movl	$.Linst_str.197, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.198, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.199, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.200, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.201, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.202, %edi
	callq	__log_inst@PLT
	addl	%r14d, %r13d
	je	.LBB1_24
# %bb.22:                               #   in Loop: Header=BB1_21 Depth=3
	imull	%r15d, %r15d
	cmpl	%r15d, %r13d
	jae	.LBB1_24
# %bb.23:                               #   in Loop: Header=BB1_21 Depth=3
	movl	$.Linst_str.203, %edi
	callq	__log_inst@PLT
	movq	16(%rsp), %r13                  # 8-byte Reload
	movl	688(%rsp,%r13,4), %r14d
	movl	$.Linst_str.204, %edi
	callq	__log_inst@PLT
	movl	480(%rsp,%r13,4), %eax
	movl	%eax, 40(%rsp)                  # 4-byte Spill
	movl	$.Linst_str.205, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.206, %edi
	callq	__log_inst@PLT
	movl	692(%rsp,%rbx,4), %r15d
	movl	$.Linst_str.207, %edi
	callq	__log_inst@PLT
	movl	%r15d, 688(%rsp,%r13,4)
	movl	$.Linst_str.208, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.209, %edi
	callq	__log_inst@PLT
	movl	484(%rsp,%rbx,4), %r15d
	movl	$.Linst_str.210, %edi
	callq	__log_inst@PLT
	movl	%r15d, 480(%rsp,%r13,4)
	movl	$.Linst_str.211, %edi
	callq	__log_inst@PLT
	movl	%r14d, 692(%rsp,%rbx,4)
	movl	$.Linst_str.212, %edi
	callq	__log_inst@PLT
	movl	40(%rsp), %eax                  # 4-byte Reload
	movl	%eax, 484(%rsp,%rbx,4)
	movl	$.Linst_str.213, %edi
	callq	__log_inst@PLT
	xorl	%r14d, %r14d
	xorl	%r15d, %r15d
	testl	%ebp, %ebp
	setle	%r14b
	setg	%r15b
	movl	$.Linst_str.214, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.215, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.216, %edi
	callq	__log_inst@PLT
	movq	48(%rsp), %rax                  # 8-byte Reload
	leal	(%rax,%r15,4), %ebp
	addl	$-2, %ebp
	movl	$.Linst_str.217, %edi
	callq	__log_inst@PLT
	movl	%ebp, 272(%rsp,%r13,4)
	movl	$.Linst_str.218, %edi
	callq	__log_inst@PLT
	movl	276(%rsp,%rbx,4), %r15d
	movl	$.Linst_str.219, %edi
	callq	__log_inst@PLT
	leal	(%r15,%r14,4), %ebp
	addl	$-2, %ebp
	movl	$.Linst_str.220, %edi
	callq	__log_inst@PLT
	movl	%ebp, 276(%rsp,%rbx,4)
	movl	$.Linst_str.221, %edi
	callq	__log_inst@PLT
	xorl	%r14d, %r14d
	xorl	%r15d, %r15d
	testl	%r12d, %r12d
	setle	%r14b
	setg	%r15b
	movl	$.Linst_str.222, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.223, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.224, %edi
	callq	__log_inst@PLT
	movq	56(%rsp), %rax                  # 8-byte Reload
	leal	(%rax,%r15,4), %ebp
	addl	$-2, %ebp
	movl	$.Linst_str.225, %edi
	callq	__log_inst@PLT
	movl	%ebp, 64(%rsp,%r13,4)
	movl	$.Linst_str.226, %edi
	callq	__log_inst@PLT
	movl	68(%rsp,%rbx,4), %r15d
	movl	$.Linst_str.227, %edi
	callq	__log_inst@PLT
	leal	(%r15,%r14,4), %ebp
	addl	$-2, %ebp
	movl	$.Linst_str.228, %edi
	callq	__log_inst@PLT
	movl	%ebp, 68(%rsp,%rbx,4)
	movl	$.Linst_str.229, %edi
	callq	__log_inst@PLT
	jmp	.LBB1_24
	.p2align	4, 0x90
.LBB1_18:                               #   in Loop: Header=BB1_3 Depth=1
	movl	$.Linst_str.171, %edi
	callq	__log_inst@PLT
	movl	$50, (%rsp)
	leaq	1520(%rsp), %rdi
	leaq	1312(%rsp), %rsi
	leaq	1104(%rsp), %rdx
	leaq	272(%rsp), %rcx
	leaq	64(%rsp), %r8
	leaq	896(%rsp), %r9
	callq	sim@PLT
	movl	%eax, %ebx
	movl	$.Linst_str.172, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.173, %edi
	callq	__log_inst@PLT
	testl	%ebx, %ebx
	jne	.LBB1_25
# %bb.19:                               #   in Loop: Header=BB1_3 Depth=1
	xorl	%ebx, %ebx
	jmp	.LBB1_4
.LBB1_25:
	movl	$.Linst_str.233, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.234, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.235, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.236, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.237, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.238, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.239, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.240, %edi
	callq	__log_inst@PLT
	movl	$.Linst_str.241, %edi
	callq	__log_inst@PLT
	addq	$1720, %rsp                     # imm = 0x6B8
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	app, .Lfunc_end1-app
	.cfi_endproc
                                        # -- End function
	.type	.Linst_str,@object              # @inst_str
	.section	.rodata.str1.1,"aMS",@progbits,1
.Linst_str:
	.asciz	"  %3 = tail call i32 @rand() #4"
	.size	.Linst_str, 32

	.type	.Linst_str.1,@object            # @inst_str.1
.Linst_str.1:
	.asciz	"  %4 = sub i32 %1, %0"
	.size	.Linst_str.1, 22

	.type	.Linst_str.2,@object            # @inst_str.2
.Linst_str.2:
	.asciz	"  %5 = add i32 %4, 1"
	.size	.Linst_str.2, 21

	.type	.Linst_str.3,@object            # @inst_str.3
.Linst_str.3:
	.asciz	"  %6 = srem i32 %3, %5"
	.size	.Linst_str.3, 23

	.type	.Linst_str.4,@object            # @inst_str.4
.Linst_str.4:
	.asciz	"  %7 = add nsw i32 %6, %0"
	.size	.Linst_str.4, 26

	.type	.Linst_str.5,@object            # @inst_str.5
.Linst_str.5:
	.asciz	"  ret i32 %7"
	.size	.Linst_str.5, 13

	.type	.Linst_str.6,@object            # @inst_str.6
.Linst_str.6:
	.asciz	"  %1 = alloca [50 x i32], align 16"
	.size	.Linst_str.6, 35

	.type	.Linst_str.7,@object            # @inst_str.7
.Linst_str.7:
	.asciz	"  %2 = alloca [50 x i32], align 16"
	.size	.Linst_str.7, 35

	.type	.Linst_str.8,@object            # @inst_str.8
.Linst_str.8:
	.asciz	"  %3 = alloca [50 x i32], align 16"
	.size	.Linst_str.8, 35

	.type	.Linst_str.9,@object            # @inst_str.9
.Linst_str.9:
	.asciz	"  %4 = alloca [50 x i32], align 16"
	.size	.Linst_str.9, 35

	.type	.Linst_str.10,@object           # @inst_str.10
.Linst_str.10:
	.asciz	"  %5 = alloca [50 x i32], align 16"
	.size	.Linst_str.10, 35

	.type	.Linst_str.11,@object           # @inst_str.11
.Linst_str.11:
	.asciz	"  %6 = alloca [50 x i32], align 16"
	.size	.Linst_str.11, 35

	.type	.Linst_str.12,@object           # @inst_str.12
.Linst_str.12:
	.asciz	"  %7 = alloca [50 x i32], align 16"
	.size	.Linst_str.12, 35

	.type	.Linst_str.13,@object           # @inst_str.13
.Linst_str.13:
	.asciz	"  %8 = alloca [50 x i32], align 16"
	.size	.Linst_str.13, 35

	.type	.Linst_str.14,@object           # @inst_str.14
.Linst_str.14:
	.asciz	"  %9 = tail call i64 @time(ptr noundef null) #4"
	.size	.Linst_str.14, 48

	.type	.Linst_str.15,@object           # @inst_str.15
.Linst_str.15:
	.asciz	"  %10 = trunc i64 %9 to i32"
	.size	.Linst_str.15, 28

	.type	.Linst_str.16,@object           # @inst_str.16
.Linst_str.16:
	.asciz	"  tail call void @srand(i32 noundef %10) #4"
	.size	.Linst_str.16, 44

	.type	.Linst_str.17,@object           # @inst_str.17
.Linst_str.17:
	.asciz	"  call void @llvm.lifetime.start.p0(i64 200, ptr nonnull %1) #4"
	.size	.Linst_str.17, 64

	.type	.Linst_str.18,@object           # @inst_str.18
.Linst_str.18:
	.asciz	"  call void @llvm.lifetime.start.p0(i64 200, ptr nonnull %2) #4"
	.size	.Linst_str.18, 64

	.type	.Linst_str.19,@object           # @inst_str.19
.Linst_str.19:
	.asciz	"  call void @llvm.lifetime.start.p0(i64 200, ptr nonnull %3) #4"
	.size	.Linst_str.19, 64

	.type	.Linst_str.20,@object           # @inst_str.20
.Linst_str.20:
	.asciz	"  call void @llvm.lifetime.start.p0(i64 200, ptr nonnull %4) #4"
	.size	.Linst_str.20, 64

	.type	.Linst_str.21,@object           # @inst_str.21
.Linst_str.21:
	.asciz	"  call void @llvm.lifetime.start.p0(i64 200, ptr nonnull %5) #4"
	.size	.Linst_str.21, 64

	.type	.Linst_str.22,@object           # @inst_str.22
.Linst_str.22:
	.asciz	"  call void @llvm.lifetime.start.p0(i64 200, ptr nonnull %6) #4"
	.size	.Linst_str.22, 64

	.type	.Linst_str.23,@object           # @inst_str.23
.Linst_str.23:
	.asciz	"  call void @llvm.lifetime.start.p0(i64 200, ptr nonnull %7) #4"
	.size	.Linst_str.23, 64

	.type	.Linst_str.24,@object           # @inst_str.24
.Linst_str.24:
	.asciz	"  call void @llvm.lifetime.start.p0(i64 200, ptr nonnull %8) #4"
	.size	.Linst_str.24, 64

	.type	.Linst_str.25,@object           # @inst_str.25
.Linst_str.25:
	.asciz	"  br label %11"
	.size	.Linst_str.25, 15

	.type	.Linst_str.26,@object           # @inst_str.26
.Linst_str.26:
	.asciz	"  %13 = tail call i32 @rand() #4"
	.size	.Linst_str.26, 33

	.type	.Linst_str.27,@object           # @inst_str.27
.Linst_str.27:
	.asciz	"  %14 = srem i32 %13, 11"
	.size	.Linst_str.27, 25

	.type	.Linst_str.28,@object           # @inst_str.28
.Linst_str.28:
	.asciz	"  %15 = add nsw i32 %14, 5"
	.size	.Linst_str.28, 27

	.type	.Linst_str.29,@object           # @inst_str.29
.Linst_str.29:
	.asciz	"  %16 = getelementptr inbounds [50 x i32], ptr %5, i64 0, i64 %12"
	.size	.Linst_str.29, 66

	.type	.Linst_str.30,@object           # @inst_str.30
.Linst_str.30:
	.asciz	"  store i32 %15, ptr %16, align 4, !tbaa !4"
	.size	.Linst_str.30, 44

	.type	.Linst_str.31,@object           # @inst_str.31
.Linst_str.31:
	.asciz	"  %17 = tail call i32 @rand() #4"
	.size	.Linst_str.31, 33

	.type	.Linst_str.32,@object           # @inst_str.32
.Linst_str.32:
	.asciz	"  %18 = shl nsw i32 %14, 1"
	.size	.Linst_str.32, 27

	.type	.Linst_str.33,@object           # @inst_str.33
.Linst_str.33:
	.asciz	"  %19 = sub nsw i32 791, %18"
	.size	.Linst_str.33, 29

	.type	.Linst_str.34,@object           # @inst_str.34
.Linst_str.34:
	.asciz	"  %20 = srem i32 %17, %19"
	.size	.Linst_str.34, 26

	.type	.Linst_str.35,@object           # @inst_str.35
.Linst_str.35:
	.asciz	"  %21 = add nsw i32 %20, %15"
	.size	.Linst_str.35, 29

	.type	.Linst_str.36,@object           # @inst_str.36
.Linst_str.36:
	.asciz	"  %22 = getelementptr inbounds [50 x i32], ptr %1, i64 0, i64 %12"
	.size	.Linst_str.36, 66

	.type	.Linst_str.37,@object           # @inst_str.37
.Linst_str.37:
	.asciz	"  store i32 %21, ptr %22, align 4, !tbaa !4"
	.size	.Linst_str.37, 44

	.type	.Linst_str.38,@object           # @inst_str.38
.Linst_str.38:
	.asciz	"  %23 = tail call i32 @rand() #4"
	.size	.Linst_str.38, 33

	.type	.Linst_str.39,@object           # @inst_str.39
.Linst_str.39:
	.asciz	"  %24 = shl nsw i32 %15, 1"
	.size	.Linst_str.39, 27

	.type	.Linst_str.40,@object           # @inst_str.40
.Linst_str.40:
	.asciz	"  %25 = sub nsw i32 601, %24"
	.size	.Linst_str.40, 29

	.type	.Linst_str.41,@object           # @inst_str.41
.Linst_str.41:
	.asciz	"  %26 = srem i32 %23, %25"
	.size	.Linst_str.41, 26

	.type	.Linst_str.42,@object           # @inst_str.42
.Linst_str.42:
	.asciz	"  %27 = add nsw i32 %26, %15"
	.size	.Linst_str.42, 29

	.type	.Linst_str.43,@object           # @inst_str.43
.Linst_str.43:
	.asciz	"  %28 = getelementptr inbounds [50 x i32], ptr %2, i64 0, i64 %12"
	.size	.Linst_str.43, 66

	.type	.Linst_str.44,@object           # @inst_str.44
.Linst_str.44:
	.asciz	"  store i32 %27, ptr %28, align 4, !tbaa !4"
	.size	.Linst_str.44, 44

	.type	.Linst_str.45,@object           # @inst_str.45
.Linst_str.45:
	.asciz	"  %29 = tail call i32 @rand() #4"
	.size	.Linst_str.45, 33

	.type	.Linst_str.46,@object           # @inst_str.46
.Linst_str.46:
	.asciz	"  %30 = srem i32 %29, 6"
	.size	.Linst_str.46, 24

	.type	.Linst_str.47,@object           # @inst_str.47
.Linst_str.47:
	.asciz	"  %31 = add nsw i32 %30, 1"
	.size	.Linst_str.47, 27

	.type	.Linst_str.48,@object           # @inst_str.48
.Linst_str.48:
	.asciz	"  %32 = tail call i32 @rand() #4"
	.size	.Linst_str.48, 33

	.type	.Linst_str.49,@object           # @inst_str.49
.Linst_str.49:
	.asciz	"  %33 = and i32 %32, 1"
	.size	.Linst_str.49, 23

	.type	.Linst_str.50,@object           # @inst_str.50
.Linst_str.50:
	.asciz	"  %34 = icmp eq i32 %33, 0"
	.size	.Linst_str.50, 27

	.type	.Linst_str.51,@object           # @inst_str.51
.Linst_str.51:
	.asciz	"  %35 = xor i32 %30, -1"
	.size	.Linst_str.51, 24

	.type	.Linst_str.52,@object           # @inst_str.52
.Linst_str.52:
	.asciz	"  %36 = select i1 %34, i32 %35, i32 %31"
	.size	.Linst_str.52, 40

	.type	.Linst_str.53,@object           # @inst_str.53
.Linst_str.53:
	.asciz	"  %37 = getelementptr inbounds [50 x i32], ptr %3, i64 0, i64 %12"
	.size	.Linst_str.53, 66

	.type	.Linst_str.54,@object           # @inst_str.54
.Linst_str.54:
	.asciz	"  store i32 %36, ptr %37, align 4, !tbaa !4"
	.size	.Linst_str.54, 44

	.type	.Linst_str.55,@object           # @inst_str.55
.Linst_str.55:
	.asciz	"  %38 = tail call i32 @rand() #4"
	.size	.Linst_str.55, 33

	.type	.Linst_str.56,@object           # @inst_str.56
.Linst_str.56:
	.asciz	"  %39 = srem i32 %38, 6"
	.size	.Linst_str.56, 24

	.type	.Linst_str.57,@object           # @inst_str.57
.Linst_str.57:
	.asciz	"  %40 = add nsw i32 %39, 1"
	.size	.Linst_str.57, 27

	.type	.Linst_str.58,@object           # @inst_str.58
.Linst_str.58:
	.asciz	"  %41 = tail call i32 @rand() #4"
	.size	.Linst_str.58, 33

	.type	.Linst_str.59,@object           # @inst_str.59
.Linst_str.59:
	.asciz	"  %42 = and i32 %41, 1"
	.size	.Linst_str.59, 23

	.type	.Linst_str.60,@object           # @inst_str.60
.Linst_str.60:
	.asciz	"  %43 = icmp eq i32 %42, 0"
	.size	.Linst_str.60, 27

	.type	.Linst_str.61,@object           # @inst_str.61
.Linst_str.61:
	.asciz	"  %44 = xor i32 %39, -1"
	.size	.Linst_str.61, 24

	.type	.Linst_str.62,@object           # @inst_str.62
.Linst_str.62:
	.asciz	"  %45 = select i1 %43, i32 %44, i32 %40"
	.size	.Linst_str.62, 40

	.type	.Linst_str.63,@object           # @inst_str.63
.Linst_str.63:
	.asciz	"  %46 = getelementptr inbounds [50 x i32], ptr %4, i64 0, i64 %12"
	.size	.Linst_str.63, 66

	.type	.Linst_str.64,@object           # @inst_str.64
.Linst_str.64:
	.asciz	"  store i32 %45, ptr %46, align 4, !tbaa !4"
	.size	.Linst_str.64, 44

	.type	.Linst_str.65,@object           # @inst_str.65
.Linst_str.65:
	.asciz	"  %47 = tail call i32 @rand() #4"
	.size	.Linst_str.65, 33

	.type	.Linst_str.66,@object           # @inst_str.66
.Linst_str.66:
	.asciz	"  %48 = srem i32 %47, 206"
	.size	.Linst_str.66, 26

	.type	.Linst_str.67,@object           # @inst_str.67
.Linst_str.67:
	.asciz	"  %49 = add nsw i32 %48, 50"
	.size	.Linst_str.67, 28

	.type	.Linst_str.68,@object           # @inst_str.68
.Linst_str.68:
	.asciz	"  %50 = getelementptr inbounds [50 x i32], ptr %6, i64 0, i64 %12"
	.size	.Linst_str.68, 66

	.type	.Linst_str.69,@object           # @inst_str.69
.Linst_str.69:
	.asciz	"  store i32 %49, ptr %50, align 4, !tbaa !4"
	.size	.Linst_str.69, 44

	.type	.Linst_str.70,@object           # @inst_str.70
.Linst_str.70:
	.asciz	"  %51 = tail call i32 @rand() #4"
	.size	.Linst_str.70, 33

	.type	.Linst_str.71,@object           # @inst_str.71
.Linst_str.71:
	.asciz	"  %52 = srem i32 %51, 206"
	.size	.Linst_str.71, 26

	.type	.Linst_str.72,@object           # @inst_str.72
.Linst_str.72:
	.asciz	"  %53 = add nsw i32 %52, 50"
	.size	.Linst_str.72, 28

	.type	.Linst_str.73,@object           # @inst_str.73
.Linst_str.73:
	.asciz	"  %54 = getelementptr inbounds [50 x i32], ptr %7, i64 0, i64 %12"
	.size	.Linst_str.73, 66

	.type	.Linst_str.74,@object           # @inst_str.74
.Linst_str.74:
	.asciz	"  store i32 %53, ptr %54, align 4, !tbaa !4"
	.size	.Linst_str.74, 44

	.type	.Linst_str.75,@object           # @inst_str.75
.Linst_str.75:
	.asciz	"  %55 = tail call i32 @rand() #4"
	.size	.Linst_str.75, 33

	.type	.Linst_str.76,@object           # @inst_str.76
.Linst_str.76:
	.asciz	"  %56 = srem i32 %55, 206"
	.size	.Linst_str.76, 26

	.type	.Linst_str.77,@object           # @inst_str.77
.Linst_str.77:
	.asciz	"  %57 = add nsw i32 %56, 50"
	.size	.Linst_str.77, 28

	.type	.Linst_str.78,@object           # @inst_str.78
.Linst_str.78:
	.asciz	"  %58 = getelementptr inbounds [50 x i32], ptr %8, i64 0, i64 %12"
	.size	.Linst_str.78, 66

	.type	.Linst_str.79,@object           # @inst_str.79
.Linst_str.79:
	.asciz	"  store i32 %57, ptr %58, align 4, !tbaa !4"
	.size	.Linst_str.79, 44

	.type	.Linst_str.80,@object           # @inst_str.80
.Linst_str.80:
	.asciz	"  %59 = add nuw nsw i64 %12, 1"
	.size	.Linst_str.80, 31

	.type	.Linst_str.81,@object           # @inst_str.81
.Linst_str.81:
	.asciz	"  %60 = icmp eq i64 %59, 50"
	.size	.Linst_str.81, 28

	.type	.Linst_str.82,@object           # @inst_str.82
.Linst_str.82:
	.asciz	"  br i1 %60, label %61, label %11"
	.size	.Linst_str.82, 34

	.type	.Linst_str.83,@object           # @inst_str.83
.Linst_str.83:
	.asciz	"  %62 = getelementptr inbounds [50 x i32], ptr %3, i64 0, i64 48"
	.size	.Linst_str.83, 65

	.type	.Linst_str.84,@object           # @inst_str.84
.Linst_str.84:
	.asciz	"  %63 = getelementptr inbounds [50 x i32], ptr %1, i64 0, i64 48"
	.size	.Linst_str.84, 65

	.type	.Linst_str.85,@object           # @inst_str.85
.Linst_str.85:
	.asciz	"  %64 = getelementptr inbounds [50 x i32], ptr %4, i64 0, i64 48"
	.size	.Linst_str.85, 65

	.type	.Linst_str.86,@object           # @inst_str.86
.Linst_str.86:
	.asciz	"  %65 = getelementptr inbounds [50 x i32], ptr %2, i64 0, i64 48"
	.size	.Linst_str.86, 65

	.type	.Linst_str.87,@object           # @inst_str.87
.Linst_str.87:
	.asciz	"  %66 = getelementptr inbounds [50 x i32], ptr %3, i64 0, i64 49"
	.size	.Linst_str.87, 65

	.type	.Linst_str.88,@object           # @inst_str.88
.Linst_str.88:
	.asciz	"  %67 = getelementptr inbounds [50 x i32], ptr %1, i64 0, i64 49"
	.size	.Linst_str.88, 65

	.type	.Linst_str.89,@object           # @inst_str.89
.Linst_str.89:
	.asciz	"  %68 = getelementptr inbounds [50 x i32], ptr %4, i64 0, i64 49"
	.size	.Linst_str.89, 65

	.type	.Linst_str.90,@object           # @inst_str.90
.Linst_str.90:
	.asciz	"  %69 = getelementptr inbounds [50 x i32], ptr %2, i64 0, i64 49"
	.size	.Linst_str.90, 65

	.type	.Linst_str.91,@object           # @inst_str.91
.Linst_str.91:
	.asciz	"  br label %70"
	.size	.Linst_str.91, 15

	.type	.Linst_str.92,@object           # @inst_str.92
.Linst_str.92:
	.asciz	"  %72 = getelementptr inbounds [50 x i32], ptr %3, i64 0, i64 %71"
	.size	.Linst_str.92, 66

	.type	.Linst_str.93,@object           # @inst_str.93
.Linst_str.93:
	.asciz	"  %73 = load <4 x i32>, ptr %72, align 16, !tbaa !4"
	.size	.Linst_str.93, 52

	.type	.Linst_str.94,@object           # @inst_str.94
.Linst_str.94:
	.asciz	"  %74 = getelementptr inbounds [50 x i32], ptr %1, i64 0, i64 %71"
	.size	.Linst_str.94, 66

	.type	.Linst_str.95,@object           # @inst_str.95
.Linst_str.95:
	.asciz	"  %75 = load <4 x i32>, ptr %74, align 16, !tbaa !4"
	.size	.Linst_str.95, 52

	.type	.Linst_str.96,@object           # @inst_str.96
.Linst_str.96:
	.asciz	"  %76 = add nsw <4 x i32> %75, %73"
	.size	.Linst_str.96, 35

	.type	.Linst_str.97,@object           # @inst_str.97
.Linst_str.97:
	.asciz	"  store <4 x i32> %76, ptr %74, align 16, !tbaa !4"
	.size	.Linst_str.97, 51

	.type	.Linst_str.98,@object           # @inst_str.98
.Linst_str.98:
	.asciz	"  %77 = getelementptr inbounds [50 x i32], ptr %4, i64 0, i64 %71"
	.size	.Linst_str.98, 66

	.type	.Linst_str.99,@object           # @inst_str.99
.Linst_str.99:
	.asciz	"  %78 = load <4 x i32>, ptr %77, align 16, !tbaa !4"
	.size	.Linst_str.99, 52

	.type	.Linst_str.100,@object          # @inst_str.100
.Linst_str.100:
	.asciz	"  %79 = getelementptr inbounds [50 x i32], ptr %2, i64 0, i64 %71"
	.size	.Linst_str.100, 66

	.type	.Linst_str.101,@object          # @inst_str.101
.Linst_str.101:
	.asciz	"  %80 = load <4 x i32>, ptr %79, align 16, !tbaa !4"
	.size	.Linst_str.101, 52

	.type	.Linst_str.102,@object          # @inst_str.102
.Linst_str.102:
	.asciz	"  %81 = add nsw <4 x i32> %80, %78"
	.size	.Linst_str.102, 35

	.type	.Linst_str.103,@object          # @inst_str.103
.Linst_str.103:
	.asciz	"  store <4 x i32> %81, ptr %79, align 16, !tbaa !4"
	.size	.Linst_str.103, 51

	.type	.Linst_str.104,@object          # @inst_str.104
.Linst_str.104:
	.asciz	"  %82 = add nuw i64 %71, 4"
	.size	.Linst_str.104, 27

	.type	.Linst_str.105,@object          # @inst_str.105
.Linst_str.105:
	.asciz	"  %83 = icmp eq i64 %82, 48"
	.size	.Linst_str.105, 28

	.type	.Linst_str.106,@object          # @inst_str.106
.Linst_str.106:
	.asciz	"  br i1 %83, label %86, label %84"
	.size	.Linst_str.106, 34

	.type	.Linst_str.107,@object          # @inst_str.107
.Linst_str.107:
	.asciz	"  br label %70, !llvm.loop !8"
	.size	.Linst_str.107, 30

	.type	.Linst_str.108,@object          # @inst_str.108
.Linst_str.108:
	.asciz	"  %87 = load i32, ptr %62, align 16, !tbaa !4"
	.size	.Linst_str.108, 46

	.type	.Linst_str.109,@object          # @inst_str.109
.Linst_str.109:
	.asciz	"  %88 = load i32, ptr %63, align 16, !tbaa !4"
	.size	.Linst_str.109, 46

	.type	.Linst_str.110,@object          # @inst_str.110
.Linst_str.110:
	.asciz	"  %89 = add nsw i32 %88, %87"
	.size	.Linst_str.110, 29

	.type	.Linst_str.111,@object          # @inst_str.111
.Linst_str.111:
	.asciz	"  store i32 %89, ptr %63, align 16, !tbaa !4"
	.size	.Linst_str.111, 45

	.type	.Linst_str.112,@object          # @inst_str.112
.Linst_str.112:
	.asciz	"  %90 = load i32, ptr %64, align 16, !tbaa !4"
	.size	.Linst_str.112, 46

	.type	.Linst_str.113,@object          # @inst_str.113
.Linst_str.113:
	.asciz	"  %91 = load i32, ptr %65, align 16, !tbaa !4"
	.size	.Linst_str.113, 46

	.type	.Linst_str.114,@object          # @inst_str.114
.Linst_str.114:
	.asciz	"  %92 = add nsw i32 %91, %90"
	.size	.Linst_str.114, 29

	.type	.Linst_str.115,@object          # @inst_str.115
.Linst_str.115:
	.asciz	"  store i32 %92, ptr %65, align 16, !tbaa !4"
	.size	.Linst_str.115, 45

	.type	.Linst_str.116,@object          # @inst_str.116
.Linst_str.116:
	.asciz	"  %93 = load i32, ptr %66, align 4, !tbaa !4"
	.size	.Linst_str.116, 45

	.type	.Linst_str.117,@object          # @inst_str.117
.Linst_str.117:
	.asciz	"  %94 = load i32, ptr %67, align 4, !tbaa !4"
	.size	.Linst_str.117, 45

	.type	.Linst_str.118,@object          # @inst_str.118
.Linst_str.118:
	.asciz	"  %95 = add nsw i32 %94, %93"
	.size	.Linst_str.118, 29

	.type	.Linst_str.119,@object          # @inst_str.119
.Linst_str.119:
	.asciz	"  store i32 %95, ptr %67, align 4, !tbaa !4"
	.size	.Linst_str.119, 44

	.type	.Linst_str.120,@object          # @inst_str.120
.Linst_str.120:
	.asciz	"  %96 = load i32, ptr %68, align 4, !tbaa !4"
	.size	.Linst_str.120, 45

	.type	.Linst_str.121,@object          # @inst_str.121
.Linst_str.121:
	.asciz	"  %97 = load i32, ptr %69, align 4, !tbaa !4"
	.size	.Linst_str.121, 45

	.type	.Linst_str.122,@object          # @inst_str.122
.Linst_str.122:
	.asciz	"  %98 = add nsw i32 %97, %96"
	.size	.Linst_str.122, 29

	.type	.Linst_str.123,@object          # @inst_str.123
.Linst_str.123:
	.asciz	"  store i32 %98, ptr %69, align 4, !tbaa !4"
	.size	.Linst_str.123, 44

	.type	.Linst_str.124,@object          # @inst_str.124
.Linst_str.124:
	.asciz	"  br label %99"
	.size	.Linst_str.124, 15

	.type	.Linst_str.125,@object          # @inst_str.125
.Linst_str.125:
	.asciz	"  %101 = getelementptr inbounds [50 x i32], ptr %1, i64 0, i64 %100"
	.size	.Linst_str.125, 68

	.type	.Linst_str.126,@object          # @inst_str.126
.Linst_str.126:
	.asciz	"  %102 = load i32, ptr %101, align 4, !tbaa !4"
	.size	.Linst_str.126, 47

	.type	.Linst_str.127,@object          # @inst_str.127
.Linst_str.127:
	.asciz	"  %103 = getelementptr inbounds [50 x i32], ptr %5, i64 0, i64 %100"
	.size	.Linst_str.127, 68

	.type	.Linst_str.128,@object          # @inst_str.128
.Linst_str.128:
	.asciz	"  %104 = load i32, ptr %103, align 4, !tbaa !4"
	.size	.Linst_str.128, 47

	.type	.Linst_str.129,@object          # @inst_str.129
.Linst_str.129:
	.asciz	"  %105 = icmp slt i32 %102, %104"
	.size	.Linst_str.129, 33

	.type	.Linst_str.130,@object          # @inst_str.130
.Linst_str.130:
	.asciz	"  br i1 %105, label %106, label %110"
	.size	.Linst_str.130, 37

	.type	.Linst_str.131,@object          # @inst_str.131
.Linst_str.131:
	.asciz	"  store i32 %104, ptr %101, align 4, !tbaa !4"
	.size	.Linst_str.131, 46

	.type	.Linst_str.132,@object          # @inst_str.132
.Linst_str.132:
	.asciz	"  %107 = getelementptr inbounds [50 x i32], ptr %3, i64 0, i64 %100"
	.size	.Linst_str.132, 68

	.type	.Linst_str.133,@object          # @inst_str.133
.Linst_str.133:
	.asciz	"  %108 = load i32, ptr %107, align 4, !tbaa !4"
	.size	.Linst_str.133, 47

	.type	.Linst_str.134,@object          # @inst_str.134
.Linst_str.134:
	.asciz	"  %109 = sub nsw i32 0, %108"
	.size	.Linst_str.134, 29

	.type	.Linst_str.135,@object          # @inst_str.135
.Linst_str.135:
	.asciz	"  store i32 %109, ptr %107, align 4, !tbaa !4"
	.size	.Linst_str.135, 46

	.type	.Linst_str.136,@object          # @inst_str.136
.Linst_str.136:
	.asciz	"  br label %110"
	.size	.Linst_str.136, 16

	.type	.Linst_str.137,@object          # @inst_str.137
.Linst_str.137:
	.asciz	"  %112 = sub nsw i32 800, %104"
	.size	.Linst_str.137, 31

	.type	.Linst_str.138,@object          # @inst_str.138
.Linst_str.138:
	.asciz	"  %113 = icmp sgt i32 %111, %112"
	.size	.Linst_str.138, 33

	.type	.Linst_str.139,@object          # @inst_str.139
.Linst_str.139:
	.asciz	"  br i1 %113, label %114, label %118"
	.size	.Linst_str.139, 37

	.type	.Linst_str.140,@object          # @inst_str.140
.Linst_str.140:
	.asciz	"  store i32 %112, ptr %101, align 4, !tbaa !4"
	.size	.Linst_str.140, 46

	.type	.Linst_str.141,@object          # @inst_str.141
.Linst_str.141:
	.asciz	"  %115 = getelementptr inbounds [50 x i32], ptr %3, i64 0, i64 %100"
	.size	.Linst_str.141, 68

	.type	.Linst_str.142,@object          # @inst_str.142
.Linst_str.142:
	.asciz	"  %116 = load i32, ptr %115, align 4, !tbaa !4"
	.size	.Linst_str.142, 47

	.type	.Linst_str.143,@object          # @inst_str.143
.Linst_str.143:
	.asciz	"  %117 = sub nsw i32 0, %116"
	.size	.Linst_str.143, 29

	.type	.Linst_str.144,@object          # @inst_str.144
.Linst_str.144:
	.asciz	"  store i32 %117, ptr %115, align 4, !tbaa !4"
	.size	.Linst_str.144, 46

	.type	.Linst_str.145,@object          # @inst_str.145
.Linst_str.145:
	.asciz	"  br label %118"
	.size	.Linst_str.145, 16

	.type	.Linst_str.146,@object          # @inst_str.146
.Linst_str.146:
	.asciz	"  %119 = getelementptr inbounds [50 x i32], ptr %2, i64 0, i64 %100"
	.size	.Linst_str.146, 68

	.type	.Linst_str.147,@object          # @inst_str.147
.Linst_str.147:
	.asciz	"  %120 = load i32, ptr %119, align 4, !tbaa !4"
	.size	.Linst_str.147, 47

	.type	.Linst_str.148,@object          # @inst_str.148
.Linst_str.148:
	.asciz	"  %121 = icmp slt i32 %120, %104"
	.size	.Linst_str.148, 33

	.type	.Linst_str.149,@object          # @inst_str.149
.Linst_str.149:
	.asciz	"  br i1 %121, label %122, label %126"
	.size	.Linst_str.149, 37

	.type	.Linst_str.150,@object          # @inst_str.150
.Linst_str.150:
	.asciz	"  store i32 %104, ptr %119, align 4, !tbaa !4"
	.size	.Linst_str.150, 46

	.type	.Linst_str.151,@object          # @inst_str.151
.Linst_str.151:
	.asciz	"  %123 = getelementptr inbounds [50 x i32], ptr %4, i64 0, i64 %100"
	.size	.Linst_str.151, 68

	.type	.Linst_str.152,@object          # @inst_str.152
.Linst_str.152:
	.asciz	"  %124 = load i32, ptr %123, align 4, !tbaa !4"
	.size	.Linst_str.152, 47

	.type	.Linst_str.153,@object          # @inst_str.153
.Linst_str.153:
	.asciz	"  %125 = sub nsw i32 0, %124"
	.size	.Linst_str.153, 29

	.type	.Linst_str.154,@object          # @inst_str.154
.Linst_str.154:
	.asciz	"  store i32 %125, ptr %123, align 4, !tbaa !4"
	.size	.Linst_str.154, 46

	.type	.Linst_str.155,@object          # @inst_str.155
.Linst_str.155:
	.asciz	"  br label %126"
	.size	.Linst_str.155, 16

	.type	.Linst_str.156,@object          # @inst_str.156
.Linst_str.156:
	.asciz	"  %128 = sub nsw i32 600, %104"
	.size	.Linst_str.156, 31

	.type	.Linst_str.157,@object          # @inst_str.157
.Linst_str.157:
	.asciz	"  %129 = icmp sgt i32 %127, %128"
	.size	.Linst_str.157, 33

	.type	.Linst_str.158,@object          # @inst_str.158
.Linst_str.158:
	.asciz	"  br i1 %129, label %130, label %134"
	.size	.Linst_str.158, 37

	.type	.Linst_str.159,@object          # @inst_str.159
.Linst_str.159:
	.asciz	"  store i32 %128, ptr %119, align 4, !tbaa !4"
	.size	.Linst_str.159, 46

	.type	.Linst_str.160,@object          # @inst_str.160
.Linst_str.160:
	.asciz	"  %131 = getelementptr inbounds [50 x i32], ptr %4, i64 0, i64 %100"
	.size	.Linst_str.160, 68

	.type	.Linst_str.161,@object          # @inst_str.161
.Linst_str.161:
	.asciz	"  %132 = load i32, ptr %131, align 4, !tbaa !4"
	.size	.Linst_str.161, 47

	.type	.Linst_str.162,@object          # @inst_str.162
.Linst_str.162:
	.asciz	"  %133 = sub nsw i32 0, %132"
	.size	.Linst_str.162, 29

	.type	.Linst_str.163,@object          # @inst_str.163
.Linst_str.163:
	.asciz	"  store i32 %133, ptr %131, align 4, !tbaa !4"
	.size	.Linst_str.163, 46

	.type	.Linst_str.164,@object          # @inst_str.164
.Linst_str.164:
	.asciz	"  br label %134"
	.size	.Linst_str.164, 16

	.type	.Linst_str.165,@object          # @inst_str.165
.Linst_str.165:
	.asciz	"  %135 = add nuw nsw i64 %100, 1"
	.size	.Linst_str.165, 33

	.type	.Linst_str.166,@object          # @inst_str.166
.Linst_str.166:
	.asciz	"  %136 = icmp eq i64 %135, 50"
	.size	.Linst_str.166, 30

	.type	.Linst_str.167,@object          # @inst_str.167
.Linst_str.167:
	.asciz	"  br i1 %136, label %143, label %99"
	.size	.Linst_str.167, 36

	.type	.Linst_str.168,@object          # @inst_str.168
.Linst_str.168:
	.asciz	"  %138 = add nuw nsw i64 %145, 1"
	.size	.Linst_str.168, 33

	.type	.Linst_str.169,@object          # @inst_str.169
.Linst_str.169:
	.asciz	"  %139 = icmp eq i64 %146, 50"
	.size	.Linst_str.169, 30

	.type	.Linst_str.170,@object          # @inst_str.170
.Linst_str.170:
	.asciz	"  br i1 %139, label %140, label %143"
	.size	.Linst_str.170, 37

	.type	.Linst_str.171,@object          # @inst_str.171
.Linst_str.171:
	.asciz	"  %141 = call i32 @sim(ptr noundef nonnull %6, ptr noundef nonnull %7, ptr noundef nonnull %8, ptr noundef nonnull %1, ptr noundef nonnull %2, ptr noundef nonnull %5, i32 noundef 50) #4"
	.size	.Linst_str.171, 186

	.type	.Linst_str.172,@object          # @inst_str.172
.Linst_str.172:
	.asciz	"  %142 = icmp eq i32 %141, 0"
	.size	.Linst_str.172, 29

	.type	.Linst_str.173,@object          # @inst_str.173
.Linst_str.173:
	.asciz	"  br i1 %142, label %84, label %197"
	.size	.Linst_str.173, 36

	.type	.Linst_str.174,@object          # @inst_str.174
.Linst_str.174:
	.asciz	"  %146 = add nuw nsw i64 %144, 1"
	.size	.Linst_str.174, 33

	.type	.Linst_str.175,@object          # @inst_str.175
.Linst_str.175:
	.asciz	"  %147 = icmp ult i64 %144, 49"
	.size	.Linst_str.175, 31

	.type	.Linst_str.176,@object          # @inst_str.176
.Linst_str.176:
	.asciz	"  br i1 %147, label %148, label %137"
	.size	.Linst_str.176, 37

	.type	.Linst_str.177,@object          # @inst_str.177
.Linst_str.177:
	.asciz	"  %149 = getelementptr inbounds [50 x i32], ptr %1, i64 0, i64 %144"
	.size	.Linst_str.177, 68

	.type	.Linst_str.178,@object          # @inst_str.178
.Linst_str.178:
	.asciz	"  %150 = getelementptr inbounds [50 x i32], ptr %2, i64 0, i64 %144"
	.size	.Linst_str.178, 68

	.type	.Linst_str.179,@object          # @inst_str.179
.Linst_str.179:
	.asciz	"  %151 = getelementptr inbounds [50 x i32], ptr %5, i64 0, i64 %144"
	.size	.Linst_str.179, 68

	.type	.Linst_str.180,@object          # @inst_str.180
.Linst_str.180:
	.asciz	"  %152 = load i32, ptr %151, align 4, !tbaa !4"
	.size	.Linst_str.180, 47

	.type	.Linst_str.181,@object          # @inst_str.181
.Linst_str.181:
	.asciz	"  %153 = getelementptr inbounds [50 x i32], ptr %3, i64 0, i64 %144"
	.size	.Linst_str.181, 68

	.type	.Linst_str.182,@object          # @inst_str.182
.Linst_str.182:
	.asciz	"  %154 = getelementptr inbounds [50 x i32], ptr %4, i64 0, i64 %144"
	.size	.Linst_str.182, 68

	.type	.Linst_str.183,@object          # @inst_str.183
.Linst_str.183:
	.asciz	"  br label %155"
	.size	.Linst_str.183, 16

	.type	.Linst_str.184,@object          # @inst_str.184
.Linst_str.184:
	.asciz	"  %157 = load i32, ptr %149, align 4, !tbaa !4"
	.size	.Linst_str.184, 47

	.type	.Linst_str.185,@object          # @inst_str.185
.Linst_str.185:
	.asciz	"  %158 = getelementptr inbounds [50 x i32], ptr %1, i64 0, i64 %156"
	.size	.Linst_str.185, 68

	.type	.Linst_str.186,@object          # @inst_str.186
.Linst_str.186:
	.asciz	"  %159 = load i32, ptr %158, align 4, !tbaa !4"
	.size	.Linst_str.186, 47

	.type	.Linst_str.187,@object          # @inst_str.187
.Linst_str.187:
	.asciz	"  %160 = sub nsw i32 %157, %159"
	.size	.Linst_str.187, 32

	.type	.Linst_str.188,@object          # @inst_str.188
.Linst_str.188:
	.asciz	"  %161 = load i32, ptr %150, align 4, !tbaa !4"
	.size	.Linst_str.188, 47

	.type	.Linst_str.189,@object          # @inst_str.189
.Linst_str.189:
	.asciz	"  %162 = getelementptr inbounds [50 x i32], ptr %2, i64 0, i64 %156"
	.size	.Linst_str.189, 68

	.type	.Linst_str.190,@object          # @inst_str.190
.Linst_str.190:
	.asciz	"  %163 = load i32, ptr %162, align 4, !tbaa !4"
	.size	.Linst_str.190, 47

	.type	.Linst_str.191,@object          # @inst_str.191
.Linst_str.191:
	.asciz	"  %164 = sub nsw i32 %161, %163"
	.size	.Linst_str.191, 32

	.type	.Linst_str.192,@object          # @inst_str.192
.Linst_str.192:
	.asciz	"  %165 = mul nsw i32 %160, %160"
	.size	.Linst_str.192, 32

	.type	.Linst_str.193,@object          # @inst_str.193
.Linst_str.193:
	.asciz	"  %166 = mul nsw i32 %164, %164"
	.size	.Linst_str.193, 32

	.type	.Linst_str.194,@object          # @inst_str.194
.Linst_str.194:
	.asciz	"  %167 = add nuw nsw i32 %166, %165"
	.size	.Linst_str.194, 36

	.type	.Linst_str.195,@object          # @inst_str.195
.Linst_str.195:
	.asciz	"  %168 = getelementptr inbounds [50 x i32], ptr %5, i64 0, i64 %156"
	.size	.Linst_str.195, 68

	.type	.Linst_str.196,@object          # @inst_str.196
.Linst_str.196:
	.asciz	"  %169 = load i32, ptr %168, align 4, !tbaa !4"
	.size	.Linst_str.196, 47

	.type	.Linst_str.197,@object          # @inst_str.197
.Linst_str.197:
	.asciz	"  %170 = add nsw i32 %169, %152"
	.size	.Linst_str.197, 32

	.type	.Linst_str.198,@object          # @inst_str.198
.Linst_str.198:
	.asciz	"  %171 = mul nsw i32 %170, %170"
	.size	.Linst_str.198, 32

	.type	.Linst_str.199,@object          # @inst_str.199
.Linst_str.199:
	.asciz	"  %172 = icmp ult i32 %167, %171"
	.size	.Linst_str.199, 33

	.type	.Linst_str.200,@object          # @inst_str.200
.Linst_str.200:
	.asciz	"  %173 = icmp ne i32 %167, 0"
	.size	.Linst_str.200, 29

	.type	.Linst_str.201,@object          # @inst_str.201
.Linst_str.201:
	.asciz	"  %174 = and i1 %173, %172"
	.size	.Linst_str.201, 27

	.type	.Linst_str.202,@object          # @inst_str.202
.Linst_str.202:
	.asciz	"  br i1 %174, label %175, label %194"
	.size	.Linst_str.202, 37

	.type	.Linst_str.203,@object          # @inst_str.203
.Linst_str.203:
	.asciz	"  %176 = load i32, ptr %153, align 4, !tbaa !4"
	.size	.Linst_str.203, 47

	.type	.Linst_str.204,@object          # @inst_str.204
.Linst_str.204:
	.asciz	"  %177 = load i32, ptr %154, align 4, !tbaa !4"
	.size	.Linst_str.204, 47

	.type	.Linst_str.205,@object          # @inst_str.205
.Linst_str.205:
	.asciz	"  %178 = getelementptr inbounds [50 x i32], ptr %3, i64 0, i64 %156"
	.size	.Linst_str.205, 68

	.type	.Linst_str.206,@object          # @inst_str.206
.Linst_str.206:
	.asciz	"  %179 = load i32, ptr %178, align 4, !tbaa !4"
	.size	.Linst_str.206, 47

	.type	.Linst_str.207,@object          # @inst_str.207
.Linst_str.207:
	.asciz	"  store i32 %179, ptr %153, align 4, !tbaa !4"
	.size	.Linst_str.207, 46

	.type	.Linst_str.208,@object          # @inst_str.208
.Linst_str.208:
	.asciz	"  %180 = getelementptr inbounds [50 x i32], ptr %4, i64 0, i64 %156"
	.size	.Linst_str.208, 68

	.type	.Linst_str.209,@object          # @inst_str.209
.Linst_str.209:
	.asciz	"  %181 = load i32, ptr %180, align 4, !tbaa !4"
	.size	.Linst_str.209, 47

	.type	.Linst_str.210,@object          # @inst_str.210
.Linst_str.210:
	.asciz	"  store i32 %181, ptr %154, align 4, !tbaa !4"
	.size	.Linst_str.210, 46

	.type	.Linst_str.211,@object          # @inst_str.211
.Linst_str.211:
	.asciz	"  store i32 %176, ptr %178, align 4, !tbaa !4"
	.size	.Linst_str.211, 46

	.type	.Linst_str.212,@object          # @inst_str.212
.Linst_str.212:
	.asciz	"  store i32 %177, ptr %180, align 4, !tbaa !4"
	.size	.Linst_str.212, 46

	.type	.Linst_str.213,@object          # @inst_str.213
.Linst_str.213:
	.asciz	"  %182 = icmp sgt i32 %160, 0"
	.size	.Linst_str.213, 30

	.type	.Linst_str.214,@object          # @inst_str.214
.Linst_str.214:
	.asciz	"  %183 = select i1 %182, i32 2, i32 -2"
	.size	.Linst_str.214, 39

	.type	.Linst_str.215,@object          # @inst_str.215
.Linst_str.215:
	.asciz	"  %184 = select i1 %182, i32 -2, i32 2"
	.size	.Linst_str.215, 39

	.type	.Linst_str.216,@object          # @inst_str.216
.Linst_str.216:
	.asciz	"  %185 = add nsw i32 %157, %183"
	.size	.Linst_str.216, 32

	.type	.Linst_str.217,@object          # @inst_str.217
.Linst_str.217:
	.asciz	"  store i32 %185, ptr %149, align 4, !tbaa !4"
	.size	.Linst_str.217, 46

	.type	.Linst_str.218,@object          # @inst_str.218
.Linst_str.218:
	.asciz	"  %186 = load i32, ptr %158, align 4, !tbaa !4"
	.size	.Linst_str.218, 47

	.type	.Linst_str.219,@object          # @inst_str.219
.Linst_str.219:
	.asciz	"  %187 = add nsw i32 %186, %184"
	.size	.Linst_str.219, 32

	.type	.Linst_str.220,@object          # @inst_str.220
.Linst_str.220:
	.asciz	"  store i32 %187, ptr %158, align 4, !tbaa !4"
	.size	.Linst_str.220, 46

	.type	.Linst_str.221,@object          # @inst_str.221
.Linst_str.221:
	.asciz	"  %188 = icmp sgt i32 %164, 0"
	.size	.Linst_str.221, 30

	.type	.Linst_str.222,@object          # @inst_str.222
.Linst_str.222:
	.asciz	"  %189 = select i1 %188, i32 2, i32 -2"
	.size	.Linst_str.222, 39

	.type	.Linst_str.223,@object          # @inst_str.223
.Linst_str.223:
	.asciz	"  %190 = select i1 %188, i32 -2, i32 2"
	.size	.Linst_str.223, 39

	.type	.Linst_str.224,@object          # @inst_str.224
.Linst_str.224:
	.asciz	"  %191 = add nsw i32 %161, %189"
	.size	.Linst_str.224, 32

	.type	.Linst_str.225,@object          # @inst_str.225
.Linst_str.225:
	.asciz	"  store i32 %191, ptr %150, align 4, !tbaa !4"
	.size	.Linst_str.225, 46

	.type	.Linst_str.226,@object          # @inst_str.226
.Linst_str.226:
	.asciz	"  %192 = load i32, ptr %162, align 4, !tbaa !4"
	.size	.Linst_str.226, 47

	.type	.Linst_str.227,@object          # @inst_str.227
.Linst_str.227:
	.asciz	"  %193 = add nsw i32 %192, %190"
	.size	.Linst_str.227, 32

	.type	.Linst_str.228,@object          # @inst_str.228
.Linst_str.228:
	.asciz	"  store i32 %193, ptr %162, align 4, !tbaa !4"
	.size	.Linst_str.228, 46

	.type	.Linst_str.229,@object          # @inst_str.229
.Linst_str.229:
	.asciz	"  br label %194"
	.size	.Linst_str.229, 16

	.type	.Linst_str.230,@object          # @inst_str.230
.Linst_str.230:
	.asciz	"  %195 = add nuw nsw i64 %156, 1"
	.size	.Linst_str.230, 33

	.type	.Linst_str.231,@object          # @inst_str.231
.Linst_str.231:
	.asciz	"  %196 = icmp eq i64 %195, 50"
	.size	.Linst_str.231, 30

	.type	.Linst_str.232,@object          # @inst_str.232
.Linst_str.232:
	.asciz	"  br i1 %196, label %137, label %155"
	.size	.Linst_str.232, 37

	.type	.Linst_str.233,@object          # @inst_str.233
.Linst_str.233:
	.asciz	"  call void @llvm.lifetime.end.p0(i64 200, ptr nonnull %8) #4"
	.size	.Linst_str.233, 62

	.type	.Linst_str.234,@object          # @inst_str.234
.Linst_str.234:
	.asciz	"  call void @llvm.lifetime.end.p0(i64 200, ptr nonnull %7) #4"
	.size	.Linst_str.234, 62

	.type	.Linst_str.235,@object          # @inst_str.235
.Linst_str.235:
	.asciz	"  call void @llvm.lifetime.end.p0(i64 200, ptr nonnull %6) #4"
	.size	.Linst_str.235, 62

	.type	.Linst_str.236,@object          # @inst_str.236
.Linst_str.236:
	.asciz	"  call void @llvm.lifetime.end.p0(i64 200, ptr nonnull %5) #4"
	.size	.Linst_str.236, 62

	.type	.Linst_str.237,@object          # @inst_str.237
.Linst_str.237:
	.asciz	"  call void @llvm.lifetime.end.p0(i64 200, ptr nonnull %4) #4"
	.size	.Linst_str.237, 62

	.type	.Linst_str.238,@object          # @inst_str.238
.Linst_str.238:
	.asciz	"  call void @llvm.lifetime.end.p0(i64 200, ptr nonnull %3) #4"
	.size	.Linst_str.238, 62

	.type	.Linst_str.239,@object          # @inst_str.239
.Linst_str.239:
	.asciz	"  call void @llvm.lifetime.end.p0(i64 200, ptr nonnull %2) #4"
	.size	.Linst_str.239, 62

	.type	.Linst_str.240,@object          # @inst_str.240
.Linst_str.240:
	.asciz	"  call void @llvm.lifetime.end.p0(i64 200, ptr nonnull %1) #4"
	.size	.Linst_str.240, 62

	.type	.Linst_str.241,@object          # @inst_str.241
.Linst_str.241:
	.asciz	"  ret void"
	.size	.Linst_str.241, 11

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
