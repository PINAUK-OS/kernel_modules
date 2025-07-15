[BITS 64]
global module_entry

section .data
align 8
module_header:
.magic:     db 'M', 'O', 'D', 'U'          ; 4-byte magic
.version:   dd 1                           ; 4-byte version
.entry:     dq module_entry                ; 8-byte entry point address
.reserved:  times 48 db 0                  ; 48-byte reserved space
module_header_end:

section .text
align 8

module_entry:
    cli
    hlt
    ret
