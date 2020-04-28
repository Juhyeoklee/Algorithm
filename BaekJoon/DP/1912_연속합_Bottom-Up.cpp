/*
*   Bottom Up
*/

#include <stdio.h>

int memo[100001];
int iArr[100001];

int main()
{
    int n;
    scanf("%d", &n);

    for (int i = 1; i <= n; i++)
    {
        scanf("%d", &iArr[i]);
    }
    memo[1] = iArr[1];

    for (int i = 2; i <= n; i++)
    {
        if (memo[i - 1] + iArr[i] > iArr[i])
        {
            memo[i] = memo[i - 1] + iArr[i];
        }
        else
        {
            memo[i] = iArr[i];
        }
    }

    int max = memo[1];
    for (int i = 2; i <= n; i++)
    {
        if (max < memo[i])
        {
            max = memo[i];
        }
    }

    printf("%d\n", max);

    return 0;
}
