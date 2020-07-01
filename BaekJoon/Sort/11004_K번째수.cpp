#include <vector>
#include <stdio.h>
#include <algorithm>

using namespace std;

int main()
{
    int N, K;
    vector<int> v;

    scanf("%d %d", &N, &K);

    for (int i = 0; i < N; i++)
    {
        int num;
        scanf("%d", &num);
        v.push_back(num);
    }
    sort(v.begin(), v.end());

    printf("%d\n", v[K - 1]);

    return 0;
}