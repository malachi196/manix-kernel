[bits 16]		;real mode
[org 0x7c00]		;start program near BIOS

_start:
    cli
    
    xor ax, ax           ; Clear AX (set to 0)
    mov ss, ax           ; Stack segment
    mov sp, 0x7C00       ; Stack starts at the top of the bootloader
    mov ds, ax           ; Data segment  
    mov es, ax           ; Extra segment
    sti
    
    mov ah, 0x0E
    mov al, 'A'		;print A to tell file has loaded
    int 0x10
    
    mov al, '2'
    int 0x10
    
    mov ah, 0x02
    mov al, 1
    mov ch, 0
    mov dh, 0
    mov cl, 2
    mov dl, 0x80
    int 0x13
    jc disk_error
    
    mov ah, 0x0E
    mov al, 'B'
    int 0x10
    
    jmp 0x0000:0x1000	;attempt to open kernel

disk_error:
    mov ah, 0x0E
    mov al, 'E'
    int 0x10
    hlt

times 510-($-$$) db 0
dw 0xAA55
