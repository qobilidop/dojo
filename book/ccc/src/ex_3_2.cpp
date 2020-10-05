#include <cstdio>
#include <cstring>

bool validate_index(const char* chars, size_t i) {
  if (i >= std::strlen(chars)) {
    printf("Index out of bound.\n");
    return false;
  }
  return true;
}

char read_from(const char* chars, size_t i) {
  if (!validate_index(chars, i)) {
    return 0;
  }
  return chars[i];
}

void write_to(char* chars, size_t i, char c) {
  if (!validate_index(chars, i)) {
    return;
  }
  chars[i] = c;
}

int main() {
  char lower[]{ "abc?e" };
  char upper[]{ "ABC?E" };
  char* upper_ptr{ upper };

  write_to(lower, 3, 'd');
  write_to(upper_ptr, 3, 'D');

  read_from(lower, 3);
  read_from(upper_ptr, 3);

  printf("lower: %s\nupper: %s\n", lower, upper);

  write_to(lower, 7, 'g');
}
