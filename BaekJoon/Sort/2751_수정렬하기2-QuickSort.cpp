#include <stdio.h>
#include <algorithm>
#include <vector>
#include <iostream>
using namespace std;

// Quick Sort

int arr[1000000];

void swap(int &a, int &b)
{
    int z = a;
    a = b;
    b = z;
}

int partition(int begin, int end)
{
    int pivot = begin + (end - begin) / 2;
    int pivotValue = arr[pivot];
    swap(arr[end], arr[pivot]);
    int idx = begin;

    for (int i = begin; i < end; i++)
    {
        if (arr[i] < pivotValue)
        {
            swap(arr[i], arr[idx]);
            idx += 1;
        }
    }

    swap(arr[idx], arr[end]);
    return idx;
}

void quickSort(int begin, int end)
{
    if (begin < end)
    {
        int pivot = partition(begin, end);
        quickSort(begin, pivot - 1);
        quickSort(pivot + 1, end);
    }
}

int main()
{
    int n;
    scanf("%d", &n);

    for (int i = 0; i < n; i++)
    {
        scanf("%d", &arr[i]);
    }
    quickSort(0, n - 1);
    for (int i = 0; i < n; i++)
    {
        printf("%d\n", arr[i]);
    }

    return 0;
}