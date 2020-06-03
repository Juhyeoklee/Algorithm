#include <stdio.h>

int gcd(int a, int b)
{
    while (b != 0)
    {
        int tmp = a % b;
        a = b;
        b = tmp;
    }

    return a;
}
int lcm(int a, int b)
{
    int g = gcd(a, b);

    int ans = g * (a / g) * (b / g);

    return ans;
}
int main()
{
    int a, b;
    scanf("%d %d", &a, &b);

    printf("%d\n", gcd(a, b));
    printf("%d\n", lcm(a, b));
    return 0;
}