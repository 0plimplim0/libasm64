#include "core.h"

int main() {
  // Allocate heap memory for 10 bytes
  uint8_t *buffer = (uint8_t*)malloc(10);
  if (!buffer) {
    error("Memory allocation failed", 1);
  }

  // Fill and copy memory
  memset(buffer, 0x41, 9); // 'A'
  buffer[9] = '\0';

  print("Allocated buffer contents: ");
  print((char*)buffer);
  print("\n");

  free(buffer);
  return 0;
}