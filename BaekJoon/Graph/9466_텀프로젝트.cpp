// 텀프로젝트

#include <stdio.h>
#include <vector>
#include <stack>

using namespace std;
typedef vector<int> IntVector;

const int MAX_SIZE = 100001;
int check[MAX_SIZE];
int arr[MAX_SIZE];
int cnt = 0;

void init(int size)
{
    cnt = 0;
    for (int i = 0; i < size + 1; i++)
    {
        check[i] = 0;
        arr[i] = 0;
    }
}

bool isInVector(vector<int> v, int num)
{
    vector<int>::iterator iter;
    for (iter = v.begin(); iter != v.end(); iter++)
    {
        if (*iter == num)
        {
            return true;
        }
    }
    return false;
}

void dfs(int start)
{
    int begin = start;
    int des = arr[start];
    int length = 1;
    check[start] = length;
    vector<int> v;
    v.push_back(begin);

    while (1)
    {
        if (check[des] != 0)
        {
            if (des != begin)
            {
                if (isInVector(v, des))
                {
                    cnt += (length + 1 - check[des]);
                }
                else
                {
                    cnt += 0;
                }
            }
            else
            {
                cnt += 1;
            }
            break;
        }
        length++;
        check[des] = length;
        begin = des;
        des = arr[des];
        v.push_back(begin);
    }
}

int main()
{
    int T;
    scanf("%d", &T);

    for (int i = 0; i < T; i++)
    {

        int N;
        scanf("%d", &N);
        init(N);
        for (int j = 1; j < N + 1; j++)
        {
            scanf("%d", &arr[j]);
        }
        for (int j = 1; j < N + 1; j++)
        {
            if (check[j] == 0)
            {
                dfs(j);
            }
        }
        printf("%d\n", N - cnt);
        init(N);
    }

    return 0;
}