#include <stdio.h>
#include <iostream>

using namespace std;

int arr[27][2];

void preOrder(int start)
{
    printf("%c", start + 'A');
    if (arr[start][0] != 0)
    {
        preOrder(arr[start][0]);
    }

    if (arr[start][1] != 0)
    {
        preOrder(arr[start][1]);
    }
}
void inOrder(int start)
{
    if (arr[start][0] != 0)
    {
        inOrder(arr[start][0]);
    }
    printf("%c", start + 'A');

    if (arr[start][1] != 0)
    {
        inOrder(arr[start][1]);
    }
}
void postOrder(int start)
{

    if (arr[start][0] != 0)
    {
        postOrder(arr[start][0]);
    }
    if (arr[start][1] != 0)
    {
        postOrder(arr[start][1]);
    }
    printf("%c", start + 'A');
}

int main()
{
    int N;
    scanf("%d", &N);
    for (int i = 0; i < N; i++)
    {
        char c1, c2, c3;

        cin >> c1 >> c2 >> c3;
        if (c2 == '.')
        {
            arr[c1 - 'A'][0] = 0;
        }
        else
        {
            arr[c1 - 'A'][0] = c2 - 'A';
        }

        if (c3 == '.')
        {
            arr[c1 - 'A'][1] = 0;
        }
        else
        {
            arr[c1 - 'A'][1] = c3 - 'A';
        }
    }

    preOrder(0);
    printf("\n");
    inOrder(0);
    printf("\n");
    postOrder(0);
    printf("\n");

    return 0;
}