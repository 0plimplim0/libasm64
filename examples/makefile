CC      = gcc
CFLAGS   := -Wall -Wextra -O2 \
            -ffreestanding \
            -fno-builtin \
            -nostdinc \
            -nostdlib \
            -fno-stack-protector \
            -I../bindings/c/include \
            -I../bindings/c/include/core \
            -I../bindings/c/include/core/private
LIB     = ../libasm64.a

SRCS    = $(wildcard *.c)
BINS    = $(SRCS:.c=)

.PHONY: all clean build_lib

all: build_lib
ifdef n
	@NUM=$$(echo $(n) | sed 's/^0*//'); \
	FILE=$$(ls $(n)_*.c 2>/dev/null || ls 0$${NUM}_*.c 2>/dev/null || ls $${NUM}_*.c 2>/dev/null); \
	if [ -z "$$FILE" ]; then \
		echo "Error: No test found with the prefix '$(n)'"; \
		exit 1; \
	fi; \
	OUT=$${FILE%.c}; \
	$(CC) $(CFLAGS) $$FILE $(LIB) -o $$OUT
else
	@for src in $(SRCS); do \
		out=$${src%.c}; \
		$(CC) $(CFLAGS) $$src $(LIB) -o $$out || exit 1; \
	done
endif

build_lib:
	@$(MAKE) -s -C .. c

clean:
	@rm -f $(BINS)