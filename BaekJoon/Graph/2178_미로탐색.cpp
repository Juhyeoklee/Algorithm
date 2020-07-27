#include <stdio.h>
#include <iostream>
#include <queue>
#include <vector>

using namespace std;

typedef vector<int> IntVector;
typedef pair<int, int> IntPair;

int map[101][101];
int check[101][101];
int count = 0;

void bfs(IntPair end)
{
    queue<IntPair> q;
    q.push(make_pair(0, 0));
    check[0][0] = 1;

    while (!q.empty())
    {
        IntPair front = q.front();
        int row = front.first;
        int column = front.second;
        int beforeCount = check[row][column];

        if (row - 1 >= 0)
        {
            if (map[row - 1][column] == 1 && check[row - 1][column] == 0)
            {
                q.push(make_pair(row - 1, column));
                check[row - 1][column] = beforeCount + 1;
            }
        }

        if (row + 1 <= end.first)
        {
            if (map[row + 1][column] > 0 && check[row + 1][column] == 0)
            {
                q.push(make_pair(row + 1, column));
                check[row + 1][column] = beforeCount + 1;
            }
        }

        if (column - 1 >= 0)
        {
            if (map[row][column - 1] > 0 && check[row][column - 1] == 0)
            {
                q.push(make_pair(row, column - 1));
                check[row][column - 1] = beforeCount + 1;
            }
        }
        if (column + 1 <= end.second)
        {
            if (map[row][column + 1] > 0 && check[row][column + 1] == 0)
            {
                q.push(make_pair(row, column + 1));
                check[row][column + 1] = beforeCount + 1;
            }
        }
        q.pop();
    }
}

int main()
{
    int N, M;
    scanf("%d%d", &N, &M);

    for (int i = 0; i < N; i++)
    {
        string s;
        cin >> s;
        for (int j = 0; j < M; j++)
        {
            map[i][j] = s[j] - '0';
        }
    }

    bfs(make_pair(N, M));
    // for (int i = 0; i < N; i++)
    // {
    //     for (int j = 0; j < M; j++)
    //     {
    //         printf("%d\t", check[i][j]);
    //     }
    //     printf("\n");
    // }

    printf("%d\n", check[N - 1][M - 1]);

    return 0;
}