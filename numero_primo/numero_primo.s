.section .data
	entrada:
		.int 5
	
	primo:
		.ascii "Primo!\n"
	final_primo:
		.equ tamanho_primo, final_primo - primo
	
	nao_primo:
		.ascii "Nao Primo!\n"
	final_nao_primo:
		.equ tamanho_nao_primo, final_nao_primo - nao_primo
.section .text
	.globl _start
	_start:

	xor %rax, %rax
	xor %rbx, %rbx	
	xor %rcx, %rcx
	xor %rdx, %rdx
	xor %rdi, %rdi

	mov entrada, %eax
	mov $2, %ecx
	inc %edi
	call repeticao
	jmp fim			
	repeticao:
		push %rax	
		div %ecx
		cmp $0, %edx
		je incr		
		pop %rax
		xor %edx, %edx
		inc %ecx
		cmp entrada, %ecx	
		jle repeticao
		
	jmp verifica

	verifica:	
		cmp $2,%edi
		je f_primo
		jne f_nao_primo
	
	incr:
		inc %edi
		pop %rax
		inc %ecx
		cmp entrada, %ecx	
		jle repeticao
		jne verifica
    	f_primo:
	      movl $4, %eax
	      movl $1, %ebx
	      movl $primo, %ecx
	      movl $tamanho_primo, %edx
	      int $0x80
	      ret

    	f_nao_primo:
	      movl $4, %eax
	      movl $1, %ebx
	      movl $nao_primo, %ecx
	      movl $tamanho_nao_primo, %edx
	      int $0x80
	      ret
	
	fim:	
		mov $1, %rax
		mov $0, %rbx
		int $0x80
