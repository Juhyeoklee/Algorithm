#include <iostream>
#include <stdio.h>
#include <stack>

using namespace std;

int main()
{
    string input;
    stack<char> s;
    stack<int> ans;
    cin >> input;
    for (int i = 0; i < input.size(); i++)
    {
        s.push(input[i]);
    }
    while (!s.empty())
    {
        int a = 0, b = 0, c = 0;
        if (!s.empty())
        {
            a = (s.top() - '0') * 1;
            s.pop();
        }

        if (!s.empty())
        {
            b = (s.top() - '0') * 2;
            s.pop();
        }

        if (!s.empty())
        {
            c = (s.top() - '0') * 4;
            s.pop();
        }
        ans.push(a + b + c);
    }

    while (!ans.empty())
    {
        printf("%d", ans.top());
        ans.pop();
    }

    printf("\n");

    return 0;
}
