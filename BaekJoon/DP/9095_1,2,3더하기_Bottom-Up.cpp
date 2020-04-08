/*
* Bottom Up
*/

#include <stdio.h>

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
        memo[0] = 1;
        memo[1] = 1;
        memo[2] = 2;

        for (int j = 3; j <= SIZE; j++)
        {
            memo[j] = memo[j - 1] + memo[j - 2] + memo[j - 3];
        }

        printf("%d\n", memo[n]);

        delete[] memo;
    }
}
