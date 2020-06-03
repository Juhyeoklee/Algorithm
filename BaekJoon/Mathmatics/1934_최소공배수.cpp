#include <stdio.h>

int lcm(int a, int b)
{
    int ans = 0;
    int ga = a;
    int gb = b;

    while (gb != 0)
    {
        int tmp = ga % gb;
        ga = gb;
        gb = tmp;
    }

    ans = ga * (a / ga) * (b / ga);

    return ans;
}
int main()
{
    int n, a, b;
    scanf("%d", &n);
    for (int i = 0; i < n; i++)
    {
        scanf("%d %d", &a, &b);
        printf("%d\n", lcm(a, b));
    }
    return 0;
}