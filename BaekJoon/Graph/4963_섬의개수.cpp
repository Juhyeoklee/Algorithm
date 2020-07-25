// 섬의 개수

#include <queue>
#include <iostream>
#include <stdio.h>
#include <vector>
#include <string>

using namespace std;

const int MAX_SIZE = 50;
typedef pair<int, int> IntPair;

int arr[MAX_SIZE][MAX_SIZE];
int check[MAX_SIZE][MAX_SIZE];

void initArr(int width, int height)
{
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            arr[i][j] = 0;
            check[i][j] = 0;
        }
    }
}
void bfs(int i, int j, int width, int height)
{
    // printf("%d %d\n", i, j);
    queue<IntPair> q;
    q.push(make_pair(i, j));
    check[i][j] = 1;

    while (!q.empty())
    {
        IntPair front = q.front();
        int row = front.first;
        int column = front.second;
        // printf("%d %d\n", row, column);
        if (row - 1 >= 0)
        {
            if (arr[row - 1][column] > 0 && check[row - 1][column] == 0)
            {
                q.push(make_pair(row - 1, column));
                check[row - 1][column] = 1;
            }
            if (column - 1 >= 0)
            {
                if (arr[row - 1][column - 1] == 1 && check[row - 1][column - 1] == 0)
                {
                    q.push(make_pair(row - 1, column - 1));
                    check[row - 1][column - 1] = 1;
                }
            }
            if (column + 1 < width)
            {
                if (arr[row - 1][column + 1] == 1 && check[row - 1][column + 1] == 0)
                {
                    q.push(make_pair(row - 1, column + 1));
                    check[row - 1][column + 1] = 1;
                }
            }
        }

        if (row + 1 < height)
        {
            if (arr[row + 1][column] > 0 && check[row + 1][column] == 0)
            {
                q.push(make_pair(row + 1, column));
                check[row + 1][column] = 1;
            }
            if (column - 1 >= 0)
            {
                if (arr[row + 1][column - 1] == 1 && check[row + 1][column - 1] == 0)
                {
                    q.push(make_pair(row + 1, column - 1));
                    check[row + 1][column - 1] = 1;
                }
            }
            if (column + 1 < width)
            {
                if (arr[row + 1][column + 1] == 1 && check[row + 1][column + 1] == 0)
                {
                    q.push(make_pair(row + 1, column + 1));
                    check[row + 1][column + 1] = 1;
                }
            }
        }

        if (column - 1 >= 0)
        {
            if (arr[row][column - 1] > 0 && check[row][column - 1] == 0)
            {
                q.push(make_pair(row, column - 1));
                check[row][column - 1] = 1;
            }
        }
        if (column + 1 < width)
        {
            if (arr[row][column + 1] > 0 && check[row][column + 1] == 0)
            {
                q.push(make_pair(row, column + 1));
                check[row][column + 1] = 1;
            }
        }
        q.pop();
    }
}
int main()
{
    vector<int> counts;

    while (1)
    {
        int w, h;
        scanf("%d%d", &w, &h);

        if (w == 0 && h == 0)
        {
            break;
        }

        for (int i = 0; i < h; i++)
        {
            for (int j = 0; j < w; j++)
            {
                scanf("%d", &arr[i][j]);
            }
        }

        int num = 0;

        for (int i = 0; i < h; i++)
        {
            for (int j = 0; j < w; j++)
            {
                if (check[i][j] == 0 && arr[i][j] == 1)
                {
                    num++;
                    bfs(i, j, w, h);
                }
            }
        }
        counts.push_back(num);
        initArr(w, h);
    }

    for (int i = 0; i < counts.size(); i++)
    {
        printf("%d\n", counts[i]);
    }

    return 0;
}
