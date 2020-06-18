#include <stdio.h>

int main()
{
    int n;
    int tCount = 0;
    int fCount = 0;
    scanf("%d", &n);

    unsigned long result = 1;
    for (int i = 2; i <= n; i++)
    {
        int num = i;

        for (int j = 2; j <= num; j++)
        {
            while (num % j == 0)
            {
                num = num / j;
                if (j == 2)
                {
                    tCount++;
                }
                if (j == 5)
                {
                    fCount++;
                }
            }
        }
    }

    // printf("two count : %d\n", tCount);
    // printf("five count : %d\n", fCount);
    if (tCount > fCount)
    {
        printf("%d\n", fCount);
    }
    else
    {
        printf("%d\n", tCount);
    }

    return 0;
}