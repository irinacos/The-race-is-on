%include "../include/io.mac"
	
section .text
	global simple
	extern printf
	
simple:
	;; DO NOT MODIFY
	push ebp
	mov ebp, esp
	pusha
	
	mov ecx, [ebp + 8]           ; len
	mov esi, [ebp + 12]          ; plain
	mov edi, [ebp + 16]          ; enc_string
	mov edx, [ebp + 20]          ; step
	
	;; DO NOT MODIFY
	
	;; Your code starts here
	
label:
	
	xor eax, eax
	mov al, [esi + ecx - 1]      ; current character
	
	add eax, edx                 ; add step
	
	cmp eax, 90                  ; check if character is under 90
	jle not_over_90
	
	sub eax, 26
	
not_over_90:
	
	mov [edi + ecx - 1], al      ; copy in enc_string
	
	loop label
	
	
	;; Your code ends here
	
	;; DO NOT MODIFY
	
	popa
	leave
	ret
	
	;; DO NOT MODIFY
