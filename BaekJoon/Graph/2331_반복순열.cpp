#include <stack>
#include <vector>
#include <set>
#include <stdio.h>
#include <cmath>
#include <iostream>

using namespace std;

int A, P;
// int sum = 0;
vector<int> v;
set<int> s;
void dfs()
{
}
int getNextNumber(int num)
{
    int sum = 0;
    sum = (int)pow(num % 10, P);
    num = num / 10;
    while (num != 0)
    {
        sum += (int)pow(num % 10, P);
        num = num / 10;
    }
    return sum;
}

bool isInVector(int num)
{
    vector<int>::iterator iter;
    for (iter = v.begin(); iter != v.end(); iter++)
    {
        if (*iter == num)
        {
            return true;
        }
    }
    return false;
}

int getIndexInVector(int num)
{
    int idx = 0;
    for (int i = 1; i < v.size(); i++)
    {
        if (num == v[i])
        {
            idx = i;
            break;
        }
    }
    return idx;
}

int main()
{
    int cnt = 1;
    scanf("%d%d", &A, &P);
    v.push_back(0);
    v.push_back(A);
    while (1)
    {
        int before = v[v.size() - 1];
        int cur = getNextNumber(before);
        if (!isInVector(cur))
        {
            v.push_back(cur);
            // cnt++;
        }
        else
        {
            cnt = getIndexInVector(cur) - 1;
            break;
        }
    }
    printf("%d\n", cnt);
    return 0;
}