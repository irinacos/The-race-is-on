%include "../include/io.mac"
	
struc proc
	.pid: resw 1
	.prio: resb 1
	.time: resw 1
endstruc
	
section .text
	global sort_procs
	extern printf
	
sort_procs:
	;; DO NOT MODIFY
	enter 0, 0
	pusha
	
	mov edx, [ebp + 8]           ; processes
	mov eax, [ebp + 12]          ; length
	;; DO NOT MODIFY
	
	;; Your code starts here
	
start:
	
	mov edx, [ebp + 8]           ; processes
	mov esi, 0                   ; changes to 1 if there is a switch
	mov ecx, 1
	
label:
	
	;; check prio
	
	xor ebx, ebx
	xor eax, eax
	
	mov al, [edx + proc.prio]
	mov bl, [edx + 5 + proc.prio]
	
	cmp eax, ebx
	jl good_order
	jg change
	
	;; check time
	
	xor ebx, ebx
	xor eax, eax
	
	mov ax, [edx + proc.time]
	mov bx, [edx + 5 + proc.time]
	
	cmp eax, ebx
	jl good_order
	jg change
	
	;; check pid
	
	xor ebx, ebx
	xor eax, eax
	
	mov ax, [edx + proc.pid]
	mov bx, [edx + 5 + proc.pid]
	
	cmp eax, ebx
	jl good_order
	jg change
	
change:
	
	mov esi, 1
	
	; switch prios ;
	xor ebx, ebx
	xor eax, eax
	
	mov al, [edx + proc.prio]
	mov bl, [edx + 5 + proc.prio]
	
	mov [edx + proc.prio], bl
	mov [edx + 5 + proc.prio], al
	
	; switch times ;
	xor ebx, ebx
	xor eax, eax
	
	mov ax, [edx + proc.time]
	mov bx, [edx + 5 + proc.time]
	
	mov [edx + proc.time], bx
	mov [edx + 5 + proc.time], ax
	
	; switch pids ;
	xor ebx, ebx
	xor eax, eax
	
	mov ax, [edx + proc.pid]
	mov bx, [edx + 5 + proc.pid]
	
	mov [edx + proc.pid], bx
	mov [edx + 5 + proc.pid], ax
	
good_order:
	
	add ecx, 1
	add edx, 5
	
	cmp ecx, [ebp + 12]
	jl label
	
	cmp esi, 1                   ;; there was a switch
	jge start
	
	
	
	;; Your code ends here
	
	;; DO NOT MODIFY
	popa
	leave
	ret
	;; DO NOT MODIFY
