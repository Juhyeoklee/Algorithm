/*
* Top Down
*/

#include <stdio.h>

int memo[1001][10];
int dp(int size, int endNum);

int main()
{
    int size;
    scanf("%d", &size);

    for (int i = 0; i <= size; i++)
    {
        for (int j = 0; j < 10; j++)
        {
            memo[i][j] = -1;
        }
    }

    for (int i = 0; i < 10; i++)
    {
        memo[0][i] = 0;
        memo[1][i] = 1;
    }

    size_t sum = 0;
    for (int i = 0; i < 10; i++)
    {
        sum += dp(size, i);
    }

    printf("%lu\n", sum % 10007);

    return 0;
}

int dp(int size, int endNum)
{
    if (memo[size][endNum] >= 0)
    {
        return memo[size][endNum];
    }
    size_t count = 0;

    for (int i = 0; i <= endNum; i++)
    {
        count += dp(size - 1, i);
    }
    memo[size][endNum] = count % 10007;

    return memo[size][endNum];
}