#include <stdio.h>
#include <queue>
#include <stack>
#include <algorithm>

using namespace std;

bool check[1001];
typedef vector<int> IntVector;

void dfs(int p, vector<IntVector> v)
{
    stack<int> s;
    s.push(p);
    check[p] = true;
    printf("%d", p);

    while (!s.empty())
    {
        int x = s.top();

        bool hasDepth = false;
        for (int i = 0; i < v[x].size(); i++)
        {
            int y = v[x][i];

            if (check[y] == false)
            {
                hasDepth = true;
                printf(" %d", y);
                check[y] = true;
                s.push(y);
                break;
            }
        }
        if (!hasDepth)
        {
            s.pop();
        }
    }
    printf("\n");
}
void bfs(int p, vector<IntVector> v)
{
    queue<int> q;
    q.push(p);
    check[p] = true;
    printf("%d", p);

    while (!q.empty())
    {
        int x = q.front();
        for (int i = 0; i < v[x].size(); i++)
        {
            int n = v[x][i];
            if (check[n] == false)
            {
                q.push(n);
                check[n] = true;
                printf(" %d", n);
            }
        }
        q.pop();
    }
    printf("\n");
}

int main()
{
    // N : 정점의 개수
    // M : 간선의 개수
    // V : 탐색을 시작할 정점의 번호

    int N, M, V;
    scanf("%d %d %d", &N, &M, &V);
    vector<IntVector> arr(N + 1);
    for (int i = 0; i < M; i++)
    {
        int a, b;
        int tmp;
        scanf("%d %d", &a, &b);

        arr[a].push_back(b);
        arr[b].push_back(a);
    }
    for (int i = 0; i <= N; i++)
    {
        sort(arr[i].begin(), arr[i].end());
    }
    dfs(V, arr);
    for (int i = 0; i <= N; i++)
    {
        check[i] = false;
    }
    bfs(V, arr);

    return 0;
}