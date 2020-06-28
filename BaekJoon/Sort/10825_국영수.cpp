#include <stdio.h>
#include <iostream>

#include <algorithm>
#include <vector>
#include <string>

using namespace std;

typedef struct Student
{
    string name;
    int kor, eng, math;

    bool operator<(const Student s) const
    {
        if (kor == s.kor)
        {
            if (eng == s.eng)
            {
                if (math == s.math)
                {
                    if (this->name < s.name)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                return math > s.math;
            }
            return eng < s.eng;
        }
        return kor > s.kor;
        //     if (this->kor < s.kor)
        //     {
        //         return false;
        //     }
        //     else if (this->kor == s.kor)
        //     {
        //         if (this->eng < s.eng)
        //         {
        //             return true;
        //         }
        //         else if (this->eng == s.eng)
        //         {
        //             if (this->math < s.math)
        //             {
        //                 return false;
        //             }
        //             else if (this->math == s.math)
        //             {
        //                 if (this->name < s.name)
        //                 {
        //                     return true;
        //                 }
        //                 else
        //                 {
        //                     return false;
        //                 }
        //             }
        //             else
        //             {
        //                 return true;
        //             }
        //         }
        //         else
        //         {
        //             return false;
        //         }
        //     }
        //     else
        //     {
        //         return true;
        //     }
    }
} Student;

int main()
{

    int n;
    vector<Student> v;
    scanf("%d", &n);

    for (int i = 0; i < n; i++)
    {
        Student s;
        cin >> s.name >> s.kor >> s.eng >> s.math;
        v.push_back(s);
    }

    sort(v.begin(), v.end());

    for (int i = 0; i < n; i++)
    {
        printf("%s\n", v[i].name.c_str());
    }
    return 0;
}