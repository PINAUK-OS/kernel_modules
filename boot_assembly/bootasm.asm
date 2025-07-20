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
    ; Set up empty/invalid IDT to guarantee #GP fault when exception occurs
    xor rax, rax
    lidt [rax]           ; Load IDT from address 0x00000000 (invalid descriptor)

    ; Trigger an exception (e.g., division by zero)
    xor rax, rax
    div rax              ; Divide by zero => #DE

    ; If the system survived (it shouldn't), halt
    cli
    hlt
    ret