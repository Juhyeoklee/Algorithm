#include <stdio.h>
#include <iostream>
#include <queue>
#include <vector>

using namespace std;
typedef vector<int> IntVector;

const int MAX_SIZE = 100001;

vector<int> arr[MAX_SIZE];
int check[MAX_SIZE];
int parent[MAX_SIZE];

void bfs(int start)
{
    queue<int> q;
    q.push(start);
    check[start] = 1;
    parent[start] = -1;
    while (!q.empty())
    {
        int front = q.front();

        for (int i = 0; i < arr[front].size(); i++)
        {
            int des = arr[front][i];
            if (check[des] == 0)
            {
                q.push(des);
                check[des] = 1;
                parent[des] = front;
            }
        }
        q.pop();
    }
}

int main()
{
    int N;
    scanf("%d", &N);
    int len = N - 1;
    // IntVector iv;
    // arr.assign(N + 1, iv);
    while (len--)
    {

        int start, end;
        scanf("%d%d", &start, &end);

        arr[start].push_back(end);
        arr[end].push_back(start);
    }

    bfs(1);
    for (int i = 2; i <= N; i++)
    {
        printf("%d\n", parent[i]);
    }

    return 0;
}