#include <stdio.h>
#include <iostream>
#include <string>
#include <queue>

using namespace std;

int main()
{
    queue<int> a;
    queue<int> ans;

    int n, k;

    cin >> n >> k;

    for (int i = 1; i <= n; i++)
    {
        a.push(i);
    }

    while (!a.empty())
    {
        for (int i = 1; i <= k; i++)
        {
            if (i == k)
            {
                ans.push(a.front());
                a.pop();
                continue;
            }

            int tmp = a.front();
            a.pop();
            a.push(tmp);
        }
    }

    cout << "<" << ans.front();
    ans.pop();

    while (!ans.empty())
    {
        cout << ", " << ans.front();
        ans.pop();
    }

    cout << ">" << endl;

    return 0;
}