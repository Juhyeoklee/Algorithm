#include <stdio.h>
#include <stack>

using namespace std;
int main()
{
    int n;
    scanf("%d", &n);

    // int arr[n + 1];
    // int memo[n + 1];
    // int count = 0;

    // // 소수구하기
    // for (int i = 0; i <= n; i++)
    // {
    //     memo[i] = true;
    // }

    // for (int i = 2; i <= n; i++)
    // {
    //     if (memo[i] == true)
    //     {
    //         arr[count] = i;
    //         count++;

    //         for (int j = i * 2; j <= n; j += i)
    //         {
    //             memo[j] = false;
    //         }
    //     }
    // }

    // int res = n;
    // int idx = 0;

    // while (res != 1)
    // {

    //     if (res % arr[idx] == 0)
    //     {
    //         printf("%d\n", arr[idx]);
    //         res = res / arr[idx];
    //     }
    //     else
    //     {
    //         idx++;
    //     }
    // }

    for (int i = 2; i * i <= n; i++)
    {
        while (n % i == 0)
        {
            printf("%d\n", i);
            n = n / i;
        }
    }

    if (n > 1)
    {
        printf("%d\n", n);
    }

    return 0;
}