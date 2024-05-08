%include "../include/io.mac"
section .data
	
section .text
	global checkers
	extern printf
	
checkers:
	;; DO NOT MODIFY
	push ebp
	mov ebp, esp
	pusha
	
	mov eax, [ebp + 8]           ; x
	mov ebx, [ebp + 12]          ; y
	mov ecx, [ebp + 16]          ; table
	
	;; DO NOT MODIFY
	;; FREESTYLE STARTS HERE
	
	mov esi, ecx
	mov ecx, eax
	
	cmp eax, 0
	je not_line_0
	
	;; find line of initial position
line:
	add esi, 8
	
	loop line
	
not_line_0:
	
	add esi, ebx                 ; initial position
	
line_before:
	
	cmp eax, 0
	je line_after
	
column_left_down:
	
	cmp ebx, 0
	je column_right_down
	
	mov edi, esi
	sub edi, 9                   ; prev line
	mov [edi], dword 1           ; complete position with 1
	
column_right_down:
	
	cmp ebx, 7
	je line_after
	
	mov edi, esi
	sub edi, 7                   ; prev line
	mov [edi], dword 1           ; complete position with 1
	
line_after:
	
	cmp eax, 7
	je end
	
column_left_up:
	
	cmp ebx, 0
	je column_right_up
	
	mov edi, esi
	add edi, 7                   ; next line
	mov [edi], dword 1           ; complete position with 1
	
column_right_up:
	
	cmp ebx, 7
	je end
	
	mov edi, esi
	add edi, 9                   ; next line
	mov [edi], dword 1           ; complete position with 1
end:
	
	;; FREESTYLE ENDS HERE
	;; DO NOT MODIFY
	popa
	leave
	ret
	;; DO NOT MODIFY
