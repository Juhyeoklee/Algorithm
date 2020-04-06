/*
* Bottom Up
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

    for (int i = 3; i <= n; i++)
    {
        ans[i] = (ans[i - 1] + ans[i - 2]) % 10007;
    }

    printf("%d\n", ans[n]);

    return 0;
}
