/*
*   Bottom Up
*/
#include <stdio.h>
#include <algorithm>
int memo[1001];
int iArr[1001];

int main()
{
    int n;
    scanf("%d", &n);

    for (int i = 1; i <= n; i++)
    {
        scanf("%d", &iArr[i]);
    }

    memo[1] = 1;
    int maxNum = 1;
    int maxIndex = 1;

    for (int i = 2; i <= n; i++)
    {
        memo[i] = memo[1];

        for (int j = 1; j < i; j++)
        {
            if (iArr[j] < iArr[i])
            {
                if (memo[i] < memo[j] + 1)
                {
                    memo[i] = memo[j] + 1;
                }
            }
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

    for (int i = 1; i <= n; i++)
    {
        printf("%d ", memo[i]);
    }
    printf("\n");
    return 0;
}
