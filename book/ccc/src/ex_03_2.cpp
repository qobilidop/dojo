// 3-2. Add a read_from and a write_to function to Listing 3-6. These functions should read or write to upper or lower as appropriate. Perform bounds checking to prevent buffer overflows.
#include <cstdio>
int main() {
  char lower[] = "abc?e";
  char upper[] = "ABC?E";
  char* upper_ptr = upper;

  lower[3] = 'd';
  upper_ptr[3] = 'D';

  char letter_d = lower[3];
  char letter_D = upper_ptr[3];

  printf("lower: %s\nupper: %s", lower, upper);

  lower[7] = 'g';
}
