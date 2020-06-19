#include <stdio.h>
#include <algorithm>
#include <vector>
#include <iostream>
using namespace std;

int main()
{
    int n;
    vector<int> v;
    scanf("%d", &n);

    for (int i = 0; i < n; i++)
    {
        int input;
        scanf("%d", &input);
        v.push_back(input);
    }

    sort(v.begin(), v.end());

    for (int i = 0; i < v.size(); i++)
    {
        printf("%d\n", v[i]);
    }

    return 0;
}