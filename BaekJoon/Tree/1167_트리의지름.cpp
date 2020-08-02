#include <stdio.h>
#include <iostream>
#include <vector>
#include <queue>

using namespace std;
typedef pair<int, int> IntPair;

const int MAX_SIZE = 100001;

vector<IntPair> arr[MAX_SIZE];
int check[MAX_SIZE];

void bfs(int start)
{
    queue<int> q;
    check[start] = 0;
    q.push(start);

    while (!q.empty())
    {
        int front = q.front();

        for (int i = 0; i < arr[front].size(); i++)
        {
            int des = arr[front][i].first;
            if (check[des] < 0)
            {
                q.push(des);
                check[des] = check[front] + arr[front][i].second;
            }
        }
        q.pop();
    }
}

int main()
{
    int V;
    scanf("%d", &V);
    int n = V;
    while (n--)
    {
        int num;
        scanf("%d", &num);

        while (1)
        {
            int des;
            scanf("%d", &des);
            if (des == -1)
            {
                break;
            }
            int weight;
            scanf("%d", &weight);
            arr[num].push_back(make_pair(des, weight));
        }
    }
    for (int i = 0; i <= V; i++)
    {
        check[i] = -1;
    }

    bfs(1);
    int maxPoint = 1;
    int maxLength = -1;
    for (int i = 1; i <= V; i++)
    {
        if (maxLength < check[i])
        {
            maxLength = check[i];
            maxPoint = i;
        }
    }
    for (int i = 0; i <= V; i++)
    {
        check[i] = -1;
    }
    bfs(maxPoint);
    for (int i = 1; i <= V; i++)
    {
        if (maxLength < check[i])
        {
            maxLength = check[i];
            maxPoint = i;
        }
    }
    printf("%d\n", maxLength);
    return 0;
}
