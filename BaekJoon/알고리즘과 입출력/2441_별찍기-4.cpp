#include <stdio.h>
#include <iostream>

using namespace std;

int main()
{
    int num;
    scanf("%d", &num);
    int temp = num;

    while (temp > 0)
    {
        for (int i = 0; i < num - temp; i++)
        {
            printf(" ");
        }
        for (int i = temp; i > 0; i--)
        {
            printf("*");
        }
        printf("\n");
        temp--;
    }
    return 0;
}