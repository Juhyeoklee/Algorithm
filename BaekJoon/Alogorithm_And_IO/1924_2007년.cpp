#include <stdio.h>
#include <iostream>

using namespace std;

int transInputMonthToTotalDays(int month, int day)
{
    if (month < 0 || month > 12)
    {
        printf("input error");
        return -1;
    }

    int sum = 0;
    for (int i = 1; i < month; i++)
    {
        switch (i)
        {
        case 2:
            sum += 28;
            break;

        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            sum += 31;
            break;

        default:
            sum += 30;
            break;
        }
    }

    return sum + day;
}

void printResult(int days)
{
    int res = days % 7;

    switch (res)
    {
    case 0:
        printf("SUN\n");
        break;
    case 1:
        printf("MON\n");
        break;
    case 2:
        printf("TUE\n");
        break;
    case 3:
        printf("WED\n");
        break;
    case 4:
        printf("THU\n");
        break;
    case 5:
        printf("FRI\n");
        break;
    case 6:
        printf("SAT\n");
        break;
    default:
        break;
    }
}

int main()
{
    int month;
    int day;

    scanf("%d", &month);
    scanf("%d", &day);

    int totalDays = transInputMonthToTotalDays(month, day);
    printResult(totalDays);

    return 0;
}
