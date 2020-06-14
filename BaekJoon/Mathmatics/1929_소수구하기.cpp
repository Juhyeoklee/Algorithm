#include <stdio.h>

int main()
{

    int n, m;
    scanf("%d%d", &m, &n);
    bool memo[n];
    int arr[n];
    int count = 0;
    for (int i = 2; i <= n; i++)
    {
        memo[i] = true;
    }

    for (int i = 2; i <= n; i++)
    {
        if (memo[i] == true)
        {
            if (i >= m)
            {
                arr[count] = i;
                count++;
            }

            for (int j = i * 2; j <= n; j += i)
            {
                memo[j] = false;
            }
        }
    }

    for (int i = 0; i < count; i++)
    {
        printf("%d\n", arr[i]);
    }

    return 0;
}