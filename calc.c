/*
** EPITECH PROJECT, 2020
** nms
** File description:
** nms
*/

#include <stdio.h>
#include "yams.h"

double do_pair(char **str, char nb)
{
    int a = getOcc(str, nb);
    double value = binomial(a, 2) * 100.0;

    if (a >= 2)
        printf("Chances to get a %c pair: 100.00%%\n", nb);
    else 
        printf("Chances to get a %c pair: %.2lf%%\n", nb, value);
    return value;
}

double do_three(char **str, char nb)
{
    int a = getOcc(str, nb);
    double value = binomial(a, 3) * 100.0;

    if (a >= 3)
        printf("Chances to get a %c three-of-a-kind: 100.00%%\n", nb);
    else 
        printf("Chances to get a %c three-of-a-kind: %.2lf%%\n", nb, value);
    return value;
}

double do_four(char **str, char nb)
{
    int a = getOcc(str, nb);
    double value = binomial(a, 4) * 100.0;

    if (a >= 4)
        printf("Chances to get a %c four-of-a-kind: 100.00%%\n", nb);
    else 
        printf("Chances to get a %c four-of-a-kind: %.2lf%%\n", nb, value);
    return value;
}

double do_yams(char **str, char nb)
{
    int a = getOcc(str, nb);
    double value = binomial(a, 5) * 100.0;

    if (a >= 5)
        printf("Chances to get a %c yams: 100.00%%\n", nb);
    else 
        printf("Chances to get a %c yams: %.2lf%%\n", nb, value);
    return value;
}