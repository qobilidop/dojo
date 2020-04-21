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
        int c;
        switch (op) {
            case Operation::Add: {
                c = a + b;
            } break;
            case Operation::Subtract: {
                c = a - b;
            } break;
            case Operation::Multiply: {
                c = a * b;
            } break;
            case Operation::Divide: {
                c = a / b;
            } break;
            default: {
                printf("Error: unknown operator!");
            }
        }
        return c;
    }
};

int main() {
    Calculator calc{ Operation::Add };
    printf("1 + 2 = %d\n", calc.calculate(1, 2));
    calc.op = Operation::Subtract;
    printf("2 - 1 = %d\n", calc.calculate(2, 1));
}
