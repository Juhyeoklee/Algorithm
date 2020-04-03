#include <iostream>
#include <string>

using namespace std;

int main()
{
    string s1, s2, s3, s4;

    cin >> s1 >> s2 >> s3 >> s4;
    size_t num1 = stoul(s1 + s2);
    size_t num2 = stoul(s3 + s4);

    cout << num1 + num2 << endl;
    return 0;
}