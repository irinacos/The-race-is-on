	%include "../include/io.mac"
	
	;;
	;; TODO: Declare 'avg' struct to match its C counterpart
	;;
	
struc avg
    .quo: resw 1
    .remain: resw 1
endstruc
	
struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc
	
	;; Hint: you can use these global arrays
section .data
	prio_result dd 0, 0, 0, 0, 0
	time_result dd 0, 0, 0, 0, 0
	
section .text
	global run_procs
	extern printf
	
run_procs:
	;; DO NOT MODIFY
	
	push ebp
	mov ebp, esp
	pusha
	
	xor ecx, ecx
	
clean_results:
	mov dword [time_result + 4 * ecx], dword 0
	mov dword [prio_result + 4 * ecx], 0
	
	inc ecx
	cmp ecx, 5
	jne clean_results
	
	mov ecx, [ebp + 8]           ; processes
	mov ebx, [ebp + 12]          ; length
	mov eax, [ebp + 16]          ; proc_avg
	;; DO NOT MODIFY
	
	;; Your code starts here
	
	mov edx, [ebp + 8]           ; processes
	xor ecx, ecx                 ; current index
	
loop:
	
	xor ebx, ebx
	mov bl, [edx + proc.prio]    ; process prio
	
	sub ebx, 1
	
	;; add 1 to prio_result
	add [prio_result + 4 * ebx], dword 1
	
	;; add time to time_result
	xor eax, eax
	mov al, [edx + proc.time]
	add [time_result + 4 * ebx], dword eax
	
	add edx, 5                   ; move index
	add ecx, 1
	cmp ecx, [ebp + 12]
	jl loop
	
	mov ecx, 0
	mov esi, [ebp + 16]          ; proc_avg
	
complete_proc_avg:
	
	xor eax, eax
	xor edx, edx
	
	mov edi, [prio_result + 4 * ecx]
	mov eax, [time_result + 4 * ecx]
	
	cmp edi, 0                   ; check if divisor is 0
	jle zero
	
	div edi
	
	;; complete avg
	
	mov [esi + avg.quo], ax
	mov [esi + avg.remain], dx
	
	jmp end
	
zero:
	
	;; if divisor is 0, complete with 0
	
	mov [esi + avg.quo], word 0
	mov [esi + avg.remain], word 0
	
end:
	
	add esi, 4
	
	add ecx, 1
	cmp ecx, 5
	jl complete_proc_avg
	
	;; Your code ends here
	
	;; DO NOT MODIFY
	popa
	leave
	ret
	;; DO NOT MODIFY
