#include <stdio.h>
#include <iostream>
#include <stack>
#include <queue>
#include <vector>

using namespace std;

typedef pair<int, int> IntPair;

int map[101][101];
int check[101][101];
int landCount = 0;
int totalMinPath = 9999999;

void bfs(IntPair start, int size)
{
    landCount += 1;

    queue<IntPair> q;
    q.push(start);
    check[start.first][start.second] = landCount;

    while (!q.empty())
    {
        IntPair front = q.front();
        int row = front.first;
        int column = front.second;

        if (row - 1 >= 0)
        {
            if (map[row - 1][column] > 0 && check[row - 1][column] == 0)
            {
                q.push(make_pair(row - 1, column));
                check[row - 1][column] = landCount;
            }
        }

        if (row + 1 < size)
        {
            if (map[row + 1][column] > 0 && check[row + 1][column] == 0)
            {
                q.push(make_pair(row + 1, column));
                check[row + 1][column] = landCount;
            }
        }
        if (column - 1 >= 0)
        {
            if (map[row][column - 1] > 0 && check[row][column - 1] == 0)
            {
                q.push(make_pair(row, column - 1));
                check[row][column - 1] = landCount;
            }
        }
        if (column + 1 < size)
        {
            if (map[row][column + 1] > 0 && check[row][column + 1] == 0)
            {
                q.push(make_pair(row, column + 1));
                check[row][column + 1] = landCount;
            }
        }

        q.pop();
    }
}

void pathBfs(int size, int land)
{
    queue<IntPair> q;

    int pathCheck[size][size];
    int minPath = 9999999;

    for (int i = 0; i < size; i++)
    {
        for (int j = 0; j < size; j++)
        {
            if (check[i][j] > 0)
            {
                pathCheck[i][j] = -check[i][j];
            }
            else
            {
                pathCheck[i][j] = check[i][j];
            }
        }
    }

    int pathCount = 1;
    for (int i = 0; i < size; i++)
    {
        for (int j = 0; j < size; j++)
        {
            if (check[i][j] == land)
            {
                q.push(make_pair(i, j));
            }
        }
    }

    while (1)
    {
        int qSize = q.size();
        for (int i = 0; i < qSize; i++)
        {
            IntPair front = q.front();
            int row = front.first;
            int column = front.second;

            if (row - 1 >= 0)
            {
                if (pathCheck[row - 1][column] == 0)
                {
                    q.push(make_pair(row - 1, column));
                    pathCheck[row - 1][column] = pathCount;
                }
                else if (pathCheck[row - 1][column] != -land && pathCheck[row - 1][column] < 0)
                {
                    if (minPath > pathCount)
                    {
                        minPath = pathCount;
                    }
                }
            }

            if (row + 1 < size)
            {
                if (pathCheck[row + 1][column] == 0)
                {
                    q.push(make_pair(row + 1, column));
                    pathCheck[row + 1][column] = pathCount;
                }
                else if (pathCheck[row + 1][column] != -land && pathCheck[row + 1][column] < 0)
                {
                    if (minPath > pathCount)
                    {
                        minPath = pathCount;
                    }
                }
            }
            if (column - 1 >= 0)
            {
                if (pathCheck[row][column - 1] == 0)
                {
                    q.push(make_pair(row, column - 1));
                    pathCheck[row][column - 1] = pathCount;
                }
                else if (pathCheck[row][column - 1] != -land && pathCheck[row][column - 1] < 0)
                {
                    if (minPath > pathCount)
                    {
                        minPath = pathCount;
                    }
                }
            }
            if (column + 1 < size)
            {
                if (pathCheck[row][column + 1] == 0)
                {
                    q.push(make_pair(row, column + 1));
                    pathCheck[row][column + 1] = pathCount;
                }
                else if (pathCheck[row][column + 1] != -land && pathCheck[row][column + 1] < 0)
                {
                    if (minPath > pathCount)
                    {
                        minPath = pathCount;
                    }
                }
            }

            q.pop();
        }
        pathCount++;
        if (q.empty())
        {
            break;
        }
    }

    if (totalMinPath > minPath - 1)
    {
        totalMinPath = minPath - 1;
    }
}

int main()
{
    int N;
    scanf("%d", &N);

    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            scanf("%d", &map[i][j]);
        }
    }
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            if (map[i][j] > 0 && check[i][j] == 0)
            {
                bfs(make_pair(i, j), N);
            }
        }
    }

    for (int i = 1; i <= landCount; i++)
    {
        pathBfs(N, i);
    }

    printf("%d\n", totalMinPath);

    return 0;
}