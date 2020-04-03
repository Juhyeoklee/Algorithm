#include <stdio.h>
#include <iostream>

using namespace std;

class Stack
{
public:
    Stack();
    ~Stack();
    void push(int num);
    int pop();
    int size();
    int empty();
    int top();

private:
    int *data;
    int capacity;
};

int main()
{
    Stack a;
    string func;
    int num;
    int times;
    int result;
    cin >> times;

    for (int i = 0; i < times; i++)
    {

        cin >> func;

        if (func == "push")
        {
            cin >> num;
            a.push(num);
        }
        else if (func == "pop")
        {
            result = a.pop();
        }
        else if (func == "size")
        {
            result = a.size();
        }
        else if (func == "empty")
        {
            result = a.empty();
        }
        else if (func == "top")
        {
            result = a.top();
        }

        if (func != "push")
        {
            cout << result << endl;
        }
    }
    return 0;
}

Stack::Stack()
{
    data = new int[10001];
    for (int i = 0; i < 10001; i++)
    {
        data[i] = -1;
    }
    capacity = 0;
}

Stack::~Stack()
{
    delete[] data;
}

void Stack::push(int num)
{
    data[capacity] = num;
    capacity++;
}

int Stack::pop()
{
    if (this->empty() == 1)
    {
        return -1;
    }

    int popNum = data[capacity - 1];
    data[capacity - 1] = -1;
    capacity--;

    return popNum;
}

int Stack::size()
{
    return capacity;
}

int Stack::empty()
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

int Stack::top()
{
    if (this->empty())
    {
        return -1;
    }
    else
    {
        return data[capacity - 1];
    }
}
