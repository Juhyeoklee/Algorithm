#include <stdio.h>
#include <iostream>
#include <string>

using namespace std;

class Deque
{
public:
    Deque();
    ~Deque();
    void push_front(int n);
    void push_back(int n);
    int pop_front();
    int pop_back();
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
    int times, num;
    string cmd;
    Deque dq;

    cin >> times;

    for (int i = 0; i < times; i++)
    {
        cin >> cmd;

        if (cmd == "push_back")
        {
            cin >> num;
            dq.push_back(num);
        }
        else if (cmd == "push_front")
        {
            cin >> num;
            dq.push_front(num);
        }
        else if (cmd == "pop_back")
        {
            cout << dq.pop_back() << endl;
        }
        else if (cmd == "pop_front")
        {
            cout << dq.pop_front() << endl;
        }
        else if (cmd == "empty")
        {
            cout << dq.empty() << endl;
        }
        else if (cmd == "size")
        {
            cout << dq.size() << endl;
        }
        else if (cmd == "front")
        {
            cout << dq.front() << endl;
        }
        else if (cmd == "back")
        {
            cout << dq.back() << endl;
        }
    }
    return 0;
}

Deque::Deque()
{
    data = new int[10001];
    capacity = 0;
}

Deque::~Deque()
{
    delete[] data;
}

void Deque::push_back(int n)
{
    data[capacity] = n;
    capacity++;
}

void Deque::push_front(int n)
{
    int *tmp = new int[10001];
    tmp[0] = n;
    capacity++;

    for (int i = 1; i <= capacity; i++)
    {
        tmp[i] = data[i - 1];
    }

    delete[] data;
    data = tmp;
}

int Deque::pop_back()
{
    if (this->empty())
    {
        return -1;
    }

    int *tmp = new int[10001];
    int result = data[capacity - 1];

    capacity--;
    for (int i = 0; i < capacity; i++)
    {
        tmp[i] = data[i];
    }

    delete[] data;
    data = tmp;

    return result;
}

int Deque::pop_front()
{
    if (this->empty())
    {
        return -1;
    }

    int *tmp = new int[10001];
    int result = data[0];

    for (int i = 1; i <= capacity; i++)
    {
        tmp[i - 1] = data[i];
    }
    capacity--;
    delete[] data;
    data = tmp;

    return result;
}

int Deque::size()
{
    return capacity;
}

int Deque::empty()
{
    if (!capacity)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

int Deque::front()
{
    if (this->empty())
    {
        return -1;
    }

    return data[0];
}

int Deque::back()
{
    if (this->empty())
    {
        return -1;
    }

    return data[capacity - 1];
}

/*
    void push_front(int n);
    void push_back(int n);
    int pop_front();
    int pop_back();
    int size();
    int empty();
    int front();
    int back();
push_front X: 정수 X를 덱의 앞에 넣는다.
push_back X: 정수 X를 덱의 뒤에 넣는다.
pop_front: 덱의 가장 앞에 있는 수를 빼고, 그 수를 출력한다. 만약, 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.
pop_back: 덱의 가장 뒤에 있는 수를 빼고, 그 수를 출력한다. 만약, 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.
size: 덱에 들어있는 정수의 개수를 출력한다.
empty: 덱이 비어있으면 1을, 아니면 0을 출력한다.
front: 덱의 가장 앞에 있는 정수를 출력한다. 만약 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.
back: 덱의 가장 뒤에 있는 정수를 출력한다. 만약 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.
*/
