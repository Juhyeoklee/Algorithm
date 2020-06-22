#include <stdio.h>
#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

using namespace std;

typedef struct Point
{
    int x, y;
    bool operator<(const Point &p) const
    {
        if (this->y < p.y)
        {
            return true;
        }
        else if (this->y == p.y)
        {
            return this->x < p.x;
        }
        else
        {
            return false;
        }
    }

    // string toString()
    // {
    //     return to_string(x) + " " + to_string(y);
    // }
} Point;

int main()
{
    vector<Point> v;
    int n;
    scanf("%d", &n);
    for (int i = 0; i < n; i++)
    {
        Point p;
        scanf("%d %d", &p.x, &p.y);
        v.push_back(p);
    }
    sort(v.begin(), v.end());
    // printf("------------------------\n");
    for (int i = 0; i < n; i++)
    {
        printf("%d %d\n", v[i].x, v[i].y);
        // printf("%s\n", v[i].toString().c_str());
        // cout << v[i].toString() << endl;
    }
    return 0;
}