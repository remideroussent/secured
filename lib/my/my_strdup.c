/*
** EPITECH PROJECT, 2024
** B-PSU-100-LIL-1-1-myls-mathys1.dupont
** File description:
** my_strdup.c
*/

#include "my.h"

char *my_strdup(char const *src)
{
    char *str = malloc(sizeof(char) * my_strlen(src) + 1);
    int i;

    if (!str)
        return NULL;
    for (i = 0; src[i]; i++)
        str[i] = src[i];
    str[i] = '\0';
    return str;
}
