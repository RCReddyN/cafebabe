global loader			; the entry symbol for ELF

MAGIC_NUMBER equ 0x1BADB002	; magic number
FLAGS equ 0x0			; multiboot flags
CHECKSUM equ -MAGIC_NUMBER	; magic number + flags + checksum = 0

section .text:			; start of code section
align 4				; code must be 4 byte aligned
	dd MAGIC_NUMBER		; write magic number, flags, and checksum to machine code
	dd FLAGS
	dd CHECKSUM

loader:				; loader label
	mov eax, 0xCAFEBABE	; place 0xCAFEBABE in eax register.

.loop:
	jmp .loop		; infinite loop

