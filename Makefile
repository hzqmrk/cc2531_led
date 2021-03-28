################################################################
#                                                              #
# MAKEFILE for the 8051 micro-controller                       #
# Generates a hex file which can be downloaded using cc-tool   #
# to the CC2532 micro-controller.                              #
#                                                              #
# Memory Model: SMALL                                          #
#                                                              #
# Author: Pete Stephens                                        #
#                                                              #
################################################################


###############
# Definitions #
###############

TARGET = led
SRC    = led
REL    = $(TARGET).rel
LIB    = 
H      = 

# COMMANDS
CC     = sdcc
PACK   = packihx
PROG   = cc-tool

# OPTIONS
COPT   = -c --debug
MEM    = --model-small
PROPT  = -v -e

##############
# Link Rules #
##############

# Convert to a hex file
$(TARGET).hex: $(TARGET).ihx
	$(PACK) $(TARGET).ihx > $(TARGET).hex

# Link rule
$(TARGET).ihx: $(REL) $(LIB)
	$(CC) -L$(BIN) $(MEM) $(REL) $(LIB)

#################
# Compile Rules #
#################

$(REL): $(SRC).c $(H)
	$(CC) $(COPT) $(MEM) -I$(BIN) -o$(REL) $(SRC).c

all: clean $(TARGET).hex

flash: $(TARGET).hex
	$(PROG) $(PROPT) -w $(TARGET).hex

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
	rm -f *.cdb
	rm -f *.adb

