#include <stdio.h>
#include <vector>
#include <algorithm>

using namespace std;

typedef struct Point
{
    int x;
    int y;

    bool operator<(const Point &v) const
    {
        if (this->x < v.x)
        {
            return true;
        }
        else if (this->x == v.x)
        {
            return this->y < v.y;
        }
        else
        {
            return false;
        }
    }
} Point;

int main()
{
    int n;

    vector<Point> v;

    scanf("%d", &n);
    for (int i = 0; i < n; i++)
    {
        Point p;
        scanf("%d %d", &p.x, &p.y);
        v.push_back(p);
    }

    sort(v.begin(), v.end());

    for (int i = 0; i < n; i++)
    {
        printf("%d %d\n", v[i].x, v[i].y);
    }

    return 0;
}