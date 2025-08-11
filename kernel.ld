
OUTPUT_ARCH(riscv)
ENTRY(kernel_entry)
SECTIONS {
  . = 0x80200000;

  .text : ALIGN(4) {
    KEEP(*(.text.boot))      
    *(.text .text.*)
  }

  .rodata : ALIGN(8) {
    *(.rodata .rodata.*)
  }

  .data : ALIGN(8) {
    *(.data .data.*)
  }

  .bss : ALIGN(16) {
    __bss = .;
    *(.bss .bss.*)
    __bss_end = .;
  }
  
  . = ALIGN(16);
  . += 128 * 1024;          
  __stack_top = .;
  
  
}

