#include <iostream>
#include <algorithm>
#include <string>
#include <vector>

using namespace std;

typedef struct Person
{
    string name;
    int age;
    int order;
    bool operator<(const Person &p) const
    {
        if (this->age < p.age)
        {
            return true;
        }
        else if (this->age == p.age)
        {
            return this->order < p.order;
        }
        else
        {
            return false;
        }
    }

    string toString()
    {
        return to_string(age) + " " + name;
    }
} Person;

int main()
{
    int n;
    scanf("%d", &n);
    vector<Person> v;
    for (int i = 0; i < n; i++)
    {
        Person p;
        cin >> p.age >> p.name;
        p.order = i;
        v.push_back(p);
    }

    stable_sort(v.begin(), v.end());
    for (int i = 0; i < n; i++)
    {
        printf("%s\n", v[i].toString().c_str());
    }
    return 0;
}