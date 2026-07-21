AS      := as
CC      := gcc
AR      := ar
ARFLAGS := rcs

SRC_DIR := src/core
OBJ_DIR := obj

C_BIND_DIR    := bindings/c/src/core
C_INCLUDE_DIR := bindings/c/include

CFLAGS   := -Wall -Wextra -O2 \
            -ffreestanding \
            -fno-builtin \
            -nostdinc \
            -nostdlib \
            -fno-stack-protector \
            -I$(C_INCLUDE_DIR) \
            -I$(C_INCLUDE_DIR)/core

SRCS := $(shell find $(SRC_DIR) -name "*.s")
OBJS := $(patsubst $(SRC_DIR)/%.s, $(OBJ_DIR)/asm/%.o, $(SRCS))

C_SRCS := $(shell find $(C_BIND_DIR) -name "*.c")
C_OBJS := $(patsubst $(C_BIND_DIR)/%.c, $(OBJ_DIR)/c/%.o, $(C_SRCS))

TARGET := libasm64.a

all: $(TARGET)

c: $(TARGET) $(C_OBJS)
	$(AR) $(ARFLAGS) $(TARGET) $(C_OBJS)

$(TARGET): $(OBJS)
	$(AR) $(ARFLAGS) $@ $(OBJS)

$(OBJ_DIR)/asm/%.o: $(SRC_DIR)/%.s
	@mkdir -p $(dir $@)
	$(AS) $< -o $@

$(OBJ_DIR)/c/%.o: $(C_BIND_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

dist: c
	@mkdir -p dist/include
	@cp $(TARGET) dist/
	@cp -r $(C_INCLUDE_DIR)/* dist/include/
	@cp makefile.template dist/Makefile

clean:
	@rm -rf $(OBJ_DIR)

fclean: clean
	@rm -f $(TARGET)
	@rm -rf dist

re: fclean all

.PHONY: all clean fclean re c dist
