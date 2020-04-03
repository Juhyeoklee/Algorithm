#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <string>
using namespace std;

class Queue
{
public:
    Queue();
    ~Queue();
    void push(int n);
    int pop();
    int size();
    int empty();
    int front();
    int back();

private:
    int *data;
    int capacity;
};

int main()
{
    int times;
    string str;
    int num;
    Queue a;

    cin >> times;

    for (int i = 0; i < times; i++)
    {
        cin >> str;
        if (str == "push")
        {
            cin >> num;
            a.push(num);
        }
        else if (str == "pop")
        {
            cout << a.pop() << endl;
        }
        else if (str == "size")
        {
            cout << a.size() << endl;
        }
        else if (str == "empty")
        {
            cout << a.empty() << endl;
        }
        else if (str == "front")
        {
            cout << a.front() << endl;
        }
        else if (str == "back")
        {
            cout << a.back() << endl;
        }
    }

    return 0;
}

Queue::Queue()
{
    data = new int[100001];
    capacity = 0;
}

Queue::~Queue()
{
    delete[] data;
}

void Queue::push(int n)
{
    data[capacity] = n;
    capacity++;
}

int Queue::pop()
{
    int result;

    if (!this->empty())
    {
        result = data[0];

        for (int i = 1; i <= capacity; i++)
        {
            data[i - 1] = data[i];
        }
        capacity--;
    }
    else
    {
        result = -1;
    }

    return result;
}

int Queue::size()
{
    return capacity;
}

int Queue::empty()
{
    if (capacity == 0)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}
int Queue::front()
{
    if (this->empty())
    {
        return -1;
    }

    return data[0];
}

int Queue::back()
{
    if (this->empty())
    {
        return -1;
    }
    return data[capacity - 1];
}
