#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void wrongCpy(char *s, char *t)
{
    char *r;
    strcpy(r, s);
    strcat(r, t);
    printf("%s", r);
}

void wrong2Cpy(char *s, char *t)
{
    char *r;
    int len = strlen(s) + strlen(t);
    r = (char *)malloc(len);
    strcpy(r, s);
    strcat(r, t);
    printf("%s", r);
}

void correctCpy(char *s, char *t)
{
    char r[100];
    strcpy(r, s);
    strcat(r, t);
    printf("%s", r);
}

void correct2Cpy(char *s, char *t)
{
    char *r;
    int len = strlen(s) + strlen(t) + 1;
    r = (char *)malloc(len);
    if (!r)
    {
        printf("Wrong");
    }
    strcpy(r, s);
    strcat(r, t);
    printf("%s", r);
    free(r);
}

void main()
{
    char *s = "hello ";
    char *t = "world";
    wrong2Cpy(s, t);
}