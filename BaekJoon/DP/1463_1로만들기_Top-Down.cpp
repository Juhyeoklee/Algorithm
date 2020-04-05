#include <stdio.h>
#include <algorithm>

int memo[1000001];
int answer(int n);

using namespace std;

int main()
{
    int n;
    scanf("%d", &n);

    for (int i = 0; i < 1000001; i++)
    {
        memo[i] = -1;
    }
    memo[1] = 0;
    printf("%d\n", answer(n));

    return 0;
}

int answer(int n)
{
    for (int i = 2; i <= n; i++)
    {
        if (i % 2 == 0 && i % 3 == 0)
        {
            memo[i] = min(min(memo[i / 2], memo[i / 3]), memo[i - 1]) + 1;
        }
        else if (i % 2 == 0)
        {
            memo[i] = min(memo[i / 2], memo[i - 1]) + 1;
        }
        else if (i % 3 == 0)
        {
            memo[i] = min(memo[i / 3], memo[i - 1]) + 1;
        }
        else
        {
            memo[i] = memo[i - 1] + 1;
        }
    }
    return memo[n];
}