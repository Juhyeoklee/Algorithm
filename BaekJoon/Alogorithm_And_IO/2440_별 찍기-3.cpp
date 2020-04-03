#include <stdio.h>
#include <iostream>

using namespace std;

int main()
{
    int num;
    scanf("%d", &num);

    while (num > 0)
    {
        for (int i = num; i > 0; i--)
        {
            printf("*");
        }
        printf("\n");
        num--;
    }
    return 0;
}