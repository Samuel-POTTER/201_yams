/*
** EPITECH PROJECT, 2020
** nms
** File description:
** nms
*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "yams.h"

int fac(int a)
{
    if (a <= 1)
        return 1;
    return a * fac(a - 1);
}

int comb(int a, int b)
{
    return (fac(b) / (double)(fac(b - a) * fac(a)));
}

double binomial(int a, int b)
{
    double res = 0;

    for (int i = b - a; i != (5 - a + 1); i++)
        res += (comb(i, 5 - a) * pow(1 / 6.0, i) * pow((5 / 6.0), (5 - a - i)));
    return res;
}

int getOcc(char **str, char wanted)
{
    int cnt = 0;

    for (int i = 1; i < 6; i++) {
        if (str[i][0] == wanted)
            cnt++;
    }
    return cnt;
}
