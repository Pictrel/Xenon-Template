MEMORY {
	RAM_RSV: start = $0000, size = $0400;
	RAM:     start = $0400, size = $7C00;
	
	VRAM:    start = $C000, size = $2000;
	
	IO:   start = $E000, size = $1000;
	BIOS: start = $F000, size = $1000;
}

SEGMENTS {
	CODE:     load = RAM, type = rw,  define = yes;
	DATA:     load = RAM, type = rw,  define = yes;
	BSS:      load = RAM, type = bss, define = yes;
	
	ZEROPAGE: load = RAM_RSV,  start = $0040, type = bss, define = yes;
	STACK:    load = RAM_RSV,  start = $0100, type = bss, define = yes;
}
