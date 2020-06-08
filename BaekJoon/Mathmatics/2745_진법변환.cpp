#include <stdio.h>
#include <iostream>
#include <string>
#include <math.h>

using namespace std;

int square(int num, int sqr)
{
    if (sqr == 0)
    {
        return 1;
    }

    int result = num;
    for (int i = 1; i < sqr; i++)
    {
        result = result * num;
    }

    return result;
}

int main()
{
    string s;
    int num;
    cin >> s >> num;

    long long result = 0;

    for (int i = s.size() - 1; i >= 0; i--)
    {
        int n;
        if (s[i] - '0' >= 0 && s[i] - '0' < 10)
        {
            n = s[i] - '0';
        }
        else
        {
            n = s[i] - 'A' + 10;
        }

        result += (n * square(num, s.size() - 1 - i));
    }
    printf("%lld\n", result);

    return 0;
}
