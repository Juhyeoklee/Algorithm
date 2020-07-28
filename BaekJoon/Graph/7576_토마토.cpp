#include <vector>
#include <iostream>
#include <queue>
// #include

using namespace std;
typedef pair<int, int> IntPair;

int arr[1001][1001];
int check[1001][1001];
queue<IntPair> q;

int day = 1;

void bfs(IntPair size)
{
    while (1)
    {
        int qSize = q.size();

        day++;

        for (int i = 0; i < qSize; i++)
        {
            IntPair front = q.front();
            int row = front.first;
            int column = front.second;

            if (row - 1 >= 0)
            {
                if (check[row - 1][column] == 0)
                {
                    q.push(make_pair(row - 1, column));
                    check[row - 1][column] = day;
                }
            }

            if (row + 1 <= size.first)
            {
                if (check[row + 1][column] == 0)
                {
                    q.push(make_pair(row + 1, column));
                    check[row + 1][column] = day;
                }
            }

            if (column - 1 >= 0)
            {
                if (check[row][column - 1] == 0)
                {
                    q.push(make_pair(row, column - 1));
                    check[row][column - 1] = day;
                }
            }
            if (column + 1 <= size.second)
            {
                if (check[row][column + 1] == 0)
                {
                    q.push(make_pair(row, column + 1));
                    check[row][column + 1] = day;
                }
            }

            q.pop();
        }

        if (q.empty())
        {
            break;
        }
    }

    day -= 2;
}

int checkResult(IntPair size)
{
    for (int i = 0; i <= size.first; i++)
    {
        for (int j = 0; j <= size.second; j++)
        {
            if (check[i][j] == 0)
            {
                return -1;
            }
        }
    }

    return day;
}

int main()
{

    int M, N;

    scanf("%d%d", &N, &M);

    for (int i = 0; i < M; i++)
    {
        for (int j = 0; j < N; j++)
        {
            scanf("%d", &arr[i][j]);

            if (arr[i][j] == -1)
            {
                check[i][j] = -1;
            }

            else if (arr[i][j] == 1)
            {
                q.push(make_pair(i, j));
                check[i][j] = day;
            }
        }
    }

    if (1 == checkResult(make_pair(M - 1, N - 1)))
    {
        printf("0\n");
        return 0;
    }

    bfs(make_pair(M - 1, N - 1));

    // for (int i = 0; i < M; i++)
    // {
    //     for (int j = 0; j < N; j++)
    //     {
    //         printf("%d\t", check[i][j]);
    //     }
    //     printf("\n");
    // }

    printf("%d\n", checkResult(make_pair(M - 1, N - 1)));

    return 0;
}