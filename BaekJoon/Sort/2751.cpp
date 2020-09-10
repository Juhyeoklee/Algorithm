#include <cstdio>
int a[1000000];
int b[1000000];
void swap(int &x, int &y)
{
    int z = x;
    x = y;
    y = z;
}
void merge(int start, int end)
{
    int mid = (start + end) / 2;
    int i = start;
    int j = mid + 1;
    int k = 0;
    while (i <= mid && j <= end)
    {
        if (a[i] <= a[j])
        {
            b[k++] = a[i++];
        }
        else
        {
            b[k++] = a[j++];
        }
    }
    while (i <= mid)
    {
        b[k++] = a[i++];
    }
    while (j <= end)
    {
        b[k++] = a[j++];
    }
    for (int i = start; i <= end; i++)
    {
        a[i] = b[i - start];
    }
}
void sort(int start, int end)
{
    if (start == end)
    {
        return;
    }
    int mid = (start + end) / 2;
    sort(start, mid);
    sort(mid + 1, end);
    merge(start, end);
}
int main()
{
    int n;
    scanf("%d", &n);
    for (int i = 0; i < n; i++)
    {
        scanf("%d", &a[i]);
    }
    sort(0, n - 1);
    for (int i = 0; i < n; i++)
    {
        printf("%d\n", a[i]);
    }
    return 0;
}