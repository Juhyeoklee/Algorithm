#include <stdio.h>
#include <iostream>
#include <queue>
#include <vector>

using namespace std;
typedef pair<int, int> IntPair;

const int MAX_SIZE = 10001;
vector<IntPair> arr[MAX_SIZE];
int check[MAX_SIZE];

void bfs(int start)
{
    queue<int> q;
    q.push(start);
    check[start] = 0;

    while (!q.empty())
    {
        int front = q.front();
        q.pop();

        for (int i = 0; i < arr[front].size(); i++)
        {
            int des = arr[front][i].first;
            int weight = arr[front][i].second;

            if (check[des] < 0)
            {
                q.push(des);
                check[des] = check[front] + weight;
            }
        }
    }
}

int main()
{
    int N;
    scanf("%d", &N);

    for (int i = 0; i < N - 1; i++)
    {
        int parent, child, weight;
        scanf("%d", &parent);
        scanf("%d", &child);
        scanf("%d", &weight);
        arr[parent].push_back(make_pair(child, weight));
        arr[child].push_back(make_pair(parent, weight));
    }

    for (int i = 1; i <= N; i++)
    {
        check[i] = -1;
    }

    bfs(1);
    int maxPosition = 0;
    int maxLength = 0;

    for (int i = 1; i <= N; i++)
    {
        if (maxLength < check[i])
        {
            maxLength = check[i];
            maxPosition = i;
        }
        // printf("%d\n", check[i]);
    }
    for (int i = 1; i <= N; i++)
    {
        check[i] = -1;
    }
    bfs(maxPosition);
    maxLength = 0;
    for (int i = 1; i <= N; i++)
    {
        if (maxLength < check[i])
        {
            maxLength = check[i];
        }
        // printf("%d\n", check[i]);
    }
    printf("%d\n", maxLength);

    return 0;
}