#include <algorithm>
#include <vector>
#include <stdio.h>
#include <iostream>
#include <string>

using namespace std;

int arr[10001];

int main()
{
    int n;
    scanf("%d", &n);

    for (int i = 0; i < n; i++)
    {
        int num;
        scanf("%d", &num);
        arr[num] += 1;
    }

    printf("\n\n");
    for (int i = 0; i < 10001; i++)
    {
        if (arr[i] > 0)
        {
            for (int j = 0; j < arr[i]; j++)
            {
                printf("%d\n", i);
            }
        }
    }
    return 0;
}