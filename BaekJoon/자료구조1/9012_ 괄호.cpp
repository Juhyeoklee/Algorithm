#include <stdio.h>
#include <iostream>
#include <stack>
#include <string>

using namespace std;

string is_correct_parenthesis(string s)
{
    stack<char> chStack;

    for (int i = 0; i < s.size(); i++)
    {
        if (s[i] == '(')
        {
            chStack.push(s[i]);
        }
        else
        {
            if (chStack.empty())
            {
                return "NO";
            }
            else
            {
                chStack.pop();
            }
        }
    }

    if (chStack.empty())
    {
        return "YES";
    }
    else
    {
        return "NO";
    }
}

int main()
{
    int num;
    string s;

    scanf("%d", &num);
    for (int i = 0; i < num; i++)
    {
        cin >> s;
        cout << is_correct_parenthesis(s) << endl;
    }

    return 0;
}
