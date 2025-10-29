#include <stdio.h>

// Declare the assembly function
int factorial(int n);

int main() {
    int n;
    printf("Enter a positive integer: ");
    scanf("%d", &n);

    int result = factorial(n);
    printf("Factorial of %d = %d\n", n, result);

    return 0;
}
