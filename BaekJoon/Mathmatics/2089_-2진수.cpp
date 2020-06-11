#include <stdio.h>

#include <string>
#include <stack>
using namespace std;

int main()
{

    int n;

    scanf("%d", &n);
    if (n == 0)
    {
        printf("0");
    }
    stack<int> res;
    while (n != 0)
    {
        if (n > 0)
        {

            res.push(n % -2);
            n = n / -2;
        }
        else
        {

            int ext;
            if (n % -2 == 0)
            {
                ext = 0;
                n = n / -2;
            }
            else
            {
                n = n / -2 + 1;
                ext = 1;
            }
            res.push(ext);
        }
    }

    while (!res.empty())
    {

        printf("%d", res.top());
        res.pop();
    }
    printf("\n");
    return 0;
}