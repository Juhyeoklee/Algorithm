#include <stdio.h>
#include <iostream>
#include <string>

using namespace std;

int main()
{
    string s;

    while (getline(cin, s))
    {

        int lower_char_count = 0, upper_char_count = 0, space_count = 0, num_count = 0;

        for (int i = 0; i < s.size(); i++)
        {
            if (s[i] >= 97 && s[i] <= 122)
            {
                lower_char_count++;
            }
            else if (s[i] >= 65 && s[i] <= 90)
            {
                upper_char_count++;
            }
            else if (s[i] == ' ')
            {
                space_count++;
            }
            else if (s[i] >= 48 && s[i] <= 57)
            {
                num_count++;
            }
        }
        cout << lower_char_count << " " << upper_char_count << " " << num_count << " " << space_count << endl;
    }

    return 0;
}