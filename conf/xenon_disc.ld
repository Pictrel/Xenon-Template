MEMORY {
	RAM:   start = $0000, size = $8000;
	RAM_P: start = $8000, size = $4000;
	VRAM:  start = $C000, size = $2000;
	
	IO:   start = $E000, size = $1000;
	BIOS: start = $F000, size = $1000;
}

SEGMENTS {
	CODE:     load = RAM_P, type = rw;
	DATA:     load = RAM_P, type = rw;
	
	ZEROPAGE: load = RAM,  start = $0000, type = bss, define = yes;
	STACK:    load = RAM,  start = $0100, type = bss, define = yes;
	BSS:      load = RAM,  start = $0200, type = bss, define = yes;
}