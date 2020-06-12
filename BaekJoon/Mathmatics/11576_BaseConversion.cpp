#include <iostream>
#include <stdio.h>
#include <stack>

using namespace std;

int power(int n, int expo)
{

    if (expo == 0)
    {
        return 1;
    }

    int res = n;
    for (int i = 2; i <= expo; i++)
    {
        res = res * n;
    }

    return res;
}

int convertAtoNum(int A, int n, int i, int size)
{
    return A * power(n, size - 1 - i);
}

void convertNumToB(int num, int baseB)
{
    stack<int> st;

    while (num != 0)
    {
        st.push(num % baseB);
        num = num / baseB;
    }

    if (st.empty())
    {
        st.push(0);
    }

    while (!st.empty())
    {
        printf("%d", st.top());
        st.pop();
        if (st.empty())
        {
            printf("\n");
        }
        else
        {
            printf(" ");
        }
    }
}

int main()
{
    int curBase, convertBase;

    cin >> curBase >> convertBase;

    int size;

    cin >> size;

    int baseNum = 0;

    for (int i = 0; i < size; i++)
    {
        int n;
        cin >> n;
        baseNum += convertAtoNum(n, curBase, i, size);
    }
    // printf("%d\n", baseNum);
    convertNumToB(baseNum, convertBase);

    return 0;
}