/*
* Top Down
*/

#include <stdio.h>

int dp(int n, int *&arr);

int main()
{
    int count, n;
    int *memo;
    scanf("%d", &count);

    for (int i = 0; i < count; i++)
    {
        scanf("%d", &n);
        const int SIZE = n;

        memo = new int[SIZE + 1];
        for (int j = 0; j <= SIZE; j++)
        {
            memo[j] = -1;
        }
        memo[0] = 1;
        memo[1] = 1;
        memo[2] = 2;

        printf("%d\n", dp(n, memo));

        delete[] memo;
    }
}

int dp(int n, int *&arr)
{
    if (arr[n] >= 0)
    {
        return arr[n];
    }

    arr[n] = dp(n - 1, arr) + dp(n - 2, arr) + dp(n - 3, arr);

    return arr[n];
}