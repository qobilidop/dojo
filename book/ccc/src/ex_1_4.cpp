#include <cstdio>

int sum(int x, int y) {
  return x + y;
}

int main() {
  int x = 2, y = 3;
  printf("The sum of %d and %d is %d.\n",
         x, y, sum(x, y));
}
