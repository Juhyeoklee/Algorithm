#include <stdio.h>

int gcd(int a, int b)
{
    while (b != 0)
    {
        int tmp = a % b;
        a = b;
        b = tmp;
    }

    return a;
}

long long sumOfGCD(int arr[], int size)
{
    long long sum = 0;
    for (int i = 0; i < size; i++)
    {
        for (int j = i + 1; j < size; j++)
        {
            sum += gcd(arr[i], arr[j]);
        }
    }

    return sum;
}
int main()
{
    int n;
    scanf("%d", &n);

    for (int i = 0; i < n; i++)
    {
        int t;
        scanf("%d", &t);
        int *arr = new int[t];

        for (int j = 0; j < t; j++)
        {
            scanf("%d", &arr[j]);
        }
        printf("%lld\n", sumOfGCD(arr, t));
        delete[] arr;
    }

    return 0;
}