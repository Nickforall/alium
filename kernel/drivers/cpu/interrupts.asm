; Defined in isr.c
[extern isr_handler]
[extern irq_handler]

; Common ISR code
isr_common:
    ; 1. Save CPU state
	pusha ; Pushes edi,esi,ebp,esp,ebx,edx,ecx,eax
	mov ax, ds ; Lower 16-bits of eax = ds.
	push eax ; save the data segment descriptor
	mov ax, 0x10  ; kernel data segment descriptor
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

    ; 2. Call C handler
	call isr_handler

    ; 3. Restore state
	pop eax
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	popa
	add esp, 8 ; Cleans up the pushed error code and pushed ISR number
	sti
	iret ; pops 5 things at once: CS, EIP, EFLAGS, SS, and ESP

; Common IRQ code. Identical to ISR code except for the 'call'
; and the 'pop ebx'
irq_common:
    pusha
    mov ax, ds
    push eax
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    call irq_handler ; Different than the ISR code
    pop ebx  ; Different than the ISR code
    mov ds, bx
    mov es, bx
    mov fs, bx
    mov gs, bx
    popa
    add esp, 8
    sti
    iret

; We don't get information about which interrupt was caller
; when the handler is run, so we will need to have a different handler
; for every interrupt.
; Furthermore, some interrupts push an error code onto the stack but others
; don't, so we will push a dummy error code for those which don't, so that
; we have a consistent stack for all of them.

; First make the ISRs global
global isr0
global isr1
global isr2
global isr3
global isr4
global isr5
global isr6
global isr7
global isr8
global isr9
global isr10
global isr11
global isr12
global isr13
global isr14
global isr15
global isr16
global isr17
global isr18
global isr19
global isr20
global isr21
global isr22
global isr23
global isr24
global isr25
global isr26
global isr27
global isr28
global isr29
global isr30
global isr31
; IRQs
global irq0
global irq1
global irq2
global irq3
global irq4
global irq5
global irq6
global irq7
global irq8
global irq9
global irq10
global irq11
global irq12
global irq13
global irq14
global irq15

; 0: Divide By Zero Exception
isr0:
    cli
    push byte 0
    push byte 0
    jmp isr_common

; 1: Debug Exception
isr1:
    cli
    push byte 0
    push byte 1
    jmp isr_common

; 2: Non Maskable Interrupt Exception
isr2:
    cli
    push byte 0
    push byte 2
    jmp isr_common

; 3: Int 3 Exception
isr3:
    cli
    push byte 0
    push byte 3
    jmp isr_common

; 4: INTO Exception
isr4:
    cli
    push byte 0
    push byte 4
    jmp isr_common

; 5: Out of Bounds Exception
isr5:
    cli
    push byte 0
    push byte 5
    jmp isr_common

; 6: Invalid Opcode Exception
isr6:
    cli
    push byte 0
    push byte 6
    jmp isr_common

; 7: Coprocessor Not Available Exception
isr7:
    cli
    push byte 0
    push byte 7
    jmp isr_common

; 8: Double Fault Exception - Gives error code
isr8:
    cli
    push byte 8
    jmp isr_common

; 9: Coprocessor Segment Overrun Exception
isr9:
    cli
    push byte 0
    push byte 9
    jmp isr_common

; 10: Bad TSS Exception - Gives error code
isr10:
    cli
    push byte 10
    jmp isr_common

; 11: Segment Not Present Exception - Gives error code
isr11:
    cli
    push byte 11
    jmp isr_common

; 12: Stack Fault Exception - Gives error code
isr12:
    cli
    push byte 12
    jmp isr_common

; 13: General Protection Fault Exception - Gives error code
isr13:
    cli
    push byte 13
    jmp isr_common

; 14: Page Fault Exception - Gives error code
isr14:
    cli
    push byte 14
    jmp isr_common

; 15: Reserved Exception
isr15:
    cli
    push byte 0
    push byte 15
    jmp isr_common

; 16: Floating Point Exception
isr16:
    cli
    push byte 0
    push byte 16
    jmp isr_common

; 17: Alignment Check Exception
isr17:
    cli
    push byte 0
    push byte 17
    jmp isr_common

; 18: Machine Check Exception
isr18:
    cli
    push byte 0
    push byte 18
    jmp isr_common

; 19: Reserved
isr19:
    cli
    push byte 0
    push byte 19
    jmp isr_common

; 20: Reserved
isr20:
    cli
    push byte 0
    push byte 20
    jmp isr_common

; 21: Reserved
isr21:
    cli
    push byte 0
    push byte 21
    jmp isr_common

; 22: Reserved
isr22:
    cli
    push byte 0
    push byte 22
    jmp isr_common

; 23: Reserved
isr23:
    cli
    push byte 0
    push byte 23
    jmp isr_common

; 24: Reserved
isr24:
    cli
    push byte 0
    push byte 24
    jmp isr_common

; 25: Reserved
isr25:
    cli
    push byte 0
    push byte 25
    jmp isr_common

; 26: Reserved
isr26:
    cli
    push byte 0
    push byte 26
    jmp isr_common

; 27: Reserved
isr27:
    cli
    push byte 0
    push byte 27
    jmp isr_common

; 28: Reserved
isr28:
    cli
    push byte 0
    push byte 28
    jmp isr_common

; 29: Reserved
isr29:
    cli
    push byte 0
    push byte 29
    jmp isr_common

; 30: Reserved
isr30:
    cli
    push byte 0
    push byte 30
    jmp isr_common

; 31: Reserved
isr31:
    cli
    push byte 0
    push byte 31
    jmp isr_common

; IRQ handlers
irq0:
	cli
	push byte 0
	push byte 32
	jmp irq_common

irq1:
	cli
	push byte 1
	push byte 33
	jmp irq_common

irq2:
	cli
	push byte 2
	push byte 34
	jmp irq_common

irq3:
	cli
	push byte 3
	push byte 35
	jmp irq_common

irq4:
	cli
	push byte 4
	push byte 36
	jmp irq_common

irq5:
	cli
	push byte 5
	push byte 37
	jmp irq_common

irq6:
	cli
	push byte 6
	push byte 38
	jmp irq_common

irq7:
	cli
	push byte 7
	push byte 39
	jmp irq_common

irq8:
	cli
	push byte 8
	push byte 40
	jmp irq_common

irq9:
	cli
	push byte 9
	push byte 41
	jmp irq_common

irq10:
	cli
	push byte 10
	push byte 42
	jmp irq_common

irq11:
	cli
	push byte 11
	push byte 43
	jmp irq_common

irq12:
	cli
	push byte 12
	push byte 44
	jmp irq_common

irq13:
	cli
	push byte 13
	push byte 45
	jmp irq_common

irq14:
	cli
	push byte 14
	push byte 46
	jmp irq_common

irq15:
	cli
	push byte 15
	push byte 47
	jmp irq_common
