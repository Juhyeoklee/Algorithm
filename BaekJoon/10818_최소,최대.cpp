#include <iostream>
#include <stdio.h>

int main()
{
    int n;
    int *arr;
    int maxNum;
    int minNum;

    scanf("%d", &n);

    arr = new int[n];
    for (int i = 0; i < n; i++)
    {
        scanf("%d", &arr[i]);
    }

    maxNum = arr[0];
    minNum = arr[0];

    for (int i = 1; i < n; i++)
    {
        if (maxNum < arr[i])
        {
            maxNum = arr[i];
        }
        if (minNum > arr[i])
        {
            minNum = arr[i];
        }
    }

    printf("%d %d\n", minNum, maxNum);

    delete[] arr;

    return 0;
}