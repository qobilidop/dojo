#include <cstdio>

enum Operation {
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
  Calculator calc{ Operation::Add };
  printf("1 + 2 = %d\n", calc.calculate(1, 2));
  calc.op = Operation::Subtract;
  printf("3 - 2 = %d\n", calc.calculate(3, 2));
  calc.op = Operation::Multiply;
  printf("2 * 3 = %d\n", calc.calculate(2, 3));
  calc.op = Operation::Divide;
  printf("6 / 3 = %d\n", calc.calculate(6, 3));
}
