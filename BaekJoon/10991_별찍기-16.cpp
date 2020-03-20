/* 4
   *
  * *
 * * *
* * * *
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
    int k = num - 1;
    for (int i = 0; i < num; i++)
    {
        for (int l = 0; l < k; l++)
        {
            printf(" ");
        }

        for (int j = 0; j < 2 * i + 1; j++)
        {
            if (j % 2 == 0)
            {
                printf("*");
            }
            else
            {
                printf(" ");
            }
        }
        k--;
        printf("\n");
    }
    return 0;
}