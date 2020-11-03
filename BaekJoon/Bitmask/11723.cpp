#include <iostream>
#include <string>

using namespace std;

int main()
{
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    int m;
    cin >> m;

    string order;
    int val, BIT = 0;
    while (m--)
    {
        cin >> order;
        if (order == "add")
        {
            cin >> val;
            BIT |= (1 << val);
        }
        else if (order == "remove")
        {
            cin >> val;
            BIT &= ~(1 << val);
        }
        else if (order == "check")
        {
            cin >> val;
            if (BIT & (1 << val))
                cout << 1 << '\n';
            else
                cout << 0 << '\n';
        }
        else if (order == "toggle")
        {
            cin >> val;
            BIT ^= (1 << val);
        }
        else if (order == "all")
        {
            BIT = (1 << 21) - 1;
        }
        else if (order == "empty")
        {
            BIT = 0;
        }
    }

    return 0;
}