.include "xc.inc"

.text                       ;BP (put the following data in ROM(program memory))

; This is a library, thus it can *not* contain a _main function: the C file will
; define main().  However, we will need a .global statement to make available ASM
; functions to C code.
; All functions utilized outside of this file will need to have a leading 
; underscore (_) and be included in a comment delimited list below.
.global _delay_1ms,  _delay_1us
    
    _delay_1ms:	   ;16000 cycles*62.5ns = 1000000ns = 1ms
		   ;2 cycles
    repeat #15993  ;1 cycle
    nop		   ;15994 cycles      
    return	   ;3 cycles
    
    _delay_1us:
    
    repeat #10
    nop
    return



