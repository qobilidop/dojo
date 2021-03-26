#include<stdio.h>

unsigned int counter = 0;

void increment(void) {
  counter++;
}

unsigned int retrieve(void) {
  return counter;
}

int main(void) {
  for (int i = 0; i < 5; i++) {
    increment();
  }
  printf("%d\n", retrieve());
  return 0;
}
