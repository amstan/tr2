#
# Makefile for STM32F4
#

# App Configuration ############################################################

BIN = app
OPT = 1
F_CPU = 42000000UL

# Compiler Configuration #######################################################

CFLAGS  = -g -std=c99 -mcpu=cortex-m4 -mthumb -mlittle-endian -mthumb-interwork
CFLAGS += -Wall -DF_CPU=$(F_CPU)
#CFLAGS += -mfloat-abi=hard -mfpu=fpv4-sp-d16

# Debugger Configuration #######################################################

OCD_PATH = /usr/share/openocd/scripts
OCD_SCRIPTS = board/stm32f4discovery.cfg
OCD_PRGM = stm32f4program.cfg

PROG_PATH = /dev/ttyUSB0

# Source Files #################################################################

LINKER = linker.ld
SRC_C = $(wildcard *.c)
SRC_H = $(wildcard *.h)
OBJ_C = $(patsubst %.c, %.o, $(SRC_C))
SRC_S = $(wildcard *.S)
OBJ_S = $(patsubst %.S, %.o, $(SRC_S))

# Build Targets ################################################################

all : $(BIN).elf

$(BIN).elf : $(OBJ_C) $(OBJ_S)
	arm-none-eabi-gcc -T $(LINKER) $^ -nostartfiles -o $(BIN).elf
	arm-none-eabi-objdump -DS $(BIN).elf > $(BIN).dasm
	arm-none-eabi-objcopy -O ihex $(BIN).elf $(BIN).hex

%.o : %.c
	arm-none-eabi-gcc $(CFLAGS) -O$(OPT) -c -nostartfiles $^ -o $@

%.o : %.S
	arm-none-eabi-gcc $(CFLAGS) -O$(OPT) -c -nostartfiles $^ -o $@

# Programming/Debugging ########################################################

program: all
	openocd -s $(OCD_PATH) -f $(OCD_SCRIPTS) -c "script $(OCD_PRGM)"

sprogram: all
	stm32flash -w $(BIN).hex -v -b 115200 -g 0x00 $(PROG_PATH)

debug:
	openocd -s $(OCD_PATH) -f $(OCD_SCRIPTS)

# Cleanup ######################################################################

clean :
	rm -f *.o
	rm -f $(BIN).*
	rm -f $(BIN).dasm
