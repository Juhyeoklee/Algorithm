#include <queue>
#include <vector>
#include <stdio.h>
#include <set>
#include <iostream>

using namespace std;
typedef vector<int> IntVector;
set<int> hasedEdgeVertexSet[5];

int check[20001];
// bool hasedEdgeVertex[20001];
bool result = true;
// 0 : 방문 X
// 1 : 좌측에 있는데 방문 O
// 2 : 우측에 있는데 방문 O
int checkAllVisited(int size)
{
    int ans = -1;
    for (int i = 1; i <= size; i++)
    {
        if (check[i] == 0)
        {
            ans = i;
            break;
        }
    }
    return ans;
}

void bfs(int start, const vector<IntVector> v)
{
    queue<int> q;
    q.push(start);
    check[start] = 1;

    while (!q.empty())
    {
        int front = q.front();
        int position;

        if (check[front] == 1)
        {
            position = 2;
        }
        else if (check[front] == 2)
        {
            position = 1;
        }

        for (int i = 0; i < v[front].size(); i++)
        {
            int des = v[front][i];
            if (check[des] == 0)
            {
                check[des] = position;
                q.push(des);
            }
            else if (check[front] + check[des] != 3)
            {
                result = false;
                return;
            }
        }
        q.pop();
    }
}

void checkClear()
{
    for (int i = 0; i < 20001; i++)
    {
        check[i] = 0;
    }
}

int main()
{
    int K, V, E;
    vector<IntVector> vt[5];
    // K : 테스트 케이스 개수
    // V : 정점의 개수
    // E : 간선의 개수
    checkClear();
    scanf("%d", &K);
    for (int i = 0; i < K; i++)
    {
        scanf("%d%d", &V, &E);
        IntVector iv;
        vt[i].assign(V + 1, iv);
        int start, end;
        for (int j = 0; j < E; j++)
        {
            scanf("%d%d", &start, &end);
            vt[i][start].push_back(end);
            vt[i][end].push_back(start);
            hasedEdgeVertexSet[i].insert(start);
            hasedEdgeVertexSet[i].insert(end);
        }
    }

    for (int i = 0; i < K; i++)
    {
        vector<IntVector> checkVector = vt[i];
        set<int>::iterator iter;

        for (iter = hasedEdgeVertexSet[i].begin(); iter != hasedEdgeVertexSet[i].end(); iter++)
        {
            if (check[*iter] == 0)
            {
                bfs(*iter, checkVector);
            }
            if (result == false)
            {
                break;
            }
        }

        if (result)
        {
            printf("YES\n");
        }
        else
        {
            printf("NO\n");
        }

        checkClear();
        result = true;
    }
    return 0;
}
