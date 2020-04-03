/* 3
  *
 **
***
 **
  *
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

    for (int i = 0; i < 2 * num - 1; i++)
    {
        for (int j = 0; j < num; j++)
        {
            if (abs(num - 1 - i) <= j)
            {
                printf("*");
            }
            else
            {
                printf(" ");
            }
        }
        printf("\n");
    }
    return 0;
}