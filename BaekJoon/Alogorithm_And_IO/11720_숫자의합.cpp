#include <stdio.h>
#include <iostream>
#include <string>

using namespace std;

int main()
{
    int num;
    int sum = 0;
    int a;

    scanf("%d", &num);

    for (int i = 0; i < num; i++)
    {
        scanf("%1d", &a);
        sum += a;
    }

    printf("%d\n", sum);

    return 0;
}
