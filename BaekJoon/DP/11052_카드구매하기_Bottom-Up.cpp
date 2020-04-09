/*
* Bottom Up
*/

#include <stdio.h>
#include <algorithm>

int p[1001];
int memo[1001];

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

    for (int i = 2; i <= n; i++)
    {
        int maxNum = 0;
        for (int j = i; j > 0; j--)
        {
            maxNum = max(maxNum, p[j] + memo[i - j]);
        }

        memo[i] = maxNum;
    }
    printf("%d\n", memo[n]);

    return 0;
}
