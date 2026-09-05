TARGET     = SampleKlcTest
CC         = gcc

include .config


config:
	@read -p "Enable DEBUG? [y/n]: " debug; \
	echo "CONFIG_DEBUG=$$debug" > .config; \
	read -p "Enable ADD? [y/n]: " add; \
	echo "CONFIG_ADD=$$add" >> .config; \
	read -p "Enable SUB? [y/n]: " sub; \
	echo "CONFIG_SUB=$$sub" >> .config


SRC        = $(wildcard *.c)

GCC_FLAGS  = -c


ifeq ($(CONFIG_DEBUG),y)
GCC_FLAGS += -g
endif

ifeq ($(CONFIG_ADD),n)
SRC := $(filter-out add.c,$(SRC))
endif

ifeq ($(CONFIG_SUB),n)
SRC := $(filter-out sub.c,$(SRC))
endif


OBJ := $(patsubst %.c,%.o,$(SRC))


all: $(TARGET)


$(TARGET): $(OBJ)
	@echo "TARGET = $@"
	@echo "ALL DEPENDENCIES = $^"
	@echo "FIRST DEPENDENCY = $<"
	$(CC) $^ -o $@


%.o: %.c .config
	$(CC) $(GCC_FLAGS) $<


print:
	@echo "SRC          = $(SRC)"
	@echo "OBJ          = $(OBJ)"
	@echo "GCC_FLAGS    = $(GCC_FLAGS)"
	@echo "CONFIG_DEBUG = $(CONFIG_DEBUG)"
	@echo "CONFIG_ADD   = $(CONFIG_ADD)"
	@echo "CONFIG_SUB   = $(CONFIG_SUB)"


clean:
	rm -f *.o $(TARGET)


install:
	cp $(TARGET) /bin/


uninstall:
	rm -f /bin/$(TARGET)
	










#CC       = arm-linux-gnueabihf-gcc
#CFLAGS   = -O2 -Wall
#CPPFLAGS = -Iinclude
#LDFLAGS  = -Llib
#LDLIBS   = -lpthread

vSRC = $(wildcard *.c)
#OBJ = $(patsubst %.c,%.o,$(SRC))

#include .config

#vifeq ($(CONFIG_DEBUG),y)
#CFLAGS += -g
#endif

#$(TARGET): $(OBJ)
#	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@
