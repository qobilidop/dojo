#include <math.h>

#include "armstrong_numbers.h"

int transform(int candidate)
{
    int transformed = 0;
    int n_digit = ceil(log10(candidate));
    while (candidate > 0) {
        int last_digit = candidate % 10;
        transformed += pow(last_digit, n_digit);
        candidate /= 10;
    }
    return transformed;
}

bool is_armstrong_number(int candidate)
{
    return candidate == transform(candidate);
}
