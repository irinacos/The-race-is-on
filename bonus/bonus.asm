	%include "../include/io.mac"
	section .data
	
	section .text
	global bonus
	extern printf
	
bonus:
	;; DO NOT MODIFY
	push ebp
	mov ebp, esp
	pusha
	
	mov eax, [ebp + 8]           ; x
	mov ebx, [ebp + 12]          ; y
	mov ecx, [ebp + 16]          ; board
	
	;; DO NOT MODIFY
	;; FREESTYLE STARTS HERE
	
	mov ebx, 0
	mov edx, 0
	
	; - - - - - - - - - - - - left 1 position - - - - - - - - - - - - - - - - - 
left:
	
	mov ecx, [ebp + 12]          ; y
	
	cmp ecx, 0
	je right
	
	mov ebx, 1
	sub ecx, 1
	
	cmp ecx, 0
	je right
	
shifting1:
	shl ebx, 1
	
	loop shifting1
	; - - - - - - - - - - - - right 1 position - - - - - - - - - - - - - - - - 
right:
	
	mov ecx, [ebp + 12]          ; y
	
	cmp ecx, 7
	je start
	
	mov edx, 1
	add ecx, 1
	
shifting2:
	shl edx, 1
	
	loop shifting2
	
start:
	
	or ebx, edx
	
	; - - - - - - - - - - - - - - line 0 - - - - - - - - - - - - - - - - - - 
	
	
	mov esi, [ebp + 16]          ; board
	
	cmp [ebp + 8], dword 0       ; check if x is 0
	jg bigger_than_0
	
	add esi, 4
	
	shl ebx, 8
	mov [esi], ebx               ; copy number to board
	
	jmp end
	
	; - - - - - - - - - - - - - - line 1 - - - - - - - - - - - - - - - - - - 
bigger_than_0:
	
	cmp [ebp + 8], dword 1       ; check if x is 1
	jg bigger_than_1
	
	add esi, 4
	
	mov edx, ebx
	
	shl ebx, 16
	or ebx, edx
	
	mov [esi], ebx               ; copy number to board
	jmp end
	
	; - - - - - - - - - - - - - - line 2 - - - - - - - - - - - - - - - - - - 
bigger_than_1:
	
	cmp [ebp + 8], dword 2       ; check if x is 2
	jg bigger_than_2
	
	add esi, 4
	
	mov edx, ebx
	shl edx, 8
	shl ebx, 24
	or ebx, edx
	
	mov [esi], ebx               ; copy number to board
	jmp end
	
	; - - - - - - - - - - - - - - line 3 - - - - - - - - - - - - - - - - - - 
bigger_than_2:
	
	cmp [ebp + 8], dword 3       ; check if x is 3
	jg bigger_than_3
	
	add esi, 4
	
	mov edx, ebx
	shl edx, 16
	mov [esi], edx               ; copy number to board
	
	sub esi, 4
	mov [esi], ebx               ; copy number to board
	
	jmp end
	
	; - - - - - - - - - - - - - - line 4 - - - - - - - - - - - - - - - - - - 
bigger_than_3:
	
	cmp [ebp + 8], dword 4       ; check if x is 4
	jg bigger_than_4
	
	add esi, 4
	mov edx, ebx
	shl edx, 24
	mov [esi], edx               ; copy number to board
	
	sub esi, 4
	shl ebx, 8
	mov[esi], ebx                ; copy number to board
	
	jmp end
	
	; - - - - - - - - - - - - - - line 5 - - - - - - - - - - - - - - - - - - 
bigger_than_4:
	
	cmp [ebp + 8], dword 5       ; check if x is 5
	jg bigger_than_5
	
	mov edx, ebx
	shl ebx, 16
	or ebx, edx
	
	mov [esi], ebx               ; copy number to board
	
	jmp end
	
	; - - - - - - - - - - - - - - line 6 - - - - - - - - - - - - - - - - - - 
bigger_than_5:
	
	cmp [ebp + 8], dword 6       ; check if x is 6
	jg bigger_than_6
	
	mov edx, ebx
	shl edx, 8
	shl ebx, 24
	or ebx, edx
	
	mov [esi], ebx               ; copy number to board
	
	jmp end
	
	; - - - - - - - - - - - - - - line 7 - - - - - - - - - - - - - - - - - - 
bigger_than_6:
	
	shl ebx, 16
	mov [esi], ebx               ; copy number to board
	
end:
	
	
	;; FREESTYLE ENDS HERE
	;; DO NOT MODIFY
	popa
	leave
	ret
	;; DO NOT MODIFY
