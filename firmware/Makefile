#
# Makefile for STM32F4
#

# Configuration ################################################################

BIN = app
OPT = 0

# Source Files #################################################################

LINKER = linker.ld
SRC_C = $(wildcard *.c)
OBJ_C = $(patsubst %.c, %.o, $(SRC_C))
SRC_S = $(wildcard *.S)
OBJ_S = $(patsubst %.S, %.o, $(SRC_S))

# Build Targets ################################################################

all : $(OBJ_C) $(OBJ_S)
	arm-none-eabi-gcc -T $(LINKER) $^ -nostartfiles -o $(BIN).elf
	arm-none-eabi-objdump -D $(BIN).elf

%.o : %.c
	arm-none-eabi-gcc -O$(OPT) -c -nostartfiles $^ -o $@

%.o : %.S
	arm-none-eabi-gcc -O$(OPT) -c -nostartfiles $^ -o $@

# Cleanup ######################################################################

clean :
	rm -f *.o
	rm -f $(BIN).*
