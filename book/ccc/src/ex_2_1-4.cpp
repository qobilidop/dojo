#include <cstdio>

enum class Operation {
  Add,
  Subtract,
  Multiply,
  Divide
};

struct Calculator {
  Operation op;

  Calculator(Operation op) {
    this->op = op;
  }

  int calculate(int a, int b) {
    int result;
    switch (op) {
      case Operation::Add: {
        result = a + b;
      } break;
      case Operation::Subtract: {
        result = a - b;
      } break;
      case Operation::Multiply: {
        result = a * b;
      } break;
      case Operation::Divide: {
        result = a / b;
      } break;
      default: {
        printf("Error: unknown operator!");
      }
    }
    return result;
  }
};

int main() {
  Calculator calc1{ Operation::Add };
  printf("1 + 2 = %d\n", calc1.calculate(1, 2));

  Calculator calc2 = { Operation::Subtract };
  printf("3 - 2 = %d\n", calc2.calculate(3, 2));

  Calculator calc3(Operation::Multiply);
  printf("2 * 3 = %d\n", calc3.calculate(2, 3));

  Calculator calc4 = Calculator(Operation::Divide);
  printf("6 / 3 = %d\n", calc4.calculate(6, 3));
}
