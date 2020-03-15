#include <stdio.h>
#include <iostream>
#include <string>

using namespace std;

int main()
{
    string s;
    int num;
    int a, b;

    scanf("%d", &num);

    for (int i = 0; i < num; i++)
    {
        scanf("%d%d", &a, &b);
        printf("Case #%d: %d + %d = %d\n", i + 1, a, b, a + b);
    }

    return 0;
}
