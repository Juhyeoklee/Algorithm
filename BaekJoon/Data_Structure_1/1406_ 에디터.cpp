#include <stdio.h>
#include <iostream>
#include <stack>
#include <string>

using namespace std;

int main()
{
    string s;
    string result = "";
    int num;
    stack<char> lStr;
    stack<char> rStr;

    cin >> s;
    cin >> num;

    for (int i = 0; i < s.size(); i++)
    {
        lStr.push(s[i]);
    }

    for (int i = 0; i < num; i++)
    {
        string cmd;
        cin >> cmd;

        if (cmd == "P")
        {
            char ch;
            cin >> ch;
            lStr.push(ch);
        }
        else if (cmd == "L")
        {
            if (lStr.empty())
            {
                continue;
            }
            rStr.push(lStr.top());
            lStr.pop();
        }
        else if (cmd == "D")
        {
            if (rStr.empty())
            {
                continue;
            }
            lStr.push(rStr.top());
            rStr.pop();
        }
        else if (cmd == "B")
        {
            if (lStr.empty())
            {
                continue;
            }
            lStr.pop();
        }
    }
    while (!lStr.empty())
    {
        rStr.push(lStr.top());
        lStr.pop();
    }

    while (!rStr.empty())
    {
        result += rStr.top();
        rStr.pop();
    }

    cout << result << endl;

    return 0;
}
