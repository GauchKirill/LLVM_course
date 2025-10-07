#include <stdio.h>
#include <string.h>

void __log_inst(const char* inst_str) {
  // Открываем файл для записи трассы
  FILE *f = fopen("trace.log", "a");
  if (f) {
    fprintf(f, "%s\n", inst_str);
    fclose(f);
  }
}
