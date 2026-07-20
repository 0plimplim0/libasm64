AS      := as
AR      := ar
ARFLAGS := rcs

SRC_DIR := src/core
OBJ_DIR := obj

SRCS := $(shell find $(SRC_DIR) -name "*.s")

OBJS := $(patsubst $(SRC_DIR)/%.s, $(OBJ_DIR)/%.o, $(SRCS))

TARGET := libasm64.a

all: $(TARGET)

$(TARGET): $(OBJS)
	@$(AR) $(ARFLAGS) $@ $(OBJS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	@mkdir -p $(dir $@)
	@echo " [AS]  Compiling $<"
	@$(AS) $< -o $@

clean:
	@rm -rf $(OBJ_DIR)

fclean: clean
	@rm -f $(TARGET)

re: fclean all

.PHONY: all clean fclean re
