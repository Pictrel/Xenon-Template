
# Toolchain
CA65     := ca65
LD65     := ld65
BUILDXEN := buildxen
BXCONFIG := conf/buildxen.cfg
LDSCRIPT := conf/xenon_disc.ld
INCLUDE  := include
HEADERS  := /usr/local/include/xenon/

# if you don't want to install xenon change:
# HEADERS  := <xenon source dir>/bios/
# BUILXEN  := <xenon source dir>/buildxen

NAME     := game
TARGET   := $(NAME).xen

BINARIES := main.bin


all: $(TARGET) # placed here so make doesn't run the wrong target


#you can change which objects are required for each binary here
MAIN_OBJECTS := build/main.obj
main.bin: $(MAIN_OBJECTS)
	$(LD65) -v -o main.bin build/*.obj -C $(LDSCRIPT)


clean:
	rm -rf build/* *.bin *.xen

build/%.obj: src/%.s
	$(CA65) --cpu 6502 --verbose $< -o $@ --include-dir $(INCLUDE) --include-dir $(HEADERS)

$(TARGET): $(BINARIES)
	$(BUILDXEN) -o $(TARGET) $(BXCONFIG)