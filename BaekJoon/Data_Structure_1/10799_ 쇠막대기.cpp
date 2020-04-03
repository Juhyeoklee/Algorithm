#include <stdio.h>
#include <iostream>
#include <stack>
#include <string>

using namespace std;

int main()
{
    int count = 0;
    string s;
    stack<char> leftParenthesisStack;

    cin >> s;

    for (int i = 0; i < s.size(); i++)
    {
        if (s[i] == '(')
        {
            if (s[i + 1] == '(')
            {
                count++;
                leftParenthesisStack.push(s[i]);
            }
            else
            {
                count += leftParenthesisStack.size();
            }
        }
        else
        {
            if (s[i - 1] != '(')
            {
                leftParenthesisStack.pop();
            }
        }
    }
    printf("%d\n", count);

    return 0;
}
