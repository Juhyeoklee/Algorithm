/* 5
*********
.*******
..*****
...***
....*
...***
..*****
.*******
*********
*/

#include <stdio.h>
#include <stdlib.h>

#include <iostream>
#include <cmath>
using namespace std;

int main()
{
    int num;
    scanf("%d", &num);

    int midNum = ceil((2 * num - 1) / 2);
    for (int i = 0; i < 2 * num - 1; i++)
    {
        for (int j = 0; j < 2 * num - 1; j++)
        {
            if (midNum - abs(midNum - i) <= j && j <= midNum + abs(midNum - i))
            {
                printf("*");
            }
            else if (midNum - abs(midNum - i) > j)
            {
                printf(" ");
            }
        }
        printf("\n");
    }
    return 0;
}