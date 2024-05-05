;PARTS MISSING
;the random number generation
;invalid input detection
;"pause" at the end

section .data
	enter_msg 					DB 		"Enter Your Guess : ", 0
	enter_msg_len 				equ 	$- enter_msg
	invalid_input_msg 			DB 		"Invalid Input !!!", 0x0a, 0
	invalid_input_msg_len 		equ		$- invalid_input_msg
	input_out_of_range  		DB		"Input Out Of Range !!!", 0x0a, 0
	input_out_of_range_len  	equ		$- input_out_of_range
	too_high_msg 				DB 		"Your Guess Is Too High !!!", 0x0a, 0
	too_high_msg_len 			equ		$- too_high_msg
	too_low_msg 				DB 		"Your Guess Is Too Low !!!", 0x0a, 0
	too_low_msg_len 			equ 	$- too_low_msg
	win_msg_1					DB 		"You Won ! The Number Was ", 0
	win_msg_1_len				equ 	$- win_msg_1
	win_msg_2					DB 		" And You Guessed It In ", 0
	win_msg_2_len				equ 	$- win_msg_2
	win_msg_3					DB 		" Guesses !", 0x0a, 0
	win_msg_3_len				equ 	$- win_msg_3

	num 						equ 	64
	guesses						DB		0

	STRING_TERMINATOR 			equ 	0
	SYS_EXIT					equ 	1
	SUCCESS_EXIT_CODE			equ		0
	STDOUT						equ		4
	STDIN						equ		3
	SYS_WRITE					equ 	1
	SYS_READ					equ 	2

section .bss
	buffer						resb    10
	guess 						resb 	8
	guess_int					resb 	8
	guesses_str 				resb 	4
	num_str						resb	4

section .text
global _start

%macro print 2
	mov eax, STDOUT
	mov ebx, SYS_WRITE
	mov ecx, %1
	mov edx, %2
	int 0x80
%endmacro

%macro input 2
	mov eax, STDIN
	mov ebx, SYS_READ
	mov ecx, %1
	mov edx, %2
	int 0x80
%endmacro

%macro exit 0
	mov eax, SYS_EXIT
	mov ebx, SUCCESS_EXIT_CODE
	int 0x80
%endmacro

;Source for this part of the code goes to Michael from
;https://stackoverflow.com/a/19312503/19509963
string_to_int:
    xor ebx, ebx    ; clear ebx
.next_digit:
    movzx eax, byte[esi]
    inc esi
    sub al, '0'    ; convert from ASCII to number
    imul ebx, 10
    add ebx, eax   ; ebx = ebx*10 + eax
    loop .next_digit  ; while (--ecx)
    mov eax, ebx
    ret

int_to_string:
  	add esi,9
  	mov byte [esi],STRING_TERMINATOR
  	mov ebx,10         
.next_digit:
  	xor edx,edx         ; Clear edx prior to dividing edx:eax by ebx
 	div ebx             ; eax /= 10
 	add dl,'0'          ; Convert the remainder to ASCII 
 	dec esi             ; store characters in reverse order
  	mov [esi],dl
	test eax,eax            
 	jnz .next_digit     ; Repeat until eax==0
  	mov eax,esi
  	ret

;Main Frame
_start:
	;Printing the messages as usual
	print enter_msg, enter_msg_len
	input guess, 32	
    
	;Turning input into digits
    lea esi, [guess]
    mov ecx, 2
    call string_to_int

	;moving the numbers into registers for comparision
    mov [guess_int], eax
    mov ebx, num

	;comparing the registers
	cmp eax, ebx
	jl lower
	jg higher
	jz win

lower:
	print too_low_msg, too_low_msg_len
	;Incrementing Guesses
	mov eax, [guesses]
	inc eax
	mov [guesses], eax
	jmp _start

higher:
	print too_high_msg, too_high_msg_len
	;Incrementing Guesses
	mov eax, [guesses]
	inc eax
	mov [guesses], eax
	jmp _start

win:
	;Incrementing the guesses for the last time
	mov eax, [guesses]
	inc eax
	mov [guesses], eax

	;Printing the messages as usual
	print win_msg_1, win_msg_1_len

	mov eax, num
	lea esi, [buffer]
	call int_to_string
	mov [num_str], eax

	print [num_str], 2
	print win_msg_2, win_msg_2_len

	;Turning the guesses count into text
	mov eax, [guesses]
	lea esi, [buffer]
	call int_to_string
	mov [guesses_str], eax

	;Printing the messages as usual
	print [guesses_str], 2
	print win_msg_3, win_msg_3_len
	jmp end

end:
	exit
