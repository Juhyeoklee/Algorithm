/*
*   Bottom Up
*/

#include <stdio.h>

long long memo[91][2];

int main()
{
    int n;
    scanf("%d", &n);
    memo[0][0] = 0;
    memo[0][1] = 0;
    memo[1][0] = 0;
    memo[1][1] = 1;

    for (int i = 2; i <= n; i++)
    {
        memo[i][0] = memo[i - 1][0] + memo[i - 1][1];
        memo[i][1] = memo[i - 1][0];
    }

    printf("%lld\n", memo[n][0] + memo[n][1]);

    return 0;
}
