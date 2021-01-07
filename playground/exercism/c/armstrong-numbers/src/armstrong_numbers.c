#include "armstrong_numbers.h"

int count_digits(int number)
{
    int n_digit = 1;
    while (number > 9) {
        number /= 10;
        n_digit++;
    }
    return n_digit;
}

int powi(int base, int exponent)
{
    int power = 1;
    for (int i = 0; i < exponent; i++) {
        power *= base;
    }
    return power;
}

int  armstrong_transform(int number)
{
    int transformed = 0;
    int n_digit = count_digits(number);
    while (number > 0) {
        int last_digit = number % 10;
        transformed += powi(last_digit, n_digit);
        number /= 10;
    }
    return transformed;
}

bool is_armstrong_number(int candidate)
{
    return candidate == armstrong_transform(candidate);
}
