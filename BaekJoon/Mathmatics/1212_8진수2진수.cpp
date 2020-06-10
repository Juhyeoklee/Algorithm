#include <iostream>
#include <string>
using namespace std;

int main()
{
    string s;
    cin >> s;
    string result = "";
    for (int i = 0; i < s.size(); i++)
    {
        int n = s[i] - '0';
        if (i == 0)
        {
            int n1 = n / 4;
            int n2 = (n % 4) / 2;
            int n3 = (n % 4) % 2;

            if (n1 == 0 || n2 == 0)
            {
                if (n1 == 0 && n2 != 0)
                {
                    printf("%d", n2);
                }
                else if (n1 != 0 && n2 == 0)
                {
                    printf("%d%d", n1, n2);
                }
            }
            else
            {
                printf("%d%d", n1, n2);
            }
            printf("%d", n3);
        }
        else
        {
            int n1 = n / 4;
            int n2 = (n % 4) / 2;
            int n3 = (n % 4) % 2;

            printf("%d%d%d", n1, n2, n3);
        }
    }

    printf("\n");

    return 0;
}