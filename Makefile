
# Toolchain
CA65     := ca65
LD65     := ld65
BUILDXEN := buildxen       # change this if you don't wanna install buildxen

NAME     := game
TARGET   := $(NAME).xen

BINARIES := main.bin

MAIN_OBJECTS := build/main.obj

all: $(TARGET) # placed here so make doesn't run the wrong target


#you can change which objects are required for each binary here
main.bin: $(MAIN_OBJECTS)
	$(LD65) -v -o main.bin build/*.obj -C conf/xenon_disc.ld


clean:
	rm -rf build/* *.bin *.xen

build/%.obj: src/%.s
	$(CA65) --cpu 6502 --verbose $< -o $@

$(TARGET): $(BINARIES)
	buildxen -o $(TARGET) conf/buildxen.cfg