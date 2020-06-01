#include <stdio.h>

long long memo[201][201];

int main()
{
    int n, k;
    scanf("%d %d", &n, &k);

    for (int i = 0; i <= n; i++)
    {
        memo[0][i] = 0;
        memo[1][i] = 1;
    }

    for (int i = 2; i <= k; i++)
    {
        for (int j = 0; j <= n; j++)
        {
            long long tmp = 0;

            for (int k = 0; k <= j; k++)
            {
                tmp += memo[i - 1][k];
            }
            memo[i][j] = tmp % 1000000000;
        }
    }

    printf("%lld\n", memo[k][n]);

    return 0;
}