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

    if (n == 1)
    {
        return memo[n];
    }
    if (memo[n] >= 0)
    {
        return memo[n];
    }

    if (n % 3 == 0 && n % 2 == 0)
    {
        memo[n] = min(min(answer(n / 3), answer(n / 2)), answer(n - 1)) + 1;
    }
    else if (n % 2 == 0)
    {
        memo[n] = min(answer(n / 2), answer(n - 1)) + 1;
    }
    else if (n % 3 == 0)
    {
        memo[n] = min(answer(n / 3), answer(n - 1)) + 1;
    }
    else
    {
        memo[n] = answer(n - 1) + 1;
    }

    return memo[n];
}