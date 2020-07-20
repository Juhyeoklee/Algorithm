#include <stdio.h>
#include <vector>
#include <stack>

using namespace std;
typedef vector<int> IntVector;
const int MAX_NUM_SIZE = 1001;

int v[MAX_NUM_SIZE];
bool check[MAX_NUM_SIZE];
int ans = 0;

void initVar()
{
    for (int i = 0; i < MAX_NUM_SIZE; i++)
    {
        v[i] = 0;
        check[i] = false;
    }
    ans = 0;
}

int getUnvisitedVertex(int size)
{
    int ans = -1;
    for (int i = 1; i <= size; i++)
    {
        if (!check[i])
        {
            ans = i;
            break;
        }
    }

    return ans;
}

void dfs(int start, int size)
{
    stack<int> s;
    check[start] = true;
    s.push(start);

    while (!s.empty())
    {
        int st = s.top();
        check[st] = true;

        int des = v[st];
        if (!check[des])
        {
            s.push(des);
            check[des] = true;
        }
        else
        {
            int n = getUnvisitedVertex(size);
            if (n != -1)
            {
                ans++;
                // printf("\n des :%d , %d push\n", des, n);
                s.push(n);
            }
            else
            {
                ans++;
                break;
            }
        }
    }
}

int main()
{
    int T, N;
    initVar();
    scanf("%d", &T);
    for (int i = 0; i < T; i++)
    {
        scanf("%d", &N);
        for (int j = 1; j <= N; j++)
        {
            scanf("%d", &v[j]);
        }
        dfs(1, N);
        printf("%d\n", ans);

        initVar();
    }

    return 0;
}