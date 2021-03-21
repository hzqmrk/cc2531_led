
all:
	sdcc -I /usr/local/share/sdcc/include/mcs51/ led.c
	packihx led.ihx > led.hex

clean:
	rm -f *.lst
	rm -f *.map
	rm -f *.rel
	rm -f *.rst
	rm -f *.mem
	rm -f *.sym
	rm -f *.lk
	rm -f *.ihx
	rm -f *.asm

