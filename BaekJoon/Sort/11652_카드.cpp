#include <algorithm>
#include <stdio.h>
#include <vector>

using namespace std;

int main()
{
    int N;
    vector<long long> v;

    scanf("%d", &N);
    for (int i = 0; i < N; i++)
    {
        long long num;
        scanf("%lld", &num);
        v.push_back(num);
    }
    sort(v.begin(), v.end());

    long long beforNum = v[0];
    int beforCount = 1;
    long long maxNum = v[0];
    int maxCount = 0;
    for (int i = 1; i < N; i++)
    {
        if (beforNum == v[i])
        {
            beforCount++;
        }
        else
        {
            if (maxCount < beforCount)
            {
                maxNum = beforNum;
                maxCount = beforCount;
            }
            beforNum = v[i];
            beforCount = 1;
        }

        if (i == N - 1)
        {
            if (maxCount < beforCount)
            {
                maxNum = beforNum;
                maxCount = beforCount;
            }
        }
    }

    printf("%lld\n", maxNum);

    return 0;
}