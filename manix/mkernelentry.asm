[bits 32]
[section .text]

extern _kernelstart

global _start

_start:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x8000   ; safe stack
    sti

    call _kernelstart ; C kernel main function

    hlt  ; halt if kernel stops

times 512 - ($ - $$) db 0  ; padding
