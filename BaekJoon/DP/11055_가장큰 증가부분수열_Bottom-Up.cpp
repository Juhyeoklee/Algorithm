/*
*   Bottom Up
*/

#include <stdio.h>

int iArr[1001];
int memo[1001];
;

int main()
{
    int n;
    scanf("%d", &n);

    for (int i = 1; i <= n; i++)
    {
        scanf("%d", &iArr[i]);
    }
    memo[0] = 0;
    memo[1] = iArr[1];

    for (int i = 2; i <= n; i++)
    {
        int maxNum = 0;

        for (int j = 1; j < i; j++)
        {
            if (iArr[j] >= iArr[i])
            {
                continue;
            }

            if (maxNum < memo[j])
            {
                maxNum = memo[j];
            }
        }

        memo[i] = maxNum + iArr[i];
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
    for (int i = 1; i <= n; i++)
    {
        printf("%d ", memo[i]);
    }

    printf("\n");

    return 0;
}
