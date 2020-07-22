// 단지번호붙히기

#include <stdio.h>
#include <vector>
#include <iostream>
#include <string>
#include <algorithm>
#include <queue>

using namespace std;
typedef pair<int, int> IntPair;
const int MAX_SIZE = 25;

int arr[MAX_SIZE][MAX_SIZE];
int check[MAX_SIZE][MAX_SIZE];
vector<int> ans;
int num = 1;

void bfs(int row, int column, int size)
{
    queue<IntPair> q;
    q.push(make_pair(row, column));
    check[row][column] = num;
    int rst = 0;
    while (!q.empty())
    {
        IntPair front = q.front();
        int row = front.first;
        int column = front.second;
        rst += 1;
        if (row - 1 >= 0)
        {
            if (arr[row - 1][column] > 0 && check[row - 1][column] == 0)
            {
                q.push(make_pair(row - 1, column));
                check[row - 1][column] = num;
            }
        }

        if (row + 1 < size)
        {
            if (arr[row + 1][column] > 0 && check[row + 1][column] == 0)
            {
                q.push(make_pair(row + 1, column));
                check[row + 1][column] = num;
            }
        }

        if (column - 1 >= 0)
        {
            if (arr[row][column - 1] > 0 && check[row][column - 1] == 0)
            {
                q.push(make_pair(row, column - 1));
                check[row][column - 1] = num;
            }
        }
        if (column + 1 < size)
        {
            if (arr[row][column + 1] > 0 && check[row][column + 1] == 0)
            {
                q.push(make_pair(row, column + 1));
                check[row][column + 1] = num;
            }
        }
        q.pop();
    }
    ans.push_back(rst);
}

int main()
{
    int N;
    scanf("%d", &N);

    for (int i = 0; i < N; i++)
    {
        string s;
        cin >> s;
        for (int j = 0; j < N; j++)
        {
            arr[i][j] = s[j] - '0';
        }
    }

    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            if (arr[i][j] > 0 && check[i][j] == 0)
            {
                bfs(i, j, N);
                num++;
            }
        }
    }

    printf("%d\n", num - 1);
    sort(ans.begin(), ans.end());

    for (int i = 0; i < ans.size(); i++)
    {
        printf("%d\n", ans[i]);
    }

    return 0;
}