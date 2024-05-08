%include "../include/io.mac"
	
	;; defining constants, you can use these as immediate values in your code
    LETTERS_COUNT EQU 26
	
section .data
	extern len_plain
	
section .text
	global rotate_x_positions
	global enigma
	extern printf
	
	; void rotate_x_positions(int x, int rotor, char config[10][26], int forward);
rotate_x_positions:
	;; DO NOT MODIFY
	push ebp
	mov ebp, esp
	pusha
	
	mov eax, [ebp + 8]           ; x
	mov ebx, [ebp + 12]          ; rotor
	mov ecx, [ebp + 16]          ; config (address of first element in matrix)
	mov edx, [ebp + 20]          ; forward
	;; DO NOT MODIFY
	;; TODO: Implement rotate_x_positions
	;; FREESTYLE STARTS HERE
	
	;; find address
	
	cmp [ebp + 8], dword 0
	je no_change
	
	mov edi, 0                   ; iteration number
	mov ebx, dword 2
	
iter:
	
	;; find address
	
	mov esi, [ebp + 16]
	mov ecx, [ebp + 12]          ; rotor
	
	cmp ecx, 0                   ; rotor 0
	je found_addr1
	
	add esi, 2 * LETTERS_COUNT   ; rotor 1
	cmp ecx, 1
	je found_addr1
	
	add esi, 2 * LETTERS_COUNT   ; rotor 2
	
found_addr1:
	
start:
	
	cmp ebx, dword 2
	jge first_row
	
	add esi, 26
	
first_row:
	
	;; shift letters x times
	
	mov ecx, LETTERS_COUNT
	sub ecx, 1
	
	mov edx, [ebp + 20]          ; forward
	cmp edx, 0
	jg fwd_1
	
fwd_0:                        ; shift letters to the left with 1 position
	
	xor edx, edx
	mov dl, [esi]                ; store first letter
	
parse_string_0:
	
	xor eax, eax
	mov al, [esi + 1]
	
	mov [esi], al                ; copy next letter
	
	add esi, 1
	
	loop parse_string_0
	
	mov [esi], dl                ; add last letter
	jmp final
	
fwd_1:                        ; shift letters to the right with 1 position
	
	add esi, 25
	
	xor edx, edx
	mov dl, [esi]                ; store last letter
parse_string_1:
	
	xor eax, eax
	mov al, [esi - 1]
	
	mov [esi], al                ; copy prev letter
	
	sub esi, 1
	
	loop parse_string_1
	
	mov [esi], dl                ; add first letter
	jmp final
	
final:
	
	add edi, 1
	cmp edi, [ebp + 8]
	jl iter
	
	mov edi, 0                   ; iteration number
	sub ebx, 1                   ; line 2
	cmp ebx, 0
	jg iter
	
no_change:
	
	;; FREESTYLE ENDS HERE
	;; DO NOT MODIFY
	popa
	leave
	ret
	;; DO NOT MODIFY
	
	; void enigma(char * plain, char key[3], char notches[3], char config[10][26], char * enc);
enigma:
	;; DO NOT MODIFY
	push ebp
	mov ebp, esp
	pusha
	
	mov eax, [ebp + 8]           ; plain (address of first element in string)
	mov ebx, [ebp + 12]          ; key
	mov ecx, [ebp + 16]          ; notches
	mov edx, [ebp + 20]          ; config (address of first element in matrix)
	mov edi, [ebp + 24]          ; enc
	;; DO NOT MODIFY
	;; TODO: Implement enigma
	;; FREESTYLE STARTS HERE
	
	xor edi, edi                 ; current posiion in string
	
start_enigma:
	
	; - - - - - - - - - - - - - - SHIFT ROTORS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	mov ebx, [ebp + 16]          ; notches
	add ebx, 2
	xor edx, edx
	mov dl, [ebx]                ; notch 3
	
	xor eax, eax
	mov ecx, [ebp + 12]          ; keys
	add ecx, 2
	mov al, [ecx]                ; key 3
	
	cmp dl, al
	jne shift_3
	
	mov ebx, [ebp + 16]          ; notches
	add ebx, 1
	xor edx, edx
	mov dl, [ebx]                ; notch 2
	
	xor eax, eax
	mov ecx, [ebp + 12]          ; keys
	add ecx, 1
	mov al, [ecx]                ; key 2
	
	cmp dl, al
	jne shift_2
	
	mov ebx, [ebp + 16]          ; notches
	xor edx, edx
	mov dl, [ebx]                ; notch 1
	
	xor eax, eax
	mov ecx, [ebp + 12]          ; keys
	mov al, [ecx]                ; key 1
	
	xor eax, eax
	mov ecx, [ebp + 12]          ; keys
	mov al, [ecx]                ; key 1
	add eax, 1
	
	cmp eax, 91                  ; check if letter is over Z
	jne not_Z1
	
	mov eax, 65
	
not_Z1:
	mov [ecx], al
	
	; shift rotor 1
	push dword 0
	push dword [ebp + 20]
	push dword 0
	push dword 1
	call rotate_x_positions
	add esp, 16
	
shift_2:
	
	xor eax, eax
	mov ecx, [ebp + 12]          ; keys
	add ecx, 1
	mov al, [ecx]                ; key 2
	add eax, 1
	
	cmp eax, 91                  ; check if letter is over Z
	jne not_Z2
	
	mov eax, 65
	
not_Z2:
	mov [ecx], al
	
	; shift rotor 2
	push dword 0
	push dword [ebp + 20]
	push dword 1
	push dword 1
	call rotate_x_positions
	add esp, 16
	
