#include <vector>
#include <stdio.h>
#include <queue>

using namespace std;
typedef vector<int> IntVector;

bool check[1001];

void bfs(int start, vector<IntVector> v)
{
    queue<int> q;
    q.push(start);

    while (!q.empty())
    {
        int front = q.front();
        for (int i = 0; i < v[front].size(); i++)
        {
            int des = v[front][i];
            if (!check[des])
            {
                q.push(des);
                check[des] = true;
            }
        }
        q.pop();
    }
}

int main()
{
    int N, M;
    int count = 0;
    scanf("%d %d", &N, &M);

    vector<IntVector> v(N + 1);

    for (int i = 0; i < M; i++)
    {
        int s, e;
        scanf("%d%d", &s, &e);

        v[s].push_back(e);
        v[e].push_back(s);
    }

    for (int i = 1; i <= N; i++)
    {
        if (!check[i])
        {
            count++;
            bfs(i, v);
        }
    }

    printf("%d\n", count);

    return 0;
}