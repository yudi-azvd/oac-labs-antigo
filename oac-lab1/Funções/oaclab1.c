#include <stdio.h>
#include <math.h>

int fatorial(int n)
{
    int total = 1;
    int i = 0;
    for (i = n; n > 1; n--)
    {
        total = total * (n);
    }
    return total;
}

float mypow(float x, int y)
{
    float temp;
    if (y == 0)
        return 1;
    temp = powf(x, y / 2);
    if (y % 2 == 0)
        return temp * temp;
    else
    {
        if (y > 0)
            return x * temp * temp;
        else
            return (temp * temp) / x;
    }
}

float calculaCos(float x)
{
    int const1 = -1;
    float soma = 0;

    for (int i = 0; i < 10; i++)
    {
        soma += ((powf(const1, i)) / fatorial(2 * i)) * powf(x, 2 * i);
    }

    return soma;
}

float calculaSin(float x)
{
    float sum, t;
    x = x * 3.14159 / 180;
    t = x;
    sum = x;
    for (int i = 1; i < 20 + 1; i++)
    {
        t = (t * mypow((double)(-1), (double)(2 * i - 1)) *
             x * x) /
            (2 * i * (2 * i + 1));
        sum = sum + t;
    }
    return sum;
}

float rad(float graus)
{
    return (graus * (2 * 3.1415926)) / 360;
}

void calculapontos(int r, int a, int p)
{
    for (int i = 0; i < p; i++)
    {
        float x = r * calculaCos(rad(a));
        float y = r * calculaSin(rad(a));
        //printf("x%d: %f y%d: %f\n", i + 1, x, i + 1, y);
        printf("x%d: %f\n", i + 1, x);
        //printf("sen %f = %f\n", rad(a), calculaSin(rad(a)));
        a = (a + (360 / p)) % 360;
    }
}

int main()
{

    //float cos = 0.69593;
    //float sin = 0.69593;
    //printf("%.8f\n", calculaCosBhaskara(cos));
    //printf("%.8f\n", calculaSinBhaskara(sin));
    int r = 110;
    float a = 45;
    int p = 6;

    calculapontos(r, a, p);
}
