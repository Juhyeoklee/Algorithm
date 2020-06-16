#include <stdio.h>
#include <iostream>

using namespace std;

int main()
{
    cin.tie(NULL);

    bool memo[1000001];
    int count = 0;
    int arr[1000001];

    for (int i = 2; i <= 1000000; i++)
    {
        memo[i] = true;
    }

    for (int i = 2; i * i <= 1000000; i++)
    {
        if (memo[i] == true)
        {
            arr[count] = i;
            count++;
            for (int j = i * 2; j <= 1000000; j += i)
            {
                memo[j] = false;
            }
        }
    }

    while (1)
    {
        int n;
        cin >> n;
        if (n == 0)
        {
            break;
        }

        int result = 0;
        for (int i = 1; i < count; i++)
        {
            if (memo[n - arr[i]])
            {
                result = arr[i];
                break;
            }
        }
        if (result == 0)
        {
            cout << "Goldbach's conjecture is wrong.\n";
            // printf("Goldbach's conjecture is wrong.\n");
        }
        else
        {
            cout << n << " = " << result << " + " << n - result << "\n";
            // printf("%d = %d + %d\n", n, result, n - result);
        }
    }

    return 0;
}