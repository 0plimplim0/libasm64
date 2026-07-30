#include "core.h"

int main(int argc, char** argv) {
  if(argc < 2){error("Usage: ", 0);error(argv[0], 0);error(" <filename>\n", -1);} // Printf is not yet implemented
  char *file = malloc(4096);
  IO_STREAM f;
  void *fbuff = malloc(4096);
  if (!strcmp(argv[1], "--hello", 0)) {
    char *c = "-[------->+<]>-.-[->+++++<]>++.+++++++..+++.[->+++++<]>+.------------.---[->+++<]>.-[--->+<]>---.+++.------.--------.-[--->+<]>.[--->+<]>-.";
    if(fopen("hello.bf", 193, &f, fbuff, 4096, 420)) {
      free(file);
      free(fbuff);
      error("The example couldn't be created.\n", -2);
    }
    int l = strlen(c);
    if(fwrite(&f, c, l) <= 0) {
      free(file);
      (void)fclose(&f);
      free(fbuff);
      error("Error writing sample text.\n", -3);
    }
    (void)fclose(&f);
    memset(fbuff, 0, 4096);
    strcpy(file, "hello.bf");

  } else { strcpy(file, argv[1]); }
  if (fopen(file, 0, &f, fbuff, 4096, 0)) {
    free(fbuff);
    free(file);
    error("The file couldn't be opened.\n", -4);
  }
  void *tape = malloc(4096);
  int n = fread(&f, tape, 4096);
  if (n <= 0) {
    free(fbuff);
    free(tape);
    free(file);
    error("The file couldn't be read.\n", -5);
  }
  (void)fclose(&f);
  free(fbuff);
  free(file);
  uint8_t cells[30000] = {0};
  uint8_t *t = tape;
  uint8_t *cell = cells;
  int pc = 0;
  uint8_t carry = 0;
  while (pc < n) {
    switch(*t) {
      case '+':
        (*cell)++;
        break;
      case '-':
        (*cell)--;
        break;
      case '>':
        cell++;
        break;
      case '<':
        cell--;
        break;
      case '.':
        syscall(1, 1, cell, 1);
        break;
      case ',':
        syscall(0, 0, cell, 1);
        break;
      case '[':
        if (!*cell) {
          t++;
          pc++;
          carry++;
          while (carry>0) {
            if(*t == '['){carry++;}
            else if(*t == ']'){carry--;}
            if(carry>0){t++;pc++;}
          }
        }
        break;
      case ']':
        if(*cell) {
          carry++;
          t--;
          pc--;
          while (carry>0) {
            if(*t == ']'){carry++;}
            else if(*t == '['){carry--;}
            if(carry>0){t--;pc--;}
          }
        }
        break;
    }
    pc++;
    t++;
  }
  free(tape);
  return 0;
}