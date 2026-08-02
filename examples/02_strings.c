#include "core.h"

int main() {
  char text[64] = "Hello, Assembly Runtime!";
  char num_buf[32] = {0};

  // String length & uppercase
  uint32_t len = strlen(text);
  toupper(text);
  
  print(text);
  print("\nLength: ");
  
  uitoa64(len, num_buf);
  print(num_buf);
  print("\n");

  return 0;
}