#
# Makefile for STM32F4
#

# App Configuration ############################################################

BIN = app
OPT = 0
CFLAGS = -g

# Debugger Configuration #######################################################

OCD_PATH = /usr/share/openocd/scripts
#OCD_INTF = interface/stlink-v2.cfg
#OCD_TARGET = target/stm32f4x_stlink.cfg
OCD_SCRIPTS = board/stm32f4discovery.cfg

# Source Files #################################################################

LINKER = linker.ld
SRC_C = $(wildcard *.c)
OBJ_C = $(patsubst %.c, %.o, $(SRC_C))
SRC_S = $(wildcard *.S)
OBJ_S = $(patsubst %.S, %.o, $(SRC_S))

# Build Targets ################################################################

all : $(OBJ_C) $(OBJ_S)
	arm-none-eabi-gcc -T $(LINKER) $^ -nostartfiles -o $(BIN).elf
	arm-none-eabi-objdump -D $(BIN).elf > $(BIN).dasm
	arm-none-eabi-objcopy -O ihex $(BIN).elf $(BIN).hex

%.o : %.c
	arm-none-eabi-gcc $(CFLAGS) -O$(OPT) -c -nostartfiles $^ -o $@

%.o : %.S
	arm-none-eabi-gcc $(CFLAGS) -O$(OPT) -c -nostartfiles $^ -o $@

# Programming/Debugging ########################################################

debug:
	openocd -s $(OCD_PATH) -f $(OCD_SCRIPTS)

# Cleanup ######################################################################

clean :
	rm -f *.o
	rm -f $(BIN).*
	rm -f $(BIN).dasm
