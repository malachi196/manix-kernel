[bits 16]		;real mode
[org 0x7c00]		;start program near BIOS

mov [BOOT_DRIVE], dl

_start:
    cli
    
    xor ax, ax           ; Clear AX (set to 0)
    mov ss, ax           ; Stack segment
    mov ds, ax           ; Data segment  
    mov es, ax           ; Extra segment
    mov sp, 0x8000
    sti
    
    mov ah, 0x0E
    mov al, 'A'		; print A to tell file has loaded
    int 0x10
    
    mov al, '2'
    int 0x10
    
    mov ax, 0x1000  ; target segment 0x1000
    mov es, ax
    xor bx, bx
    mov ah, 0x02   ; BIOS read sectors
    mov al, 1    ; number of sectors to read
    mov ch, 0    ; cylinder 0
    mov dh, 0    ; head 0
    mov cl, 2    ; sector 2
    mov dl, [BOOT_DRIVE]
    int 0x13      ; initialize sector stuff via BIOS interrupt
    jc disk_error  ; on carry: fail
    
    mov ah, 0x0E 
    mov al, 'B'
    int 0x10   ;print "B" on kernel load
    
    jmp 0x1000:0x0000	;attempt to open kernel

disk_error:
    mov ah, 0x0E
    mov al, 'E'     ; 'E' prints if file fails
    int 0x10
    hlt

BOOT_DRIVE db 0

times 510-($-$$) db 0
dw 0xAA55
