#include<stdio.h>

void func0(void) {
  printf("func0\n");
}

void func1(void) {
  printf("func1\n");
}

void func2(void) {
  printf("func1\n");
}

int main(void) {
  void (*fps[3])(void);
  fps[0] = func0;
  fps[1] = func1;
  fps[2] = func2;

  for (int i = 0; i < 3; i++) {
    (*fps[i])();
  }
  return 0;
}
