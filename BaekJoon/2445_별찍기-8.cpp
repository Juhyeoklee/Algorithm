/* 5
*        *
**      **
***    ***
****  ****
**********
****  ****
***    ***
**      **
*        *
*/

#include <stdio.h>
#include <iostream>

using namespace std;

int main()
{
    int num;
    int k = 0;

    scanf("%d", &num);

    for (int i = 0; i < 2 * num - 1; i++)
    {
        for (int j = 0; j < 2 * num; j++)
        {
            if (j <= k || j >= 2 * num - 1 - k)
            {
                printf("*");
            }
            else
            {
                printf(" ");
            }
        }

        if (i >= (2 * num - 1) / 2)
        {
            k--;
        }
        else
        {
            k++;
        }
        printf("\n");
    }
    return 0;
}
