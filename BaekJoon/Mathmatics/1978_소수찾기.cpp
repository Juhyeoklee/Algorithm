#include <stdio.h>

bool isPrime(int n)
{
    if (n < 2)
        return false;
    if (n == 2)
        return true;

    int i = 2;
    do
    {
        if (n % i == 0)
        {
            return false;
        }
        i++;
    } while (i * i <= n);

    return true;
}

int main()
{
    int n;
    int cnt = 0;
    scanf("%d", &n);

    for (int i = 0; i < n; i++)
    {
        int a;
        scanf("%d", &a);
        if (isPrime(a))
        {
            cnt++;
        }
    }

    printf("%d\n", cnt);
    return 0;
}