shift_3:
	
	xor eax, eax
	mov ecx, [ebp + 12]          ; keys
	add ecx, 2
	mov al, [ecx]                ; key 3
	add eax, 1
	
	cmp eax, 91                  ; check if letter is over Z
	jne not_Z3
	
	mov eax, 65
	
not_Z3:
	mov [ecx], al
	
	; shift rotor 3
	push dword 0
	push dword [ebp + 20]
	push dword 2
	push dword 1
	call rotate_x_positions
	add esp, 16
	
	; - - - - - - - - - - - - TRANSFORM LETTERS - - - - - - - - - - - - - - - - - - - 
	
	mov ecx, [ebp + 20]
	add ecx, 5 * LETTERS_COUNT   ; rotor 3, line 2
	
	mov esi, [ebp + 8]           ; plain
	add esi, edi
	xor edx, edx
	mov dl, [esi]                ; first letter plain
	
	xor eax, eax
	mov esi, [ebp + 20]
	add esi, 9 * LETTERS_COUNT   ; plugboard, line 2
	
find_letter_rotor3:
	
	mov al, [esi]
	
	cmp al, dl
	je found_letter_rotor3
	
	add esi, 1
	add ecx, 1
	jmp find_letter_rotor3
	
found_letter_rotor3:
	
	xor edx, edx
	mov dl, [ecx]
	
	mov ecx, [ebp + 20]
	add ecx, 3 * LETTERS_COUNT   ; rotor 2, line 2
	
	xor eax, eax
	mov esi, [ebp + 20]
	add esi, 4 * LETTERS_COUNT   ; rotor 3, line 1
	
find_letter_rotor2:
	
	mov al, [esi]
	
	cmp al, dl
	je found_letter_rotor2
	
	add esi, 1
	add ecx, 1
	jmp find_letter_rotor2
	
found_letter_rotor2:
	
	xor edx, edx
	mov dl, [ecx]
	
	mov ecx, [ebp + 20]
	add ecx, LETTERS_COUNT       ; rotor 1, line 2
	
	xor eax, eax
	mov esi, [ebp + 20]
	add esi, 2 * LETTERS_COUNT   ; rotor 2, line 1
	
find_letter_rotor1:
	
	mov al, [esi]
	
	cmp al, dl
	je found_letter_rotor1
	
	add esi, 1
	add ecx, 1
	jmp find_letter_rotor1
	
found_letter_rotor1:
	
	xor edx, edx
	mov dl, [ecx]
	
	mov ecx, [ebp + 20]
	add ecx, 7 * LETTERS_COUNT   ; reflector, line 2
	
	xor eax, eax
	mov esi, [ebp + 20]          ; rotor 1, line 1
	
find_letter_reflector:
	
	mov al, [esi]
	
	cmp al, dl
	je found_letter_reflector
	
	add esi, 1
	add ecx, 1
	jmp find_letter_reflector
	
found_letter_reflector:
	
	xor edx, edx
	mov dl, [ecx]
	
	mov ecx, [ebp + 20]          ; rotor 1, line 1
	
	xor eax, eax
	mov esi, [ebp + 20]
	add esi, 6 * LETTERS_COUNT   ; reflector, line 1
	
find_letter_reflector_mirror:
	
	mov al, [esi]
	
	cmp al, dl
	je found_letter_reflector_mirror
	
	add esi, 1
	add ecx, 1
	jmp find_letter_reflector_mirror
	
found_letter_reflector_mirror:
	
	xor edx, edx
	mov dl, [ecx]
	
	mov ecx, [ebp + 20]
	add ecx, 2 * LETTERS_COUNT   ; rotor 2, line 1
	
	xor eax, eax
	mov esi, [ebp + 20]
	add esi, LETTERS_COUNT       ; rotor 1, line 2
	
find_letter_rotor1_mirror:
	
	mov al, [esi]
	
	cmp al, dl
	je found_letter_rotor1_mirror
	
	add esi, 1
	add ecx, 1
	jmp find_letter_rotor1_mirror
	
found_letter_rotor1_mirror:
	
	xor edx, edx
	mov dl, [ecx]
	
	mov ecx, [ebp + 20]
	add ecx, 4 * LETTERS_COUNT   ; rotor 3, line 1
	
	xor eax, eax
	mov esi, [ebp + 20]
	add esi, 3 * LETTERS_COUNT   ; rotor 2, line 2
	
find_letter_rotor2_mirror:
	
	mov al, [esi]
	
	cmp al, dl
	je found_letter_rotor2_mirror
	
	add esi, 1
	add ecx, 1
	jmp find_letter_rotor2_mirror
	
found_letter_rotor2_mirror:
	
	xor edx, edx
	mov dl, [ecx]
	
	mov ecx, [ebp + 20]
	add ecx, 9 * LETTERS_COUNT   ; plugboard, line 2
	
	xor eax, eax
	mov esi, [ebp + 20]
	add esi, 5 * LETTERS_COUNT   ; rotor 3, line 2
	
find_letter_rotor3_mirror:
	
	mov al, [esi]
	
	cmp al, dl
	je found_letter_rotor3_mirror
	
	add esi, 1
	add ecx, 1
	jmp find_letter_rotor3_mirror
	
found_letter_rotor3_mirror:
	
	xor edx, edx
	mov dl, [ecx]
	
	mov esi, [ebp + 24]          ; enc
	add esi, edi
	mov [esi], dl                ; copy letter in enc
	
	
	add edi, 1
	cmp edi, [len_plain]
	jl start_enigma
	
	
	
	;; FREESTYLE ENDS HERE
	;; DO NOT MODIFY
	popa
	leave
	ret
	;; DO NOT MODIFY
