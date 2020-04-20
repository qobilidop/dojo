#include <cstdio>

int sum(int a, int b) {
    return a + b;
}

int main() {
    int a = 2, b = 3;
    printf("The sum of %d and %d is %d.\n",
           a, b, sum(a, b));
}
