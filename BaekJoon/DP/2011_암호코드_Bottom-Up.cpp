#include <stdio.h>
#include <iostream>
#include <string>

using namespace std;

long long memo[5001];
int mod = 1000000;

int main()
{
    string s;
    cin >> s;
    if (s[0] - '0' == 0)
    {
        printf("0\n");
        return 0;
    }

    memo[0] = 1;

    for (int i = 1; i < s.size(); i++)
    {
        int cur = s[i] - '0';
        int prv = s[i - 1] - '0';

        if (i == 1)
        {
            if (cur == 0 && prv <= 2)
            {
                memo[i] = 1;
            }
            else if ((prv * 10 + cur) <= 26 && (prv * 10 + cur) > 10)
            {
                memo[i] = 2;
            }
            else if ((prv >= 2 && cur > 6) || prv > 2)
            {
                if (prv > 2 && cur == 0)
                {
                    printf("0\n");
                    return 0;
                }
                memo[i] = 1;
            }
        }
        else
        {
            if (cur == 0 && prv <= 2 && prv >= 1)
            {
                memo[i] = memo[i - 2] % mod;
            }
            else if ((prv * 10 + cur) <= 26 && (prv * 10 + cur) > 10)
            {
                memo[i] = (memo[i - 1] + memo[i - 2]) % mod;
            }
            else if ((prv >= 2 && cur > 6) || prv > 2)
            {
                if (prv > 2 && cur == 0)
                {
                    printf("0\n");
                    return 0;
                }
                memo[i] = memo[i - 1] % mod;
            }
            else if (prv == 0)
            {
                if (cur == 0)
                {
                    printf("0\n");
                    return 0;
                }
                else
                {
                    memo[i] = memo[i - 1] % mod;
                }
            }
            else
            {
                printf("else");
            }
        }

        printf("%lld\n", memo[s.size() - 1] % mod);

        return 0;
    }