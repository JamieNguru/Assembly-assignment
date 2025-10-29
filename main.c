#include <stdio.h>

long factorial(long n); // Assembly function declaration (64-bit uses long)

int main(void) {
    long n;       // use 'long' for 64-bit argument passing
    long result;

    printf("Enter a positive integer: ");
    if (scanf("%ld", &n) != 1) {
        printf("Invalid input.\n");
        return 1;
    }

    if (n < 0) {
        printf("Error! Factorial of a negative number doesn't exist.\n");
        return 1;
    }

    result = factorial(n);

    printf("Factorial of %ld = %ld\n", n, result);
    return 0;
}

