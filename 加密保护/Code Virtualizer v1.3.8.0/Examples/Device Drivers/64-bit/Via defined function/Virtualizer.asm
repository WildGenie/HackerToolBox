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

END 

