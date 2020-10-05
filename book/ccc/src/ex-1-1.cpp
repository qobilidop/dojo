#include <cstdio>

int absolute_value(int x) {
  if (x > 0) {
    return x;
  } else {
    return -x;
  }
}

int main() {
  int x = -10;
  printf("The absolute value of %d is %d.\n",
         x, absolute_value(x));
}
