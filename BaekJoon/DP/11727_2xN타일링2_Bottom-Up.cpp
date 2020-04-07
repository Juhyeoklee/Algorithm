/*
* Boottom Up
*/

#include <stdio.h>

int memo[1001];
int main()
{
    int n;
    scanf("%d", &n);

    for (int i = 0; i <= n; i++)
    {
        memo[i] = -1;
    }
    memo[1] = 1;
    memo[2] = 3;

    for (int i = 3; i <= n; i++)
    {
        memo[i] = (memo[i - 1] + memo[i - 2] * 2) % 10007;
    }

    printf("%d\n", memo[n]);
    return 0;
}
