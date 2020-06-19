#include <stdio.h>

long long countOfTen(int n, int m)
{
    long long tCount = 0;
    long long fCount = 0;
    for (long long i = 2; i <= n; i *= 2)
    {
        tCount += n / i;
    }
    for (long long i = 5; i <= n; i *= 5)
    {
        fCount += n / i;
    }

    for (long long i = 2; i <= n - m; i *= 2)
    {
        tCount -= (n - m) / i;
    }
    for (long long i = 5; i <= n - m; i *= 5)
    {
        fCount -= (n - m) / i;
    }

    for (long long i = 2; i <= m; i *= 2)
    {
        tCount -= m / i;
    }
    for (long long i = 5; i <= m; i *= 5)
    {
        fCount -= m / i;
    }

    if (tCount > fCount)
        return fCount;
    else
        return tCount;
}

int main()
{
    long long n, m;
    scanf("%lld %lld", &n, &m);
    long long count = countOfTen(n, m);

    printf("%lld\n", count);
    return 0;
}