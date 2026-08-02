#include "core.h"

int main() {
  // Create a 64-bit array with initial capacity of 4
  Q_ARRAY *arr = qarr_new(4, NULL);
  if (!arr) {
    return 1;
  }

  // Push values
  qarr_push(arr, 100);
  qarr_push(arr, 200);
  qarr_push(arr, 300);

  // Reverse elements in-place
  qarr_reverse(arr);

  // Get last element
  uint64_t val = qarr_get(arr, 0); // Should be 300
  char buf[32];
  uitoa64(val, buf);

  print("First element after reverse: ");
  print(buf);
  print("\n");

  qarr_free(arr);
  return 0;
}