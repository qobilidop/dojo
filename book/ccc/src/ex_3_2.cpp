#include <cstdio>
#include <iterator>

char read_from(char* chars, size_t l, size_t i) {
  if (i >= l) {
    printf("Index out of bound.\n");
    return 0;
  }
  char c = chars[i];
  return c;
}

void write_to(char* chars, size_t l, size_t i, char c) {
  if (i >= l) {
    printf("Index out of bound.\n");
    return;
  }
  chars[i] = c;
}

int main() {
  char lower[]{ "abc?e" };
  char upper[]{ "ABC?E" };
  char* upper_ptr{ upper };
  size_t l_lower{ std::size(lower) };
  size_t l_upper{ std::size(upper) };

  write_to(lower, l_lower, 3, 'd');
  write_to(upper_ptr, l_upper, 3, 'D');

  read_from(lower, l_lower, 3);
  read_from(upper_ptr, l_upper, 3);

  printf("lower: %s\nupper: %s\n", lower, upper);

  write_to(lower, l_lower, 7, 'g');
}
