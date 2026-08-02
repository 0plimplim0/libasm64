#include "core.h"

int main() {
  IO_STREAM stream;
  char file_buf[256];

  // Open file for writing
  int status = fopen("test.txt", 0x41, &stream, file_buf, sizeof(file_buf), 0644);
  if (status < 0) {
    error("Could not open file", 1);
  }

  fwrite(&stream, "Writing stream test!\n", 21);
  fflush(&stream);
  fclose(&stream);

  print("File written successfully.\n");
  return 0;
}