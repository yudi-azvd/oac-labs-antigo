#include <stdio.h>

float exps(float a, int t)
{
    float r = 1;
    for (; t > 0; t--)
        r *= (float)a / t;
    return r;
}

float seno(float r)
{
    int n = 0;
    int neg = -1;
    float result = 0;
    for (; n <= 10; n++)
        result += (n % 2 == 0 ? 1 : -1) * (exps(r, 2 * n + 1));
    return result;
}

float coseno(float r)
{
    int n = 0;
    int neg = -1;
    float result = 0;
    for (; n <= 10; n++)
        result += (n % 2 == 0 ? 1 : -1) * (exps(r, 2 * n));
    return result;
}

float rad(float graus)
{
    return (graus * (2 * 3.1415926)) / 360;
}

void calculapontos(int r, int a, int p)
{
    for (int i = 0; i < p; i++)
    {
        float x = r * coseno(rad(a));
        float y = r * seno(rad(a));
        a = (a + (360 / p)) % 360;
    }
}

int main()
{
    int r = 100;
    float a = 90;
    int p = 3;
    calculapontos(r, a, p);
}
