.DATA             ;Create a near data segment.  Local variables are declared after
                  ;this directive
                  
.CODE             ;Indicates the start of a code segment.
                  
VirtualizerStart PROC
	
	push	rax
	push	rbx
	push	rcx 
	
	mov		eax, 11111111h
	mov		ebx, 22222222h
	mov		ecx, 33333333h
	add		ebx, eax
	add		ecx, eax
	
	pop		rcx
	pop		rbx
	pop		rax
	ret
	
VirtualizerStart ENDP

VirtualizerEnd PROC
	
	push	rax
	push	rbx
	push	rcx 
	
	mov		eax, 33333333h
	mov		ebx, 22222222h
	mov		ecx, 11111111h
	add		ebx, eax
	add		ecx, eax
	
	pop		rcx
	pop		rbx
	pop		rax
	ret
	
VirtualizerEnd ENDP

Virtualizer1Start PROC
	
	push	rax
	push	rbx
	push	rcx 
	
	mov		eax, 11111112h
	mov		ebx, 22222222h
	mov		ecx, 33333333h
	add		ebx, eax
	add		ecx, eax
	
	pop		rcx
	pop		rbx
	pop		rax
	ret
	
Virtualizer1Start ENDP

Virtualizer2Start PROC
	
	push	rax
	push	rbx
	push	rcx 
	
	mov		eax, 11111113h
	mov		ebx, 22222222h
	mov		ecx, 33333333h
	add		ebx, eax
	add		ecx, eax
	
	pop		rcx
	pop		rbx
	pop		rax
	ret
	
Virtualizer2Start ENDP

Virtualizer3Start PROC
	
	push	rax
	push	rbx
	push	rcx 
	
	mov		eax, 11111114h
	mov		ebx, 22222222h
	mov		ecx, 33333333h
	add		ebx, eax
	add		ecx, eax
	
	pop		rcx
	pop		rbx
	pop		rax
	ret
	
Virtualizer3Start ENDP

Virtualizer4Start PROC
	
	push	rax
	push	rbx
	push	rcx 
	
	mov		eax, 11111115h
	mov		ebx, 22222222h
	mov		ecx, 33333333h
	add		ebx, eax
	add		ecx, eax
	
	pop		rcx
	pop		rbx
	pop		rax
	ret
	
Virtualizer4Start ENDP

Virtualizer5Start PROC
	
	push	rax
	push	rbx
	push	rcx 
	
	mov		eax, 11111116h
	mov		ebx, 22222222h
	mov		ecx, 33333333h
	add		ebx, eax
	add		ecx, eax
	
	pop		rcx
	pop		rbx
	pop		rax
	ret
	
Virtualizer5Start ENDP

END 

