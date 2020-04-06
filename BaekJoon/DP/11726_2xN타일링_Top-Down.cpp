/*
* Top Down
*/

#include <stdio.h>

int ans[1001];
size_t dp(int n);

int main()
{
    int n;
    scanf("%d", &n);

    for (int i = 0; i <= n; i++)
    {
        ans[i] = -1;
    }
    ans[1] = 1;
    ans[2] = 2;

    printf("%lu\n", dp(n));

    return 0;
}

size_t dp(int n)
{
    if (ans[n] > 0)
    {
        return ans[n];
    }

    ans[n] = (dp(n - 2) + dp(n - 1)) % 10007;

    return ans[n];
}