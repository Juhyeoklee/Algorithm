#include <stdio.h>
#include <algorithm>
#include <vector>

using namespace std;

typedef struct Number
{
    int num, beforPosition;

    bool operator<(const Number &n) const
    {
        return this->num < n.num;
    }
} Number;

int main()
{
    int N;
    vector<Number> v;
    scanf("%d", &N);
    Number a;
    a.beforPosition = 0;
    a.num = -1;
    v.push_back(a);
    for (int i = 1; i < N + 1; i++)
    {

        Number n;
        scanf("%d", &n.num);
        n.beforPosition = i;
        v.push_back(n);
    }
    stable_sort(v.begin(), v.end());

    vector<int> s;

    for (int i = 1; i < N + 1; i++)
    {
        int dif = v[i].beforPosition - i;
        s.push_back(dif);
    }

    sort(s.begin(), s.end());

    printf("%d\n", s[s.size() - 1] + 1);

    return 0;
}