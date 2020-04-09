/*
* Top Down
*/

#include <stdio.h>
#include <algorithm>

int p[1001];
int memo[1001];
int dp(int n);
int max(int n1, int n2)
{
    if (n1 > n2)
        return n1;
    else
        return n2;
}
int main()
{
    int n;
    scanf("%d", &n);

    for (int i = 1; i <= n; i++)
    {
        scanf("%d", &p[i]);
    }

    for (int i = 0; i <= n; i++)
    {
        memo[i] = -1;
    }

    memo[0] = 0;
    memo[1] = p[1];
    printf("%d\n", dp(n));

    for (int i = 0; i <= n; i++)
    {
        printf("%d ", memo[i]);
    }
    printf("\n");
    return 0;
}

int dp(int n)
{
    if (memo[n] >= 0)
    {
        return memo[n];
    }

    int maxPrice = 0;
    for (int i = 1; i <= n; i++)
    {
        maxPrice = max(maxPrice, p[i] + dp(n - i));
    }

    memo[n] = maxPrice;

    return memo[n];
}