OUTPUT_FORMAT(elf32-i386)

ENTRY(_start)

SECTIONS {
    . = 0x1000;  /* Load kernel code */

    .text : {
        *(.text)  /* Place all .text (code) sections here */
    }

    .data : {
        *(.data)  /* Place all .data (initialized data) sections here */
    }

    .bss : {
        *(.bss)  /* Place all .bss (uninitialized data) sections here */
    }

    /* Additional sections as needed for your kernel */
}
